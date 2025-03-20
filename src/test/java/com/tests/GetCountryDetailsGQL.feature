Feature: GraphQL Country Details Feature

  Scenario: GraphQL Country Details Scenario
    Given url "https://countries.trevorblades.com/"
    And text query =
      """
      query GetCountry {
      country(code: "IN") {
        name
        native
        capital
        emoji
        currency
        languages {
          code
          name
        }
      }
      }

      """
    And request {query:'#(query)'}
    When method post
    Then print 'response is',response
    Then status 200
    #To verify country name
    Then match response.data.country.name == 'India'
    #To verify country languages
    Then match response.data.country.languages[*].name == ['Hindi','English']
    #To verify response time
    Then assert responseTime < 1000
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
     
    
    
    
    
    
    
    
    
    
    
    
    
    
    
   
