package com.modnsolutions.moviemanager.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class Utilities {
    /**
     * Extra year from date string
     *
     * @param dateString
     * @return
     * @throws ParseException
     */
    public static String formatDate(String dateString) throws ParseException {
        String[] months = { "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct",
                "Nov", "Dec" };

        Date date = new SimpleDateFormat("yyyy-MM-dd").parse(dateString);
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);

        return months[calendar.get(Calendar.MONTH)] + " " + calendar.get(Calendar.YEAR);
    }

    /**
     * Convert minutes to string time.
     *
     * @param minutes
     * @return
     */
    public static String convertMinutesToStringTime(int minutes) {
        StringBuilder runtimeString = new StringBuilder();

        int hrs = (int) Math.floor(minutes / 60f);
        int mins = minutes - (hrs * 60);

        if (hrs > 1) runtimeString.append(hrs + " hrs ");
        else if (hrs == 1) runtimeString.append(hrs + " hr ");

        if (mins > 1) runtimeString.append(mins + " mins");
        else if (mins == 1) runtimeString.append(mins + " min");

        return runtimeString.toString();
    }
}
