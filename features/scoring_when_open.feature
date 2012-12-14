Feature: Scoring when a player is open

  Scenario Outline: Score a bunch of valid rolls
    Given the player is open
    And the roll "<roll>"
    When the scorer is run
    Then the scores should include "<score>"

    Examples: Singles only
      | roll        | score        |
      | 1           | 100:1:single |
      | 5           | 50:1:single  |
      | 1,5         | 100:1:single |
      | 1,5         | 50:2:single  |
      | 1,1,2,3,4,5 | 100:1:single |
      | 1,1,2,3,4,5 | 100:2:single |
      | 1,1,2,3,4,5 | 50:6:single  |

  Scenario Outline: Report a bunch of farkles
    Given the player is open
    And the roll "<roll>"
    When the scorer is run
    Then the scores should indicate a farkle

    Examples:
      | roll        |
      | 2           |
      | 2,3         |
      | 3,6,4       |
      | 6,2,3,4,4   |
      | 2,3,4,6,4,2 |
  
  Scenario Outline: Score non-single combinations
    Given the player is open
    And the roll "<roll>"
    When the scorer is run
    Then the scores should include "<score>"
    
    Examples: Triples
      | roll  | score             |
      | 1,1,1 | 1000:1,2,3:triple |
      | 2,2,2 | 200:1,2,3:triple  |
      | 3,3,3 | 300:1,2,3:triple  |
      | 4,4,4 | 400:1,2,3:triple  |
      | 5,5,5 | 500:1,2,3:triple  |
      | 6,6,6 | 600:1,2,3:triple  |
      | 1,2,3,1,1,2| 1000:1,4,5:triple |
      