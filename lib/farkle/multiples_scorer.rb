module Farkle
  class MultiplesScorer
    def score( dice )
      if dice == [ 1, 1, 1 ]
        [ Score.new( 1000, [ 1, 2, 3 ], :triple ) ]
      elsif dice == [ 2, 1, 3, 1, 1, 5 ]
        [ Score.new( 1000, [ 2, 4, 5 ], :triple ) ]
      else
        []
      end
    end
  end
end
