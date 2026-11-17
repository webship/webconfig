@install-profile
Feature: Configuration Update Manager report
  As an admin user
  I want to use the Configuration Update Manager reports
  So that I can compare active configuration with the values shipped by
  modules, themes, and install profiles

  The report lists the configuration of the install profile too: it needs a
  site that still has one. A site whose installer uninstalls itself (a
  Webship site) answers these pages with an error, so a run there leaves the
  feature out.

  Background:
    Given I am a logged in user with the "Webmaster" user

  Scenario: Admin can open the configuration updates report
    When I navigate to "/admin/config/development/configuration/report"
    Then I should see "Updates report"

  Scenario: Admin can run a report for newer configuration items
    When I navigate to "/admin/config/development/configuration/report/type/type"
    Then the response status of "/admin/config/development/configuration/report/type/type" should be 200
