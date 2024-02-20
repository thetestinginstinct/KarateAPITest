Feature: Calling JavaScript Functions feature

  Scenario: Calling JavaScript Functions Inline Scenario1
    * def greeter =
      """
      function(title, name) 
      { 
      return 'hello ' + title + ' ' + name
      }
      """
    * match greeter('Mr.', 'Bob') == 'hello Mr. Bob'

  Scenario: Calling JavaScript Functions using a js file Scenario2
    * def greeter = read('Greeting.js')
    * match greeter('Mrs.', 'Hailey') == 'hello Mrs. Hailey'

  Scenario: Calling Java Interop via JavaScript Scenario3
    * def getDate =
      """
      function() {
        var SimpleDateFormat = Java.type('java.text.SimpleDateFormat');
        var sdf = new SimpleDateFormat('dd/MM/yyyy');
        var date = new java.util.Date();
        return sdf.format(date);
      } 
      """
    * def temp = getDate()
    * print temp

  Scenario: Call Static Java Method with Parameter via JavaScript Scenario4
    * def JSDemo =
      """
      function(arg) {
        var JavaDemo = Java.type('com.tests.Utility');
        return JavaDemo.generateName(arg);  
      }
      """
    * def result = call JSDemo 'Griffin'
    * print 'result is', result
    * match result == 'Griffin'

  Scenario: Call Non-Static Java Method with Parameter via JavaScript Scenario5
    * def JSDemo =
      """
      function(arg) {
        var JavaDemo = Java.type('com.tests.Utility');
        var jd = new JavaDemo();
      return jd.generateFirstName(arg);  
      }
      """
    * def result = call JSDemo 'Steve'
    * print 'result is', result
    * match result == 'Steve'
