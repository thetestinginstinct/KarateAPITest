Feature: Fake GraphQL Server Feature

  Scenario: Fake GraphQL Create Post Mutation After Reading from files
    Given url "http://localhost:3000/"
    And def query = read('classpath:graphql/create_post_mutation.graphql')
    And def variables = read('classpath:graphql/create_post_mutation.json')
    And request {query:'#(query)',variables:'#(variables)'}
    When method post
    Then print 'response is',response
    Then status 200
    