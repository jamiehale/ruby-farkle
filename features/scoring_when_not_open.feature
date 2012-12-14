Feature: Scoring when a player is not open

  Scenario Outline: Score a bunch of valid rolls
    Given the player is not open
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

  Scenario Outline: Do not score multiples, straights, triple-doubles, or double-triples
    Given the player is not open
    And the roll "<roll>"
    When the scorer is run
    Then the scores should not include "<score>"
    
    Examples: Multiples
      | roll        | score                     |
      | 1,1,1       | 1000:1,2,3:triple         |
      | 2,2,2       | 200:1,2,3:triple          |
      | 3,3,3,4     | 300:1,2,3:triple          |
      | 5,4,4,3,4   | 400:2,3,5:triple          |
      | 6,5,4,5,4,5 | 500:2,4,6:triple          |
      | 6,1,2,3,6,6 | 600:1,5,6:triple          |
      | 1,1,1,1     | 2000:1,2,3,4:quadruple    |
      | 2,2,2,2,2   | 800:1,2,3,4,5:quintuple   |
      | 3,3,3,3,3,3 | 2400:1,2,3,4,5,6:sextuple |
    
    Examples: Straights
      | roll        | score                     |
      | 1,2,3,4,5,6 | 1500:1,2,3,4,5,6:straight |
      | 4,3,6,5,1,2 | 1500:1,2,3,4,5,6:straight |
    
    Examples: Triple-doubles
      | roll        | score                          |
      | 1,1,2,2,3,3 | 1500:1,2,3,4,5,6:triple-double |
      | 1,3,2,1,3,2 | 1500:1,2,3,4,5,6:triple-double |
      | 1,1,1,1,2,2 | 1500:1,2,3,4,5,6:triple-double |
      | 2,2,2,2,2,2 | 1500:1,2,3,4,5,6:triple-double |
    
    Examples: Double-triples
      | roll        | score                          |
      | 1,1,1,2,2,2 | 2500:1,2,3,4,5,6:double-triple |
      | 1,2,1,2,2,1 | 2500:1,2,3,4,5,6:double-triple |
      | 2,2,2,2,2,2 | 2500:1,2,3,4,5,6:double-triple |

  Scenario Outline: Report a bunch of farkles
    Given the player is not open
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
      | 2,2,2       |
      | 3,3,3       |
      | 4,4,4       |
      | 6,6,6       |
      | 2,2,2,2     |
      | 2,2,2,2,2   |
      | 2,2,2,2,2,2 |
      | 2,2,2,3,3,3 |
      | 2,2,3,3,4,4 |
      