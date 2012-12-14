module Farkle
  class MultiplesScorer
    def score( dice )
      results = []
      1.upto( 2 ) do |roll|
        indices = indices_of( roll, dice )
        if indices.size == 3
          if roll == 1
            results += [ Score.new( 1000, indices, :triple ) ]
          else
            results += [ Score.new( 200, indices, :triple ) ]
          end
        end
      end
      results
    end
    private
      def indices_of( desired_roll, dice )
        indices = []
        dice.each_with_index do |roll,index|
          if roll == desired_roll
            indices << ( index + 1 )
          end
        end
        indices
      end
  end
end
