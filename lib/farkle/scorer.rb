module Farkle
  class SinglesScorer
    def score( dice )
      dice.each_with_index.inject( [] ) do |scores,(roll,index)|
        if roll == 1
          scores + [ "100:#{index+1}" ]
        elsif roll == 5
          scores + [ "50:#{index+1}" ]
        else
          scores
        end
      end
    end
  end
  class MultiplesScorer
    def score( dice )
      if dice == [ 1, 1, 1 ]
        [ "1000:1,2,3" ]
      else
        []
      end
    end
  end
  class Scorer
    def initialize( scorers )
      @scorers = scorers
    end
    def score( dice )
      @scorers.inject( [] ) { |scores,scorer| scores + scorer.score( dice ) }
    end
  end
end
