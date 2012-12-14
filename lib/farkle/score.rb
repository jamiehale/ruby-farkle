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
  end
end
