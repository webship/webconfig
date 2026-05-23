Feature: Single configuration export workflow
  As an admin user
  I want to select a configuration item and read its exported YAML
  So that I can confirm the single export tooling provided by the bundled
  configuration modules works end to end

  Background:
    Given I am a logged in user with the "Webmaster" user

  Scenario: Exporting the site information shows its YAML
    When I navigate to "/admin/config/development/configuration/single/export"
     And I select "Simple configuration" from "Configuration type"
     And I select "system.site" from "Configuration name"
    Then the "#edit-export" field value should contain "name:"
     And the "#edit-export" field value should contain "page:"
