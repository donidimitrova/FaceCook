Feature: User can add a comment to a recipe

    As a user
    I want to add a vote
    so that I can add my vote on the recipe's page

Scenario: User adda a vote
 
  Given a user
  Given a recipe
  Given a second user

  When I am on the home page
  And I follow "Login"
  Then I should be on the Login page

  When I fill in "user_email" with "second@user.com"
  And I fill in "user_password" with "user12345"
  And I press "Entra"
  Then I should be on the home page

  When I follow "Colazione"
  Then I should be on the Recipes page

  When I follow "panel"
  Then I should be on the Recipe Details page

  When I follow "Aggiungi un voto"
  Then I should be on the New Review page

  When I choose "star5"
  And I press "Conferma"
  Then I should be on the Recipe Details page