Feature: User Authentication
  In order to ensure the authentication process is working correctly
  
  Scenario: LogIn
    Given a valid user
      When I go to the login page
      And I fill in the following:
        |Email|demo@gmail.com|
        |Password|12345678|
      And I press "Sign in"
      Then I should see "Log Out"