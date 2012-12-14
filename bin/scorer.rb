class Scorer
  def initialize( state )
    @state = state
  end
  def score( dice )
    results = []
    dice.each_with_index do |roll,index|
      if roll == 1
        results << "100:#{index+1}"
      elsif roll == 5
        results << "50:#{index+1}"
      end
    end
    if @state == :open and dice == [ 1, 1, 1 ]
      results << "1000:1,2,3"
    end
    results
  end
end

def usage
  puts "ruby scorer.rb [--open|--not-open] <roll>"
  exit
end

def make_scorer
  if ARGV.size == 1
    Scorer.new( :open )
  elsif ARGV.size == 2
    if ARGV[ 0 ] == "--open"
      Scorer.new( :open )
    elsif ARGV[ 0 ] == "--not-open"
      Scorer.new( :not_open )
    else
      usage
    end
  else
    usage
  end
end

scorer = make_scorer
scores = scorer.score( ARGV[ 1 ].split( ',' ).map { |s| s.to_i } )
if scores.empty?
  puts "Farkle!"
else
  scores.each do |score|
    puts score
  end
end
