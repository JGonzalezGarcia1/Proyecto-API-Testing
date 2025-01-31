package bookings.updateBookings;

import com.intuit.karate.junit5.Karate;

public class UpdateBookingRunner {

    @Karate.Test
    Karate updateRunner() {
        return Karate.run("classpath:bookings/updateBookings/modifyBooking.feature");
    }
}
