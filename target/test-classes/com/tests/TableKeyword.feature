Feature: table keyword demo data driven testing feature

  Scenario: table keyword demo data driven testing scenario
    #table keyword can be used for passing different sets of payload to
    #test negative and positive cases. Mixing of data sets with both
    #negative and positive scenarios is not recommended. Always prefer
    #seperate scenarios for negative and positive cases
    * table posts
      | title    | author    |
      | 'title7' | 'author7' |
      | 'title8' | 'author8' |
      | 'title9' | 'author9' |
    #calling a feature file using call keyword
    #* call read('DDTUsingTableKeyword.feature') posts
    #Below two lines are equivalent, since called scenario is from same feature file, it is ok
    #ignore feature file name or can be mentioned as well. Both options are fine.
    #notice the use of tag '@post'while calling the scenario using call keyword
    * call read('@post') posts
    #* call read('TableKeyword.feature@post') posts

  
  @ignore @post
  Scenario: create a new post
    Given url 'http://localhost:3000/posts'
    #payload data will be provided from TableKeyword.feature file under com.tests package
    #embedded expressions is used to pass payload with request keyword
    Given request {"title": '#(title)',"author": '#(author)'}
    When method post Then status 201
    #embedded expressions can also be used with match keyword for assertion
    Then match $ == {title: '#(title)',author: '#(author)',id: #notnull}
