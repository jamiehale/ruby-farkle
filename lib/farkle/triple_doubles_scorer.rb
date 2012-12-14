module Farkle
  
  class TripleDoublesScorer
    
    def score( dice )
      if is_triple_double?( dice )
        [ Score.new( 1500, [ 1, 2, 3, 4, 5, 6 ], :triple_double ) ]
      else
        []
      end
    end
    
    private
    
      def is_triple_double?( dice )
        count_rolls( dice ).count( 2 ) == 3
      end
      
      def count_rolls( dice )
        dice.inject( [ 0, 0, 0, 0, 0, 0 ] ) { |rolls,roll| rolls[ roll - 1 ] += 1; rolls }
      end
      
  end
  
end
