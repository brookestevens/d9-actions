@api
Feature: Create Basic Page
  In order to create new content
  As an administraor
  I should be able to create pages

  Scenario: An anonymous user should not be able to create content
    Given I am an anonymous user
    When I am on "node/add/page"
    Then I should see "Access denied"

  Scenario: The home page should have content
    Given I am on the homepage
    Then I should see the heading "Nextpress Demo Page"

  Scenario:
    Given I am on "/user/login"
    When I fill in "Username" with "admin"
    And I fill in "Password" with "password"
    And I press "Log in"
    Then I should be on "/user/1"

  Scenario: An administrator can create a basic page
    Given I am logged in as a user with the "administrator" role
    And I am at "node/add/page"
    When I fill in "Title" with "Testing Page with Behat"
    And I fill in "Body" with "Lorem ipsum"
    And I fill in "URL alias" with "/behat"
    And I press "Save"
    Then I should be on "/behat"