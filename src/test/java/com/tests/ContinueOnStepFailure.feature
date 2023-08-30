Feature: continueOnStepFailure keyword soft assertion demo feature

  Background: api end point url
    #* url 'http://localhost:3000/posts'
    #baseUrl value is coming from karate-config.js file added under class path.These variable values
    #added under this config file can be used across feature files in the project.
    * url baseUrl
    * configure continueOnStepFailure = false

  Scenario: continueOnStepFailure keyword soft assertion demo scenario one
    #Given url 'http://localhost:3000/posts'
    * configure continueOnStepFailure = true
    Given request {"title": "json-server","author": "typicode"}
    When method post
    Then status 201
    Then match $ == {title: "json-server1",author: "typicode",id: #notnull}
    Then match response == {"title": "json-server","author": "typicode1","id": #ignore}
    Then match response $ == {"title": "json-server","author": "typicode","id": #notnull}
    Then assert responseTime < 3000

  Scenario: continueOnStepFailure keyword soft assertion demo scenario two
    #Given url 'http://localhost:3000/posts'
    * configure continueOnStepFailure = true
    Given request {"title": "json-server","author": "typicode"}
    When method post
    When status 201
    Then match $ == {title: "json-server1",author: "typicode",id: #notnull}
    Then match response == {"title": "json-server","author": "typicode1","id": #ignore}
    Then match response $ == {"title": "json-server","author": "typicode","id": #notnull}
    Then assert responseTime < 3000
