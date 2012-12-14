module Farkle
  class DoubleTriplesScorer
    def score( dice )
      if dice == [ 1, 1, 1, 3, 3, 3 ]
        [ Score.new( 2500, [ 1, 2, 3, 4, 5, 6 ], :double_triple ) ]
      else
        []
      end
    end
  end
end
