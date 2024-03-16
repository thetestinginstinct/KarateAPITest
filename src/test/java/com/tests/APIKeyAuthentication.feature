Feature: API Key Authentication Feature

  Scenario: API Key Authentication Scenario
    Given url 'https://api.openweathermap.org/data/2.5/weather'
    And param q = 'Kochi'
    #Replace appid value with you api key of your account in the next line
    And param appid = '2c658c27ad7ebb3b0b7bff7cc4455016'
    When method get
    Then print response
    Then status 200
