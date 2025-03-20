Feature: Fake GraphQL Server CRUD Operation

  Background: base url
    * url 'http://localhost:3000/'

  Scenario: Fake GraphQL Server CRUD Test
  
    # create post
    Given def query = read('classpath:graphql/create_post_mutation.graphql')
    And def variables = read('classpath:graphql/create_post_mutation.json')
    And request { query: '#(query)', variables: '#(variables)' }
    When method post
    Then status 200
    Then match response.data.createPost.title == "title1"
    * def idValue = response.data.createPost.id
    * print 'idValue is:',idValue
    
    #get created post details
    Given def query = read('classpath:graphql/get_post_query.graphql')
    And def variables = read('classpath:graphql/get_post_query.json')
    * set variables.id = idValue
    * print 'idValue is:',idValue
    And request { query: '#(query)', variables: '#(variables)' }
    When method post
    Then status 200
    Then match response.data.Post.title == "title1"
    
    #update created post details
    Given def query = read('classpath:graphql/update_post_mutation.graphql')
    And def variables = read('classpath:graphql/update_post_mutation.json')
    * print 'idValue is:',idValue
    * set variables.id = idValue
    And request { query: '#(query)', variables: '#(variables)' }
    When method post
    Then status 200
    Then match response.data.updatePost.title == "title2"
    
    #delete created post details
    Given def query = read('classpath:graphql/delete_post_mutation.graphql')
    And def variables = read('classpath:graphql/delete_post_mutation.json')
    * print 'idValue is:',idValue
    * set variables.id = idValue
    And request { query: '#(query)', variables: '#(variables)' }
    When method post
    Then status 200
    Then match response.data.removePost.title == "title2"
