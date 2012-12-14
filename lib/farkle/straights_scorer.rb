module Farkle
  class StraightsScorer
    def score( dice )
      if dice.sort == [ 1, 2, 3, 4, 5, 6 ]
        [ Score.new( 1500, [ 1, 2, 3, 4, 5, 6 ], :straight ) ]
      else
        []
      end
    end
  end
end
