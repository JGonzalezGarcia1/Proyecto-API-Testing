Feature: Test for modify booking by id of the API restfulbooker

I as user require put booking by id for validate integrity of the response

  Background:
    # * url url_booking

  @HappyPath
  Scenario: Modify Booking by Bookingid Succesful
    Given def createBooking = call read('classpath:bookings/createBookings/createBooking.feature@CreateBooking')
    And def bookingid = createBooking.response.bookingid
    Given path 'booking/' + bookingid

    #Token
    And def auth_token = call read('classpath:bookings/authentication/createToken.feature')
    And header Cookie = 'token=' + auth_token.response.token
    And header Content-Type = 'application/json'
    And header Accept = 'application/json'

    And def requestDataJson = read('classpath:bookings/updateBookings/RequestBodyUpdateBooking.json')
    And request requestDataJson

    When method PUT
    Then status 200

  Scenario Outline: modify booking with invalid data
    Given def createBooking = call read('classpath:bookings/createBookings/createBooking.feature@CreateBooking')
    And def bookingid = createBooking.response.bookingid
    Given path 'booking/' + bookingid

    #Token
    And def auth_token = call read('classpath:bookings/authentication/createToken.feature')
    And header Cookie = 'token=' + auth_token.response.token
    And header Content-Type = 'application/json'
    And header Accept = 'application/json'


    When method PUT
    Then status <expectedStatus>

    Examples:
      | firstname | lastname | totalprice | depositpaid | expectedStatus |
      | "Nelcy"   | "Romo"   | 999        | yes         | 400            |
      | ""        | "Montes" | 400        | false       | 400            |
      | "Luis"    | ""       | 700        | true        | 400            |
      | "Nailin"  | "Ortega" | "invalid"  | true        | 400            |

  @MissingAuth
  Scenario: Modify booking without authentication
    Given def createBooking = call read('classpath:bookings/createBookings/createBooking.feature@CreateBooking')
    And def bookingid = createBooking.response.bookingid
    Given path 'booking/' + bookingid
    And header Content-Type = 'application/json'
    And header Accept = 'application/json'
    And def requestDataJson = read('classpath:bookings/updateBookings/RequestBodyUpdateBooking.json')
    And request requestDataJson
    When method PUT
    Then status 403







    
