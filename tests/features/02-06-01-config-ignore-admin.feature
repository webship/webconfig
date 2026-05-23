Feature: Config Ignore admin
  As an admin user
  I want to define configuration that is ignored during import
  So that environment-specific configuration is never overwritten by a
  deployment

  Background:
    Given I am a logged in user with the "Webmaster" user

  Scenario: Admin can open the config ignore settings form
    When I navigate to "/admin/config/development/configuration/ignore"
    Then I should see "Ignore"
     And I should see "Configuration entity names to ignore"
     And I should see the button "Save"
