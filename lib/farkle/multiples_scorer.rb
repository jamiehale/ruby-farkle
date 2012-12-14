module Farkle
  class MultiplesScorer
    def score( dice )
      1.upto( 6 ).inject( [] ) do |scores,roll|
        scores + add_triples_and_quadruples( roll, dice )
      end
    end
    private
      def add_triples_and_quadruples( roll, dice )
        results = []
        indices = indices_of( roll, dice )
        if indices.size == 3
          results += [ Score.new( score_from_roll( roll ), indices, :triple ) ]
        end
        if indices.size == 4
          results += [ Score.new( score_from_roll( roll ) * 2, indices, :quadruple ) ]
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
