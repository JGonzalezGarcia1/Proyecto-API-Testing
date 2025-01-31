Feature: Test for delete booking by ID from the API restfulbooker
  I as a user require the ability to delete a booking by its ID and validate the response

  Background:
   # * url url_booking

  @HappyPath
  Scenario: Delete booking by booking ID succesful
    Given def createBooking = call read('classpath:bookings/createBookings/createBooking.feature@CreateBooking')
    And def bookingid = createBooking.response.bookingid

    #Token de autenticación
    Given def auth_token = call read('classpath:bookings/authentication/createToken.feature')
    And header Cookie = 'token=' + auth_token.response.token
    And header Accept = 'application/json'

    #Eliminar la reserva
    Given path 'booking/' + bookingid
    When method DELETE
    Then status 201

  @DeleteWithoutAuth
  Scenario: Try to delte booking without authentication
    Given def createBooking = call read('classpath:bookings/createBookings/createBooking.feature@CreateBooking')
    And def bookingid = createBooking.response.bookingid

    Given path 'booking/' + bookingid
    And header Accept = 'application/json'
    When method DELETE
    Then status 403
    And match response == "Forbidden"

  @DeleteNonExistentBooking
  Scenario: Delete booking that does not exist
    Given path 'booking/%&/&('
    And def auth_token = call read('classpath:bookings/authentication/createToken.feature')
    And header Cookie = 'token=' + auth_token.response.token
    And header Accept = 'application/json'
    When method DELETE
    Then status 404
    And match response == "Not Found"

