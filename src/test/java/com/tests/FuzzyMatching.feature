Feature: Fuzzy Matching Feature

  Scenario: Fuzzy Matching Scenario
    Given url 'https://run.mocky.io/v3/200f9078-f3c8-4cec-a484-d145b3dc3920'
    When method get
    Then print 'response is:', response
    * match response == {"name": "Billie","type": "LOL","id": "a9f7a56b-8d5c-455c-9d13-808461d17b91","isAdmin": true,"age": 50,"nullKey": null}
    # '#ignore' marker is used to ignore a key,
    # '#regex [A-Z]{3} marker is used to match the regular-expression
    # '#uuid' marker is used to confirm to the UUID format
    # '#boolean' marker is used to check actual value to be a boolean true or false
    # '#number' marker is used to check actual value to be a number
    * match response == { name: '#ignore', type: '#regex [A-Z]{3}', id: '#uuid',"isAdmin": '#boolean',"age": '#number',"nullKey": '#null' }
    # '#present' marker is used to check a key is present
    * match response.name == '#present'
    # '#notpresent' marker is used to check a key is not present
    * match response.nope == '#notpresent'
    # '#string' marker is used to check the value of key is string
    * match response.name == '#string'
    # optional key marker means that the key is optional or that the value can be null. Two # symbols is used.
    * match response.optionalKey == '##string'
