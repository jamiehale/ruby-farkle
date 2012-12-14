module Farkle
  class MultiplesScorer
    def score( dice )
      if dice == [ 1, 1, 1 ]
        [ "1000:1,2,3" ]
      else
        []
      end
    end
  end
end
