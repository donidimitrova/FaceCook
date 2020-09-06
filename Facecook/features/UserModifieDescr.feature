Feature: User can modifie his description

    As a user
    I want to modifie my description
    so that I can modifie my description on the user's profile

Scenario: User modifie his description
 
  Given a user

  When I am on the home page
  And I follow "Login"
  Then I should be on the Login page

  When I fill in "user_email" with "user@user.com"
  And I fill in "user_password" with "user12345"
  And I press "Entra"
  Then I should be on the home page

  When I follow "Profilo"
  Then I should be on the Profile page

  When I fill in "user_descrizione" with "sono un cuoco bravissimo"
  And I press "Aggiorna descrizione"
  Then I should be on the Profile page
  And I should see "sono un cuoco bravissimo"