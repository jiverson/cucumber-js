Feature: step definition snippets custom syntax

  As a developer writing my step definitions in another JS dialect
  I want to be able to see step definition snippets in the language I perfer

  Background:
    Given a file named "features/undefined.feature" with:
      """
      Feature: a feature
        Scenario: a scenario
          Given an undefined step
      """

  Scenario Outline:
    When I run cucumber-js with `--format-options '{"snippetInterface": "<INTERFACE>"}'`
    Then the output contains the text:
      """
      this.Given('an undefined step', <SNIPPET_FUNCTION_KEYWORD_AND_PARAMETERS> {
        // Write code here that turns the phrase above into concrete actions
        <SNIPPET_IMPLEMENTATION>;
      });
      """

    Examples:
      | INTERFACE   | SNIPPET_FUNCTION_KEYWORD_AND_PARAMETERS | SNIPPET_IMPLEMENTATION    |
      | callback    | function (callback)                     | callback(null, 'pending') |
      | generator   | function *()                            | return 'pending'          |
      | promise     | function ()                             | return 'pending'          |
      | synchronous | function ()                             | return 'pending'          |
