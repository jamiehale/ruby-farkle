Feature: Scoring when a player is not open

  Scenario Outline: Score a bunch of valid rolls
    Given the player is not open
    And the roll "<roll>"
    When the scorer is run
    Then the scores should include "<score>"

    Examples: Singles only
      | roll | score |
      | 1    | 100:1 |
      | 5    | 50:1  |
      | 1,5  | 100:1 |
      | 1,5  | 50:1  |
      