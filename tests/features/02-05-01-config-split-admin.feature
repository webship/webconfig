Feature: Configuration Split admin
  As an admin user
  I want to manage configuration split definitions
  So that I can keep environment-specific configuration in separate
  directories

  Background:
    Given I am a logged in user with the "Webmaster" user

  Scenario: Admin can open the configuration split list
    When I navigate to "/admin/config/development/configuration/config-split"
    Then I should see "Configuration Split"

  Scenario: Admin can open the add configuration split form
    When I navigate to "/admin/config/development/configuration/config-split/add"
    Then I should see a "Label" field
     And I should see the button "Save"
