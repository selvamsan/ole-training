Feature: Regular Expression Exercise

  Background:
    Given I am matching keywords

  Scenario: Match a Single Word
    When I have a special word
    Then I select it

  Scenario: Match Either Word
    When I have a special word
    And I have an alternate word
    Then I select them

  Scenario: Match Two Words in Quotations
    When I have data "in quotes"
    Then I select it

  Scenario: Match One Word in Quotations
    When I have data "quoted"
    Then I select it

  Scenario: Match Numbers
    When I have a 1
    And I have a 23
    And I have an 18
    Then I have a sum of 42
