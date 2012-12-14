module Farkle
  class MultiplesScorer
    def score( dice )
      if dice == [ 1, 1, 1 ]
        [ "1000:1,2,3:triple" ]
      else
        []
      end
    end
  end
end
