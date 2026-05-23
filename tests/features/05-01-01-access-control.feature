Feature: Access control for configuration management admin pages
  As a site administrator
  I want the configuration management admin pages to be protected
  So that only privileged users can read or change site configuration

  Scenario: Anonymous user cannot access the configuration synchronize page
    Given I am an anonymous user
    When I navigate to "/admin/config/development/configuration"
    Then I should see "Access denied"

  Scenario: Anonymous user cannot access the single export form
    Given I am an anonymous user
    When I navigate to "/admin/config/development/configuration/single/export"
    Then I should see "Access denied"

  Scenario: Anonymous user cannot access the configuration update report
    Given I am an anonymous user
    When I navigate to "/admin/config/development/configuration/report"
    Then I should see "Access denied"

  Scenario: Anonymous user cannot access the config split list
    Given I am an anonymous user
    When I navigate to "/admin/config/development/configuration/config-split"
    Then I should see "Access denied"

  Scenario: Authenticated user cannot access the configuration synchronize page
    Given I am a logged in user with the "Authenticated user" user
    When I navigate to "/admin/config/development/configuration"
    Then I should see "Access denied"
