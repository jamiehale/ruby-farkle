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
            results += add_shorter_permutations( pips, multiple, indices )
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
      
      def add_shorter_permutations( pips, multiple, indices )
        results = []
        ( multiple - 1 ).downto( 3 ) do |permutation_size|
          permutations_of( indices, permutation_size ).each do |permutation|
            results << Score.new( score_from_pips_and_multiple( pips, permutation_size ), permutation, type_from_multiple( permutation_size ) )
          end
        end
        results
      end
      
      def collect_permutations_of( set, size )
        if set.size == size
          [ set ]
        else
          results = []
          set.each_with_index do |v,i|
            lower = set[ 0, i ]
            upper = set[ ( i + 1 )..-1 ]
            results += collect_permutations_of( lower + upper, size )
          end
          results
        end
      end
      
      def permutations_of( set, size )
        collect_permutations_of( set, size ).uniq.sort
      end
      
  end
  
end
