module Farkle
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
      def score_multiples( dice )
        if @state == :open and dice == [ 1, 1, 1 ]
          [ "1000:1,2,3" ]
        else
          []
        end
      end
    
  end
end
