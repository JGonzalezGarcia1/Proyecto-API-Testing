@ignore
Feature: Test for create Token for authentication and authorization of modificate, delete

  Background:
    # * url url_booking
    * header Content-Type = 'application/json'


  @CreateToken
  Scenario: Create token sucessful
    Given path 'auth'
    And request
     """
     {
      "username" : "admin",
      "password" : "password123"
     }
     """
    When method POST
    Then status 200
    And match response == { token: "#string"}