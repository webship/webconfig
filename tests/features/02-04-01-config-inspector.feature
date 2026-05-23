Feature: Configuration Inspector
  As an admin user
  I want to inspect the active configuration against its schema
  So that I can find configuration that does not match its schema

  Background:
    Given I am a logged in user with the "Webmaster" user

  Scenario: Admin can open the configuration inspector overview
    When I navigate to "/admin/reports/config-inspector"
    Then I should see "Configuration inspector"
     And I should see "Schema"
