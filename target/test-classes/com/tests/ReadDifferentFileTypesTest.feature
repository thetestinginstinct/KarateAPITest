Feature: Read different file types using read function in karate

  Background: api end point url
    #* url 'http://localhost:3000/posts'
    #baseUrl value is coming from karate-config.js file added under class path.These variable values
    #added under this config file can be used across feature files in the project.
    * url baseUrl

  Scenario: Reading json file data and pass it in payload for post request
    #* def payload = read('classpath:testdata/create_post_testdata.json')
    #Given request payload
    #Above two lines can be simplified in to a single line given below
    Given request read('classpath:testdata/create_post_testdata.json')
    When method post
    Then status 201
    Then match $ == {title: "json-server",author: "typicode",id: #notnull}
    #read function can be used with match keyword as well to compare response
    Then match response == read('classpath:testdata/response.json')

  Scenario: Reading csv file data and pass it in payload for post request
    #* def payload = read('classpath:testdata/create_post_testdata.csv')
    #Given request payload[0]
    #Above two lines can be simplified in to a single line given below
    Given request read('classpath:testdata/create_post_testdata.csv')[0]
    When method post
    Then status 201
    Then match $ == {title: "json-server",author: "typicode",id: #notnull}

  Scenario: Reading yaml file data and pass it in payload for post request
    #* def payload = read('classpath:testdata/create_post_testdata.yaml')
    #Given request payload
    #Above two lines can be simplified in to a single line given below
    Given request read('classpath:testdata/create_post_testdata.yaml')
    When method post
    Then status 201
    Then match $ == {title: "json-server",author: "typicode",id: #notnull}
