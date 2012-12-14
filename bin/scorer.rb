class Scorer
  def score( dice )
    results = []
    dice.each_with_index do |roll,index|
      if roll == 1
        results << "100:#{index+1}"
      elsif roll == 5
        results << "50:#{index+1}"
      end
    end
    results
  end
end

scorer = Scorer.new()
scores = scorer.score( ARGV[ 1 ].split( ',' ).map { |s| s.to_i } )
if scores.empty?
  puts "Farkle!"
else
  scores.each do |score|
    puts score
  end
end
