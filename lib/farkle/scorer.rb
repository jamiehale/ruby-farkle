module Farkle
  class Scorer
    def initialize( state )
      @state = state
    end
    def score( dice )
      results = []
      dice.each_with_index do |roll,index|
        if roll == 1
          results << "100:#{index+1}"
        elsif roll == 5
          results << "50:#{index+1}"
        end
      end
      if @state == :open and dice == [ 1, 1, 1 ]
        results << "1000:1,2,3"
      end
      results
    end
  end
end
