Feature: Core configuration synchronization
  As an admin user
  I want the configuration management synchronize page to work
  So that I can review and deploy configuration changes between environments

  Background:
    Given I am a logged in user with the "Webmaster" user

  Scenario: Admin can open the configuration synchronize page
    When I navigate to "/admin/config/development/configuration"
    Then I should see "Synchronize"
     And I should see "Configuration"

  Scenario: Admin can open the full import (upload) tab
    When I navigate to "/admin/config/development/configuration/full/import"
    Then I should see "Import"

  Scenario: Admin can open the full export (download) tab
    When I navigate to "/admin/config/development/configuration/full/export"
    Then I should see "Export"
