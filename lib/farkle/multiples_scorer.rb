module Farkle
  class MultiplesScorer
    def score( dice )
      1.upto( 6 ).inject( [] ) do |scores,roll|
        scores + add_triples( roll, dice )
      end
    end
    private
      def add_triples( roll, dice )
        results = []
        indices = indices_of( roll, dice )
        if indices.size == 3
          results += [ Score.new( score_from_roll( roll ), indices, :triple ) ]
        end
        results
      end
      def indices_of( desired_roll, dice )
        indices = []
        dice.each_with_index do |roll,index|
          if roll == desired_roll
            indices << ( index + 1 )
          end
        end
        indices
      end
      def score_from_roll( roll )
        if roll == 1
          1000
        else
          roll * 100
        end
      end
  end
end
