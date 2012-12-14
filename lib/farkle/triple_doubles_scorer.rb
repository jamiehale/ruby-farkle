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
        rolls = [ 0, 0, 0, 0, 0, 0 ]
        dice.each do |roll|
          rolls[ roll - 1 ] += 1
        end
        rolls.count( 2 ) == 3
      end
  end
end
