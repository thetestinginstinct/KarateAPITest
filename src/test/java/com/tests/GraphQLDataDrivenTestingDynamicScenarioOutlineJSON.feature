Feature: Data-Driven Testing GraphQL Mutation Dynamic Scenario Outline

  Scenario Outline: Data Driven Testing Dynamic Scenario Outline using JSON
    Given url "http://localhost:3000/"
    And text query =
      """
      mutation CreatePost($title: String!, $views: Int!, $user_id: ID!) {
      createPost(title: $title, views: $views, user_id: $user_id) {
      id
      title
      views
      user_id
      }
      }
      """
    And def variables =
      """
      {
      "title":'#(title)',
      "views":'#(views)',
      "user_id":'#(user_id)'
      }
      """
    And request {query:'#(query)',variables:'#(variables)'}
    When method post
    Then print 'response is',response
    Then status 200
    Then response.data.createPost.title = '#(title)'

    Examples: 
      | read('classpath:graphql/dynamic_scenario_outline.json') |
