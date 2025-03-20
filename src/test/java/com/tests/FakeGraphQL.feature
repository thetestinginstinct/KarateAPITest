Feature: Fake GraphQL Server Feature

  Scenario: Fake GraphQL Create Post Mutation
    Given url "http://localhost:3000/"
    And text query =
      """
      mutation CreatePost {
      createPost(title: "title1", user_id: "1", views: 10) {
      id
      title
      user_id
      
      }
      }

      """
    And request {query:'#(query)'}
    When method post
    Then print 'response is',response
    Then status 200
