Feature: Call Static & NonStatic Java Methods Feature

  Scenario: Call Static Java Method
    * def JavaDemo = Java.type('com.tests.Utility')
    * def result = JavaDemo.generateFullName()
    * print 'result is', result

  Scenario: Call Static Java Method with parameter
    * def JavaDemo = Java.type('com.tests.Utility')
    * def result = JavaDemo.generateFullNameWithParameter('Griffin')
    * print 'result is', result

  Scenario: Call Non Static Java Method
    * def JavaDemo = Java.type('com.tests.Utility')
    * def obj1 = new JavaDemo()
    * def result = obj1.generateEmailAddress()
    * print 'result is', result

  Scenario: Call Non Static Java Method with parameter
    * def JavaDemo = Java.type('com.tests.Utility')
    * def obj1 = new JavaDemo()
    * def result = obj1.generateEmailAddressWithParameter('Griffin')
    * print 'result is', result
