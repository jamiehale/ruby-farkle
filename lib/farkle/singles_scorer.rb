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
end
