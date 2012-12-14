module Farkle
  class TripleDoublesScorer
    def score( dice )
      if dice == [ 1, 1, 2, 2, 3, 3 ]
        [ Score.new( 1500, [ 1, 2, 3, 4, 5, 6 ], :triple_double ) ]
      else
        []
      end
    end
  end
end
