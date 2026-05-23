Feature: Web Config bundled modules are enabled
  As an admin user
  I want to verify that the Web Config recipe enables every configuration
  management module
  So that I know the recipe ran cleanly during install

  Background:
    Given I am a logged in user with the "Webmaster" user

  Scenario: Modules report page lists Web Config as enabled
    When I navigate to "/admin/modules"
    Then I should see "Web Config"
     And I should see "Configuration Update"
     And I should see "Configuration Manager"

  Scenario: Every bundled configuration management admin route is reachable
    Then the response status of "/admin/config/development/configuration" should be 200
     And the response status of "/admin/config/development/configuration/report" should be 200
     And the response status of "/admin/reports/config-inspector" should be 200
     And the response status of "/admin/config/development/configuration/config-split" should be 200
     And the response status of "/admin/config/development/configuration/ignore" should be 200
     And the response status of "/admin/config/development/configuration/single/export" should be 200
     And the response status of "/admin/config/development/configuration/single/import" should be 200
