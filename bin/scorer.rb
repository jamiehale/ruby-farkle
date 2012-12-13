class Scorer
  def score( dice )
    if dice == "1"
      "100:1"
    else
      "50:1"
    end
  end
end

scorer = Scorer.new()
puts scorer.score( ARGV[ 1 ] )
