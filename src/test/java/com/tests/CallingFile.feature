Feature: Calling Feature

  Background: 
    * def result = callonce read('CalledFile.feature') {username: 'admin',password: 'password123'}
    * def tokenValue = result.response.token
    * print 'token value is:',tokenValue

  Scenario: Update Created Booking
    #create a new booking
    Given url 'https://restful-booker.herokuapp.com/booking'
    And header Accept = 'application/json'
    * def payload =
      """
      {
      "firstname" : "Jim",
      "lastname" : "Brown",
      "totalprice" : 111,
      "depositpaid" : true,
      "bookingdates" : {
          "checkin" : "2018-01-01",
          "checkout" : "2019-01-01"
      },
      "additionalneeds" : "Breakfast"
      }
      """
    And request payload
    When method post
    Then status 200
    * def bookingID = response.bookingid
    #updating created booking
    Given url 'https://restful-booker.herokuapp.com/booking'
    And path bookingID
    And header Accept = 'application/json'
    Given cookie token = tokenValue
    * def updatedPayload =
      """
      {
      "firstname" : "James",
      "lastname" : "Brown",
      "totalprice" : 111,
      "depositpaid" : true,
      "bookingdates" : {
          "checkin" : "2018-01-01",
          "checkout" : "2019-01-01"
      },
      "additionalneeds" : "Breakfast"
      }
      """
    And request updatedPayload
    When method put
    Then status 200

  
  Scenario: Delete Created Booking
    #create a new booking
    Given url 'https://restful-booker.herokuapp.com/booking'
    And header Accept = 'application/json'
    * def payload =
      """
      {
      "firstname" : "Jim",
      "lastname" : "Brown",
      "totalprice" : 111,
      "depositpaid" : true,
      "bookingdates" : {
          "checkin" : "2018-01-01",
          "checkout" : "2019-01-01"
      },
      "additionalneeds" : "Breakfast"
      }
      """
    And request payload
    When method post
    Then status 200
    * def bookingID = response.bookingid
    #deleting created booking
    Given url 'https://restful-booker.herokuapp.com/booking'
    And path bookingID
    And header Accept = 'application/json'
    Given cookie token = tokenValue
    When method delete
    Then status 201
