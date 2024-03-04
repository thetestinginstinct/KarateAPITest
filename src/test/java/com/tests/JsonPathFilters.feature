Feature: JsonPath Filters Feature

  Background: 
    * configure ssl = true

@ignore
  Scenario: JsonPath Filters Scenario1
    Given url 'https://run.mocky.io/v3/11197c67-9135-4ca0-83c3-af0830dfca07'
    When method get
    * def actor = response
    #complex filters can be created with logical operators && and ||
    #String literals must be enclosed by single or double quotes
    * def actorName1 = get[0] actor.Actors[?(@.id==1)]
    * match actorName1.name == 'Tom Cruise'
    * def actorName2 = get[0] actor.Actors[?(@.name=="Robert Downey Jr." && @.id==2)]
    * match actorName2.name == 'Robert Downey Jr.'

  Scenario: JsonPath Filters using karate.jsonPath Scenario2
    Given url 'https://run.mocky.io/v3/11197c67-9135-4ca0-83c3-af0830dfca07'
    When method get
    * def actor = response
    * def actorName = get[0] actor.Actors[?(@.id==1)]
    #dynamic expression
    * def temp = karate.jsonPath(actor, "$.Actors[?(@.name=='" + actorName.name + "')]")
    * match temp[0] == actorName
    * def temp = karate.jsonPath(actor, "$.Actors[?(@.name=='" + actorName.name + "')]")[0]
    * match temp == actorName
