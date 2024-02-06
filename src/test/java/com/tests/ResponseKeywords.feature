Feature: Response keywords feature

  Scenario: responseStatus
    Given url 'https://reqres.in/api/users/2'
    When method get
    Then print 'response status is:', responseStatus
    Then match responseStatus == 200
    Then assert responseStatus == 200
    Then assert responseStatus == 200 || responseStatus == 204
    Then match responseStatus == 200 || responseStatus == 204

  Scenario: responseHeaders
    Given url 'https://reqres.in/api/users/2'
    When method get
    Then print 'response headers are:', responseHeaders
    Then print responseHeaders["Content-Type"][0]
    * match responseHeaders["Content-Type"][0] == "application/json; charset=utf-8"

  Scenario: responseType
    Given url 'https://reqres.in/api/users/2'
    When method get
    Then print 'response type is:', responseType
    * match responseType == "json"
