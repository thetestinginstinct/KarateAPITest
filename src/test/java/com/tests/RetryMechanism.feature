Feature: Retry Mechanism Feature

  Background: 
    * configure retry = { count: 5, interval: 2000 }

  @ignore
  Scenario: Retry Mechanism Scenario1
    Given url 'https://reqres.in/api/users/2'
    And retry until response.id > 10
    When method get
    Then status 200

  Scenario: Retry Mechanism Scenario2
    Given url 'https://reqres.in/api/users/2'
    And retry until responseStatus == 200 && response.id > 10
    When method get
    Then status 200
