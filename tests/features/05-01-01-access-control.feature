Feature: Access control for configuration management admin pages
  As a site administrator
  I want the configuration management admin pages to be protected
  So that only privileged users can read or change site configuration

  Scenario: Anonymous user cannot access the configuration synchronize page
    Given I am an anonymous user
    Then I should be denied access to "/admin/config/development/configuration"

  Scenario: Anonymous user cannot access the single export form
    Given I am an anonymous user
    Then I should be denied access to "/admin/config/development/configuration/single/export"

  Scenario: Anonymous user cannot access the configuration update report
    Given I am an anonymous user
    Then I should be denied access to "/admin/config/development/configuration/report"

  Scenario: Anonymous user cannot access the config split list
    Given I am an anonymous user
    Then I should be denied access to "/admin/config/development/configuration/config-split"

  Scenario: Authenticated user cannot access the configuration synchronize page
    Given I am a logged in user with the "Authenticated user" user
    Then I should be denied access to "/admin/config/development/configuration"
