﻿using KidProjectServer.Config;
using KidProjectServer.Entities;
using KidProjectServer.Models;
using KidProjectServer.Util;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using Microsoft.SqlServer.Server;
using System.Globalization;
using System.IdentityModel.Tokens.Jwt;
using System.Reflection.Metadata;
using System.Security.Claims;
using System.Text;
using static System.Reflection.Metadata.BlobBuilder;

namespace KidProjectServer.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class FeedbackController : ControllerBase
    {
        private readonly DBConnection _context;
        private readonly IConfiguration _configuration;

        public FeedbackController(DBConnection context, IConfiguration configuration)
        {
            _context = context;
            _configuration = configuration;
        }

        [HttpPost]
        public async Task<ActionResult<IEnumerable<Feedback>>> CreateOrUpdateFeedback([FromForm] FeedbackFormValues feedbackDto)
        {
            Feedback feedback = await _context.Feedbacks.Where(p => p.UserID == feedbackDto.UserID && p.BookingID == feedbackDto.BookingID).FirstOrDefaultAsync();
            if(feedback == null)
            {
                feedback = new Feedback
                {
                    BookingID = feedbackDto.BookingID,
                    UserID = feedbackDto.UserID,
                    Rating = feedbackDto.Rating,
                    PartyID = feedbackDto.PartyID,
                    Comment = feedbackDto.Comment,
                    CreateDate = DateTime.UtcNow,
                    LastUpdateDate = DateTime.UtcNow,
                    Status = Constants.STATUS_ACTIVE
                };
                _context.Feedbacks.Add(feedback);

                //month statistic rating
                int currentMonth = DateTime.UtcNow.Month;
                int currentYear = DateTime.UtcNow.Year;
                Statistic monthStatistic = await _context.Statistics.Where(
                p => p.Month == currentMonth &&
                p.Year == currentYear &&
                p.Type == Constants.TYPE_RATING).FirstOrDefaultAsync();
                if (monthStatistic == null)
                {
                    monthStatistic = new Statistic
                    {
                        Month = currentMonth,
                        Year = currentYear,
                        Amount = 1,
                        Type = Constants.TYPE_RATING
                    };
                    _context.Add(monthStatistic);
                }
                else
                {
                    monthStatistic.Amount += 1;
                }
            }
            else
            {
                feedback.Comment = feedbackDto.Comment;
                feedback.Rating = feedbackDto.Rating;
            }
            await _context.SaveChangesAsync();

            Feedback[] feedbacks = await _context.Feedbacks.Where(p => p.PartyID == feedback.PartyID).ToArrayAsync();
            Party party = await _context.Parties.Where(p => p.PartyID == feedback.PartyID).FirstOrDefaultAsync();
            int totalRating = 0;
            foreach (Feedback feed in feedbacks)
            {
                totalRating += feed.Rating??0;
            }
            int ratingAvg = totalRating / feedbacks.Length;
            party.Rating = ratingAvg;
            await _context.SaveChangesAsync();

            return Ok(ResponseHandle<Feedback>.Success(feedback));
        }

        [HttpGet("byUserIDAndBooking/{userId}/{bookingId}")]
        public async Task<ActionResult<IEnumerable<Feedback>>> GetFeedbackByID(int userId,int bookingId)
        {
            Feedback feedback = await _context.Feedbacks.Where(p => p.UserID == userId && p.BookingID == bookingId).FirstOrDefaultAsync();
            return Ok(ResponseHandle<Feedback>.Success(feedback));
        }

        [HttpGet("byPartyId/{partyId}")]
        public async Task<ActionResult<IEnumerable<FeedbackDto>>> GetFeedbackByPartyID(int partyId)
        {
            var query = from feedbacks in _context.Feedbacks
                        join bookings in _context.Bookings on feedbacks.BookingID equals bookings.BookingID
                        join users in _context.Users on feedbacks.UserID equals users.UserID
                        where bookings.PartyID == partyId
                        select new FeedbackDto
                        {
                            FeedbackID = feedbacks.FeedbackID,
                            BookingID = feedbacks.BookingID,
                            Image = users.Image,
                            Rating = feedbacks.Rating,
                            Comment = feedbacks.Comment,
                            CreateDate = feedbacks.CreateDate
                        };
            FeedbackDto[] feedbacks1 = await query.ToArrayAsync();
            return Ok(ResponseArrayHandle<FeedbackDto>.Success(feedbacks1));
        }

    }
}

public class FeedbackFormValues
{
    public int? UserID { get; set; }
    public int? PartyID { get; set; }
    public int? BookingID { get; set; }
    public int? Rating { get; set; }
    public string? Comment { get; set; }
}

public class FeedbackDto
{
    public int? FeedbackID { get; set; }
    public int? BookingID { get; set; }
    public string? Image { get; set; }
    public int? Rating { get; set; }
    public string? Comment { get; set; }
    public DateTime? CreateDate { get; set; }

}