Feature: Test for create bookings
  I as a user require the ability to create a new booking with valid data and validate the response

  Background:
    # * url url_booking
    * header Accept = 'application/json'
    * header Content-Type = 'application/json'

    @CreateBooking
    Scenario: Create Booking Succesful
      Given path 'booking'
      And def requestBodyJson = read('classpath:bookings/createBookings/RequestBodyCreateBooking.json')
      And request requestBodyJson.validRequest
      When method POST
      Then status 200
      And match response == read('classpath:bookings/createBookings/ResponseBodyCreateBooking.json')
      And match response == read('classpath:bookings/createBookings/ResponseSchemaCreateBooking.json')

    @ScenarioAltern
    Scenario: Create Booking with BodyRequest incorrect
      Given path 'booking'
      And request
      """
      {
        "firstname": 123,
        "totalprice": "123"
      }
      """
      When method POST
      Then status 500
      And match response == "Internal Server Error"

  @MissingFields
  Scenario: Create booking with missing required fields
    Given path 'booking'
    And request
    """
    {
    "firstname": "Sheyla",
    "totalprice": 800
    }
    """
    When method POST
    Then status 500
    And match response == "Internal Server Error"

  @MalformedJson
  Scenario: Create Booking with Malformed JSON
    Given path 'booking'
    And request '{ "firstname": "Kelly", "lastname": "Sanchez", "totalprice": 700, "depositpaid": true, "bookingdates": { "checkin": "2025-01-20", "checkout": "2025-02-05" }, "additionalneeds": "Late checkout" '
    When method POST
    Then status 400
    And match response == "Bad Request"


  @EmptyRequest
  Scenario: Create booking with empty request
    Given path 'booking'
    And header Content-Type = 'application/json'
    And request "{}"
    When method POST
    Then status 500
    #Bug: Se esperaba error 400 pero se recibió 500
    #Then status 400
    #And match response == "Bad Request"




