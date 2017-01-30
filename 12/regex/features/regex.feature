Feature: Regex

  Scenario: Email Form Validation
    Given I have the email qa@boomtownroi.com
    When I validate the email
    Then I expect it to be valid

  Scenario: Email Form Validation
    Given I have the email @google.com
    When I validate the email
    Then I expect it to be invalid
