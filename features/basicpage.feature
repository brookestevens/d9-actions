Feature: Create Basic Page
  In order to create new content
  As an administraor
  I should be able to create pages

  Scenario: An anonymous user should not be able to create content
    Given I am an anonymous user
    When I am on "node/add/page"
    Then I should see "Access denied"

  @api
  Scenario: An administrator can create a basic page
    Given I am logged in as a user with the "administrator" role
    And I am at "node/add/page"
    When I fill in "Title" with "Testing Page with Behat"
    And I fill in "Body" with "Lorem ipsum"
    And I fill in "URL alias" with "/behat"
    And I press "Save"
    Then I should be on "/behat"