module Farkle
  class DoubleTriplesScorer
    def score( dice )
      if is_double_triple?( dice )
        [ Score.new( 2500, [ 1, 2, 3, 4, 5, 6 ], :double_triple ) ]
      else
        []
      end
    end
    private
      def is_double_triple?( dice )
        rolls = [ 0, 0, 0, 0, 0, 0 ]
        dice.each do |roll|
          rolls[ roll - 1 ] += 1
        end
        rolls.count( 3 ) == 2
      end
  end
end
