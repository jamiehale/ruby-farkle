module Farkle
  
  class SinglesScorer
    
    def score( dice )
      score_singles( 1, dice ) + score_singles( 5, dice )
    end

    private
    
      def score_singles( pips, dice )
        dice.each_with_index.inject( [] ) do |scores,(roll,index)|
          roll == pips ? scores + [ Score.new( score_from_pips( pips ), [ index + 1 ], :single ) ] : scores
        end
      end
      
      def score_from_pips( pips )
        if pips == 1
          100
        else
          50
        end
      end
    
  end
  
end
