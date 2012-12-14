module Farkle
  class SinglesScorer
    def score( dice )
      dice.each_with_index.inject( [] ) do |scores,(roll,index)|
        if roll == 1
          scores + [ "100:#{index+1}" ]
        elsif roll == 5
          scores + [ "50:#{index+1}" ]
        else
          scores
        end
      end
    end
  end
  class MultiplesScorer
    def initialize( state )
      @state = state
    end
    def score( dice )
      if @state == :open and dice == [ 1, 1, 1 ]
        [ "1000:1,2,3" ]
      else
        []
      end
    end
  end
  class Scorer
    def initialize( state )
      @state = state
    end
    def score( dice )
      results = []
      results += score_singles( dice )
      results += score_multiples( dice )
      results
    end
    
    private
      def score_singles( dice )
        SinglesScorer.new().score( dice )
      end
      def score_multiples( dice )
        MultiplesScorer.new( @state ).score( dice )
      end
    
  end
end
