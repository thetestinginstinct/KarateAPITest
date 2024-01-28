Feature: Set & Remove keywords feature

@ignore
  Scenario: Set & Remove keywords scenario
    Given url 'https://run.mocky.io/v3/0c1e67af-a07d-4a3c-9ce3-aa89334e0086'
    When method get
    Then status 200
    And print 'response is:', response
    #Adding json array in second index with keys 'name' and 'age'
    And set response.Actors[2].name = 'Liam Neeson'
    And set response.Actors[2].age = 60
    And print 'response is:', response
    #Adding new key 'movie' in zero th index of json array
    And set response.Actors[0].movie = 'Mission Impossible'
    And print 'response is:', response
    #Updating existing key value of 'name' in zero index of json array
    And set response.Actors[0].name = 'Brad Pitt'
    And print 'response is:', response
    #Adding new key 'Industry' with value 'Hollywood' in json array
    And set response.Industry = 'Hollywood'
    And print 'response is:', response
    #Removing key 'movie' from zero index of json array
    And remove response.Actors[0].movie
    And print 'response is:', response
    #Removing json array from second index with keys 'name' and 'age'
    And remove response.Actors[2]
    And print 'response is:', response
    #Removing key 'Industry' with value 'Hollywood' in json array
    And remove response.Industry
    And print 'response is:', response
    
  Scenario: Set & Remove keywords read file scenario
    * def response = read('classpath:testdata/json_data.json')
    And print 'response is:', response
    #Adding json array in second index with keys 'name' and 'age'
    And set response.Actors[2].name = 'Liam Neeson'
    And set response.Actors[2].age = 60
    And print 'response is:', response
    #Adding new key 'movie' in zero th index of json array
    And set response.Actors[0].movie = 'Mission Impossible'
    And print 'response is:', response
    #Updating existing key value of 'name' in zero index of json array
    And set response.Actors[0].name = 'Brad Pitt'
    And print 'response is:', response
    #Adding new key 'Industry' with value 'Hollywood' in json array
    And set response.Industry = 'Hollywood'
    And print 'response is:', response
    #Removing key 'movie' from zero index of json array
    And remove response.Actors[0].movie
    And print 'response is:', response
    #Removing json array from second index with keys 'name' and 'age'
    And remove response.Actors[2]
    And print 'response is:', response
    #Removing key 'Industry' with value 'Hollywood' in json array
    And remove response.Industry
    And print 'response is:', response
    