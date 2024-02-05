Feature: JSON Schema Validation Feature

  Scenario: JSON Schema Validation Scenario
    Given url 'https://reqres.in/api/users?page=2'
    When method get
    And print 'response is', response
    * def dataSchemaExpected =
      """
      {
       "id": '#number',
       "email": '#string',
       "first_name": '#string',
       "last_name": '#string', 
       "avatar": '#string'
      } 
      """
    * def supportSchemaExpected =
      """
      { 
      "url": '#string',
      "text": '#string' 
      }
      """
    * def jsonSchemaExpected =
      """
      { 
      "page": "#number",
      "per_page": "#number",
      "total": "#number",
      "total_pages": "#number",
      "data": "#[6] dataSchemaExpected",
      "support": "#(supportSchemaExpected)" }
      """
    Then match response == jsonSchemaExpected
    
    
  Scenario: JSON Schema Validation Scenario read from json file
    Given url 'https://reqres.in/api/users/2'
    When method get
    And print 'response is', response
    * def jsonSchemaExpected = read('classpath:testdata/JSONSchema.json')
    Then match response == jsonSchemaExpected
