@config-schema
Feature: Configuration Inspector
  As an admin user
  I want to inspect the active configuration against its schema
  So that I can find configuration that does not match its schema

  The overview validates every configuration object of the site: a module
  whose schema gives a constraint an option the validator does not know
  makes the page fail (on a Webship site, one of the AI modules does), so a
  run there leaves the feature out.

  Background:
    Given I am a logged in user with the "Webmaster" user

  Scenario: Admin can open the configuration inspector overview
    When I navigate to "/admin/reports/config-inspector"
    Then I should see "Configuration inspector"
     And I should see "Schema"
