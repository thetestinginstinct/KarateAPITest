@ignore
Feature: DDTUsingTableKeyword demo feature

  Background: api end point url
    * url 'http://localhost:3000/posts'

  Scenario: create a new post
    #Given url 'http://localhost:3000/posts'
    #payload data will be provided from TableKeyword.feature file under com.tests package
    #embedded expressions is used to pass payload with request keyword
    Given request {"title": '#(title)',"author": '#(author)'}
    When method post
    Then status 201
    #embedded expressions can also be used with match keyword for assertion
    Then match $ == {title: '#(title)',author: '#(author)',id: #notnull}
