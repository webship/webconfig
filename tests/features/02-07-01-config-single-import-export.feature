Feature: Single configuration import and export
  As an admin user
  I want to import and export a single configuration item
  So that I can move individual configuration objects between sites without
  a full synchronization

  Background:
    Given I am a logged in user with the "Webmaster" user

  Scenario: Admin can open the single export form and pick a configuration type
    When I navigate to "/admin/config/development/configuration/single/export"
    Then I should see "Single export"
     And I should see a "Configuration type" field
     And I should see a "Configuration name" field

  Scenario: Admin can open the single import form
    When I navigate to "/admin/config/development/configuration/single/import"
    Then I should see "Single import"
     And I should see a "Configuration type" field
     And I should see the button "Import"
