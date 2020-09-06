Feature: Cuoco can add a recipe

    As a cuoco
    I want to add a recipe
    so that I can add a recipe on the new recipe page

Scenario: Cuoco add a recipe
 
  Given a user
  Given a recipe

  When I am on the home page
  And I follow "Login"
  Then I should be on the Login page

  When I fill in "user_email" with "user@user.com"
  And I fill in "user_password" with "user12345"
  And I press "Entra"
  Then I should be on the home page

  When I follow "Inserisci ricetta"
  Then I should be on the New Recipe page

  When I fill in "recipe_nome" with "pasta aglio e olio"
  And I fill in "recipe_link" with "aglio, olio, peperoncino"
  And I fill in "recipe_descrizione" with "Semplice e gustosa"
  And I attach "recipe_immagine" to "/features/11.jpg"
  And I press "Inserisci ricetta"
  Then I should be on the Recipe Details page
