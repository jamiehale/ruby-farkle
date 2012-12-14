module Farkle
  class Scorer
    def initialize( scorers )
      @scorers = scorers
    end
    def score( dice )
      @scorers.inject( [] ) { |scores,scorer| scores + scorer.score( dice ) }
    end
  end
end
