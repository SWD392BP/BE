﻿namespace KidProjectServer.Models
{
    static public class Constants
    {
        /*STATUS ACTIVE*/
        static public string STATUS_ACTIVE = "Active";
        static public string STATUS_INACTIVE = "Inactive";

        /* STATISTIC TYPE */
        static public string TYPE_VIEW = "View";
        static public string TYPE_RATING = "Rating";
        static public string TYPE_BOOKING_PAID = "BookingPaid";
        static public string TYPE_PACKAGE_PAID = "PackagePaid";
        static public string TYPE_REVENUE_BOOKING = "Revenue";
        static public string TYPE_REVENUE_PACKAGE = "RevenuePackage";
        static public string[] TYPE_REVENUE_LIST = { TYPE_VIEW, TYPE_RATING, TYPE_BOOKING_PAID, TYPE_PACKAGE_PAID };

        /* FEEDBACK TYPE */
        static public string TYPE_FEEDBACK = "Feedback";
        static public string TYPE_REPLY = "Reply";

        /*BOOKING STATUS*/
        static public string BOOKING_STATUS_CREATE = "Create";
        static public string BOOKING_STATUS_PAID = "Paid";
        static public string BOOKING_STATUS_DONE = "Done";
        static public string BOOKING_STATUS_CANCEL = "Cancel";

        /*ROLE NAME*/
        static public string ROLE_USER = "User";
        static public string ROLE_HOST = "Host";
        static public string ROLE_ADMIN = "Admin";

        /*ROLE NAME*/
        static public string STATUS_CODE_OK = "01";
        static public string STATUS_CODE_ERROR = "02";
        static public string MESSAGE_SUCCESS = "Data transaction success";
    }
}
