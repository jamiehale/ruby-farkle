module Farkle
  class MultiplesScorer
    def score( dice )
      indices = indices_of_1s( dice )
      if indices.size == 3
        [ Score.new( 1000, indices, :triple ) ]
      else
        []
      end
    end
    private
      def indices_of_1s( dice )
        indices = []
        dice.each_with_index do |roll,index|
          if roll == 1
            indices << ( index + 1 )
          end
        end
        indices
      end
  end
end
