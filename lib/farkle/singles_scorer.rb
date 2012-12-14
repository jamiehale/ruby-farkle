module Farkle
  
  class SinglesScorer
    
    def score( dice )
      dice.each_with_index.inject( [] ) do |scores,(roll,index)|
        if roll == 1
          scores + [ Score.new( 100, [ index + 1 ], :single ) ]
        elsif roll == 5
          scores + [ Score.new( 50, [ index + 1 ], :single ) ]
        else
          scores
        end
      end
    end
    
  end
  
end
