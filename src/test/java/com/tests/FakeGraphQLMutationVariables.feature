Feature: Fake GraphQL Server Feature

  Scenario: Fake GraphQL Create Post Mutation Using Variables
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
      "title":"title2",
      "views":2,
      "user_id":"2"
      }
      """
    And request {query:'#(query)',variables:'#(variables)'}
    When method post
    Then print 'response is',response
    Then status 200
