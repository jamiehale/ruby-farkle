module Farkle
  class SinglesScorer
    def score( dice )
      dice.each_with_index.inject( [] ) do |scores,(roll,index)|
        if roll == 1
          scores + [ "100:#{index+1}:single" ]
        elsif roll == 5
          scores + [ "50:#{index+1}:single" ]
        else
          scores
        end
      end
    end
  end
end
