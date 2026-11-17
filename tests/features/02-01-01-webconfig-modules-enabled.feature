Feature: Web Config bundled modules are enabled
  As an admin user
  I want to verify that the Web Config recipe enables every configuration
  management module
  So that I know the recipe ran cleanly during install

  Background:
    Given I am a logged in user with the "Webmaster" user

  Scenario: Modules report page lists Web Config as enabled
    Then the "webconfig" module should be installed
     And the "config_update" module should be installed
     And the "config" module should be installed

  # The updates report and the configuration inspector have their own
  # features (02-03-01, 02-04-01), tagged for the sites they need.
  Scenario: The configuration management admin routes are reachable
    Then the response status of "/admin/config/development/configuration" should be 200
     And the response status of "/admin/config/development/configuration/config-split" should be 200
     And the response status of "/admin/config/development/configuration/ignore" should be 200
     And the response status of "/admin/config/development/configuration/single/export" should be 200
     And the response status of "/admin/config/development/configuration/single/import" should be 200
