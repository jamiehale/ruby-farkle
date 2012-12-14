module Farkle
  class MultiplesScorer
    def score( dice )
      1.upto( 6 ).inject( [] ) do |scores,pips|
        scores + add_multiples( pips, dice )
      end
    end
    private
      def add_multiples( pips, dice )
        results = []
        indices = indices_of( pips, dice )
        3.upto( 6 ) do |multiple|
          if indices.size == multiple
            results += [ Score.new( score_from_pips_and_multiple( pips, multiple ), indices, type_from_multiple( multiple ) ) ]
          end
        end
        results
      end
      def indices_of( pips, dice )
        indices = []
        dice.each_with_index do |roll,index|
          if roll == pips
            indices << ( index + 1 )
          end
        end
        indices
      end
      def score_from_pips_and_multiple( pips, multiple )
        score_from_pips( pips ) * 2 ** ( multiple - 3 )
      end
      def score_from_pips( roll )
        if roll == 1
          1000
        else
          roll * 100
        end
      end
      def type_from_multiple( multiple )
        { 3 => :triple, 4 => :quadruple, 5 => :quintuple, 6 => :sextuple }[ multiple ]
      end
  end
end
