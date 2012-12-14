module Farkle
  
  class Score
    
    attr_reader :value
    attr_reader :dice_indices
    attr_reader :type
    
    def initialize( value, dice_indices, type )
      @value = value
      @dice_indices = dice_indices
      @type = type
    end
    
    def ==( s )
      s.value == @value and s.dice_indices == @dice_indices and s.type == @type
    end
    
    def to_s
      "#{@value}:" + @dice_indices.join(',') + ":#{@type}"
    end
    
  end
  
end
