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
      | roll        | score             |
      | 1,1,1       | 1000:1,2,3:triple |
      | 2,2,2       | 200:1,2,3:triple  |
      | 3,3,3       | 300:1,2,3:triple  |
      | 4,4,4       | 400:1,2,3:triple  |
      | 5,5,5       | 500:1,2,3:triple  |
      | 6,6,6       | 600:1,2,3:triple  |
      | 1,2,3,1,1,2 | 1000:1,4,5:triple |
      | 6,6,6,6     | 600:1,2,3:triple  |
      | 6,6,6,6     | 600:1,3,4:triple  |
      | 6,6,6,6     | 600:1,2,4:triple  |
      | 6,6,6,6     | 600:2,3,4:triple  |
      | 6,6,6,6,6   | 600:1,2,3:triple  |
      | 6,6,6,6,6   | 600:1,2,4:triple  |
      | 6,6,6,6,6   | 600:1,2,5:triple  |
      | 6,6,6,6,6   | 600:1,3,4:triple  |
      | 6,6,6,6,6   | 600:1,3,5:triple  |
      | 6,6,6,6,6   | 600:1,4,5:triple  |
      | 6,6,6,6,6   | 600:2,3,4:triple  |
      | 6,6,6,6,6   | 600:2,3,5:triple  |
      | 6,6,6,6,6   | 600:2,4,5:triple  |
      | 6,6,6,6,6   | 600:3,4,5:triple  |
      | 6,6,6,6,6,6 | 600:1,2,3:triple  |
      | 6,6,6,6,6,6 | 600:1,2,4:triple  |
      | 6,6,6,6,6,6 | 600:1,2,5:triple  |
      | 6,6,6,6,6,6 | 600:1,2,6:triple  |
      | 6,6,6,6,6,6 | 600:1,3,4:triple  |
      | 6,6,6,6,6,6 | 600:1,3,5:triple  |
      | 6,6,6,6,6,6 | 600:1,3,6:triple  |
      | 6,6,6,6,6,6 | 600:1,4,5:triple  |
      | 6,6,6,6,6,6 | 600:1,4,6:triple  |
      | 6,6,6,6,6,6 | 600:1,5,6:triple  |
      | 6,6,6,6,6,6 | 600:2,3,4:triple  |
      | 6,6,6,6,6,6 | 600:2,3,5:triple  |
      | 6,6,6,6,6,6 | 600:2,3,6:triple  |
      | 6,6,6,6,6,6 | 600:2,4,5:triple  |
      | 6,6,6,6,6,6 | 600:2,4,6:triple  |
      | 6,6,6,6,6,6 | 600:2,5,6:triple  |
      | 6,6,6,6,6,6 | 600:3,4,5:triple  |
      | 6,6,6,6,6,6 | 600:3,4,6:triple  |
      | 6,6,6,6,6,6 | 600:3,5,6:triple  |
      | 6,6,6,6,6,6 | 600:4,5,6:triple  |
    
    Examples: Quadruples
      | roll        | score                  |
      | 1,1,1,1     | 2000:1,2,3,4:quadruple |
      | 2,2,2,2     | 400:1,2,3,4:quadruple  |
      | 3,3,3,3     | 600:1,2,3,4:quadruple  |
      | 4,4,4,4     | 800:1,2,3,4:quadruple  |
      | 5,5,5,5     | 1000:1,2,3,4:quadruple |
      | 6,6,6,6     | 1200:1,2,3,4:quadruple |
      | 1,6,6,2,6,6 | 1200:2,3,5,6:quadruple |
      | 6,6,6,6,6   | 1200:1,2,3,4:quadruple |
      | 6,6,6,6,6   | 1200:1,2,3,5:quadruple |
      | 6,6,6,6,6   | 1200:1,2,4,5:quadruple |
      | 6,6,6,6,6   | 1200:1,3,4,5:quadruple |
      | 6,6,6,6,6   | 1200:2,3,4,5:quadruple |
      | 6,6,6,6,6,6 | 1200:1,2,3,4:quadruple |
      | 6,6,6,6,6,6 | 1200:1,2,3,5:quadruple |
      | 6,6,6,6,6,6 | 1200:1,2,3,6:quadruple |
      | 6,6,6,6,6,6 | 1200:1,2,4,5:quadruple |
      | 6,6,6,6,6,6 | 1200:1,2,4,6:quadruple |
      | 6,6,6,6,6,6 | 1200:1,2,5,6:quadruple |
      | 6,6,6,6,6,6 | 1200:1,3,4,5:quadruple |
      | 6,6,6,6,6,6 | 1200:1,3,4,6:quadruple |
      | 6,6,6,6,6,6 | 1200:1,3,5,6:quadruple |
      | 6,6,6,6,6,6 | 1200:1,4,5,6:quadruple |
      | 6,6,6,6,6,6 | 1200:2,3,4,5:quadruple |
      | 6,6,6,6,6,6 | 1200:2,3,4,6:quadruple |
      | 6,6,6,6,6,6 | 1200:2,3,5,6:quadruple |
      | 6,6,6,6,6,6 | 1200:2,4,5,6:quadruple |
      | 6,6,6,6,6,6 | 1200:3,4,5,6:quadruple |
    
    Examples: Quintuples
      | roll        | score                    |
      | 1,1,1,1,1   | 4000:1,2,3,4,5:quintuple |
      | 2,2,2,2,2   | 800:1,2,3,4,5:quintuple  |
      | 3,3,3,3,3   | 1200:1,2,3,4,5:quintuple |
      | 4,4,4,4,4   | 1600:1,2,3,4,5:quintuple |
      | 5,5,5,5,5   | 2000:1,2,3,4,5:quintuple |
      | 6,6,6,6,6   | 2400:1,2,3,4,5:quintuple |
      | 6,6,1,6,6,6 | 2400:1,2,4,5,6:quintuple |
      | 6,6,6,6,6,6 | 2400:1,2,3,4,5:quintuple |
      | 6,6,6,6,6,6 | 2400:1,2,3,4,6:quintuple |
      | 6,6,6,6,6,6 | 2400:1,2,3,5,6:quintuple |
      | 6,6,6,6,6,6 | 2400:1,2,4,5,6:quintuple |
      | 6,6,6,6,6,6 | 2400:1,3,4,5,6:quintuple |
      | 6,6,6,6,6,6 | 2400:2,3,4,5,6:quintuple |
    
    Examples: Sextuples
      | roll        | score                     |
      | 1,1,1,1,1,1 | 8000:1,2,3,4,5,6:sextuple |
      | 2,2,2,2,2,2 | 1600:1,2,3,4,5,6:sextuple |
      | 3,3,3,3,3,3 | 2400:1,2,3,4,5,6:sextuple |
      | 4,4,4,4,4,4 | 3200:1,2,3,4,5,6:sextuple |
      | 5,5,5,5,5,5 | 4000:1,2,3,4,5,6:sextuple |
      | 6,6,6,6,6,6 | 4800:1,2,3,4,5,6:sextuple |
    
    Examples: Straights
      | roll        | score                     |
      | 1,2,3,4,5,6 | 1500:1,2,3,4,5,6:straight |
      | 4,3,1,6,2,5 | 1500:1,2,3,4,5,6:straight |
    
    Examples: Triple-doubles
      | roll        | score                          |
      | 1,1,2,2,3,3 | 1500:1,2,3,4,5,6:triple_double |
      | 3,2,5,3,5,2 | 1500:1,2,3,4,5,6:triple_double |
      