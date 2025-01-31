Feature: Tests for all GET bookings and by id

  Background:
    # * url url_booking

  @HappyPath
  Scenario: Get All Bookings Successful
    Given path 'booking'
    When method GET
    Then status 200
    And print response
    And  match response[0].bookingid == '#number'
    And  match response[0].bookingid == '#notnull'

  @HappyPath
  Scenario: Get Booking by id Succesful
    Given def createBooking = call read('classpath:bookings/createBookings/createBooking.feature@CreateBooking')
    And def bookingid = createBooking.response.bookingid
    And path 'booking/' + bookingid
    And header Accept = 'application/json'
    When method GET
    Then status 200
    And match response == read("classpath:bookings/getBookings/ResponseBodyGetBooking.json")
    And match response == read("classpath:bookings/getBookings/ResponseSchemaGetBooking.json")

  Scenario Outline: Get booking with invalid IDs
    Given path 'booking/' + <bookingid>
    When method GET
    Then status <expectedStatus>

  Examples:
    | bookingid | expectedStatus |
    | -1817     | 404            |
    | '/&(/%'   | 404            |
    | '****'    | 404            |

  @InvalidHTTPMethod
  @Bug:se-esperaba-error-405-pero-se-recibió-404
  Scenario: Get booking whit valid Id but Invalid HTTP Method.
    Given  def createBooking = call read('classpath:bookings/createBookings/createBooking.feature@CreateBooking')
    And def bookingid = createBooking.response.bookingid
    And path 'booking/' + bookingid
    And header Accept = 'application/json'
    When method POST
    Then status 405
    #Bug: se esperaba error 405 pero se recibió 404

  @InvalidPath
  Scenario: Get booking incorrect path
    Given def createBooking = call read('classpath:bookings/createBookings/createBooking.feature@CreateBooking')
    And def bookingid = createBooking.response.bookingid
    And path 'bookingy/' + bookingid
    When method GET
    Then status 404

  @NonExistentID
  Scenario: Get booking with invaled ID
  Given path 'booking/***'
  And header Accept = 'application/json'
  When method GET
  Then status 404



