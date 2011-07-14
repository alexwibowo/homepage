Feature: Navigation to projects page


Scenario: Visiting the main projects page
  Given I am on the home page
  When I follow "Projects"
  Then I should be on the projects page

