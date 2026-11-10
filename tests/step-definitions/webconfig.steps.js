'use strict';

const { Given, Then, When } = require('@cucumber/cucumber');
const { friendly } = require('webship-js/tests/step-definitions/webship');

/**
 * Run a step body and rethrow any failure as a tester-friendly error.
 */
async function attempt(body, message) {
  try {
    await body();
  } catch (err) {
    throw friendly(message, err);
  }
}

/**
 * Resolve a form field locator by label.
 */
function fieldLocator(page, label) {
  return page
    .locator('label.form-item__label, label.form-required, label')
    .filter({ hasText: new RegExp(`^\\s*${label.replace(/[.*+?^${}()|[\\]\\\\]/g, '\\$&')}(\\s|$)`, 'i') })
    .first();
}

/**
 * Assert that a form field with the given label is visible on the page.
 *
 * Example #1: Then I should see a "Label" field
 * Example #2: Then I should see a "Machine-readable name" field
 */
Then(/^(?:I |we )?should see a "([^"]*)" field$/, async function (label) {
  await attempt(async () => {
    const locator = fieldLocator(this.page, label);
    await locator.waitFor({ state: 'visible', timeout: 10000 });
  }, `Expected to find a field labeled "${label}"`);
});

/**
 * Assert that a form field with the given label (with article "an") is visible.
 *
 * Example #1: Then I should see an "Import" field
 */
Then(/^(?:I |we )?should see an "([^"]*)" field$/, async function (label) {
  await attempt(async () => {
    const locator = fieldLocator(this.page, label);
    await locator.waitFor({ state: 'visible', timeout: 10000 });
  }, `Expected to find a field labeled "${label}"`);
});

/**
 * Assert that a button with the given text is visible on the page.
 *
 * Example #1: Then I should see the button "Import"
 * Example #2: Then I should see the button "Export"
 */
Then(/^(?:I |we )?should see the button "([^"]*)"$/, async function (text) {
  await attempt(async () => {
    const locator = this.page.getByRole('button', { name: text, exact: false }).first();
    await locator.waitFor({ state: 'visible', timeout: 10000 });
  }, `Expected to find a button with text "${text}"`);
});

/**
 * Assert that the response of a path is the given HTTP status code.
 *
 * Example #1: Then the response status of "/admin/config/development/configuration" should be 200
 * Example #2: Then the response status of "/admin/config/development/configuration/single/export" should be 200
 */
Then(/^the response status of "([^"]+)" should be (\d+)$/, async function (path, status) {
  await attempt(async () => {
    const url = `${this.parameters.launchUrl}${path}`;
    const response = await this.page.request.get(url, { failOnStatusCode: false });
    const actual = response.status();
    if (String(actual) !== String(status)) {
      throw new Error(`GET ${path} returned ${actual}, expected ${status}`);
    }
  }, `Unexpected HTTP status for "${path}"`);
});

/**
 * Assert that a form control's value (input / textarea / select), addressed by
 * a raw CSS selector, contains the given text. Waits for AJAX to populate the
 * value — useful for the read-only single-export YAML preview (#edit-export).
 *
 * Example #1: Then the "#edit-export" field value should contain "name:"
 * Example #2: Then the "#edit-export" field value should contain "page:"
 */
Then(/^the "([^"]+)" field value should contain "([^"]*)"$/, async function (selector, needle) {
  await attempt(async () => {
    await this.page.waitForFunction(
      ({ sel, text }) => {
        const el = document.querySelector(sel);
        return !!el && String(el.value || '').includes(text);
      },
      { sel: selector, text: needle },
      { timeout: 15000 },
    );
  }, `Expected the value of "${selector}" to contain "${needle}"`);
});

/**
 * Assert that an HTML option with the given visible text exists in a select.
 *
 * Example #1: Then the "Configuration type" select should have the option "Simple configuration"
 * Example #2: Then the "Configuration type" select should have the option "User role"
 */
Then(/^the "([^"]+)" select should have the option "([^"]+)"$/, async function (selectLabel, optionText) {
  await attempt(async () => {
    const select = this.page
      .locator('select')
      .filter({ has: this.page.locator(`option:text-is("${optionText}")`) })
      .first();
    const count = await select.locator(`option:text-is("${optionText}")`).count();
    if (count === 0) {
      throw new Error(`No option "${optionText}" found for the "${selectLabel}" select`);
    }
  }, `Expected the "${selectLabel}" select to contain the option "${optionText}"`);
});
