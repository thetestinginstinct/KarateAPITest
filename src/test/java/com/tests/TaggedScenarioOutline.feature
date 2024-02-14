Feature: Tagged Scenario Outline Feature

#mvn test "-Dkarate.options=--tags @region=GB" -Dtest=SampleTest 

  Scenario Outline: Tagged Scenario Outline Scenario
    * print 'url value is:', url
    * print 'key1 value is:', key1
    * print 'key2 value is:', key2
    * print 'responseValue is:', responseValue

    @region=US
    Examples: 
      | url                          | key1   | key2   | responseValue    |
      | https://reqres.us/api/users/ | value1 | value2 | expectedResponse |

    @region=GB
    Examples: 
      | url                          | key1   | key2   | responseValue    |
      | https://reqres.gb/api/users/ | value1 | value2 | expectedResponse |

    @region=All
    Examples: 
      | url                          | key1   | key2   | responseValue    |
      | https://reqres.us/api/users/ | value1 | value2 | expectedResponse |
      | https://reqres.gb/api/users/ | value1 | value2 | expectedResponse |
