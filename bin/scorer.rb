class Scorer
  def score( dice )
    results = []
    if dice.include?( 1 )
      results << "100:1"
    elsif dice.include?( 5 )
      results << "50:1"
    end
    results
  end
end

scorer = Scorer.new()
scorer.score( ARGV[ 1 ].split( ',' ).map { |s| s.to_i } ).each do |score|
  puts score
end
