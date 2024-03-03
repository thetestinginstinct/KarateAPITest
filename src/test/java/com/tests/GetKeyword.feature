Feature: Get Keyword Feature

  Scenario: Get Keyword Scenario1
    Given url 'https://run.mocky.io/v3/0c1e67af-a07d-4a3c-9ce3-aa89334e0086'
    When method get
    * def actor = response
    * def age = get actor.Actors[*].age
    * def name = get actor.Actors[*].name
    * match age == [56, 53]
    * match name == ['Tom Cruise', 'Robert Downey Jr.']

  Scenario: Get Keyword Shortcut($variableName) Scenario2
    Given url 'https://run.mocky.io/v3/0c1e67af-a07d-4a3c-9ce3-aa89334e0086'
    When method get
    * def actor = response
    * def age = $actor.Actors[*].age
    * def name = $actor.Actors[*].name
    * match age == [56, 53]
    * match name == ['Tom Cruise', 'Robert Downey Jr.']

  Scenario: Get Keyword plus index Scenario3
    Given url 'https://run.mocky.io/v3/0c1e67af-a07d-4a3c-9ce3-aa89334e0086'
    When method get
    * def actor = response
    * def age = $actor.Actors[*].age
    * def name = $actor.Actors[*].name
    * def actualAge = 56
    * match actualAge == get[0] actor.Actors[*].age
    * def actualName = 'Tom Cruise'
    * match actualName == get[0] actor.Actors[*].name
