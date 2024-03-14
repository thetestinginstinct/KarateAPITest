Feature: Bearer Token Authentication Feature

  Background: Hitting the api that will generate token
    * url 'https://airportgap.com/api/tokens'
    * request {"email": "cyrilgeorge153@gmail.com","password": "password"}
    * method post
    * print 'response is:', response
    * def token = response.token
    * header Authorization = 'Bearer ' + token

  Scenario: Bearer Token Authentication Scenario
    Given url 'https://airportgap.com/api/favorites'
    When method get
    And print 'response is:', response
    Then status 200
