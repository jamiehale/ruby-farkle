$: << File.join( File.dirname( __FILE__ ), "/../lib" )

require 'farkle'

def usage
  puts "ruby scorer.rb [--open|--not-open] <roll>"
  exit
end

def make_scorers( state )
  if state == :open
    [ Farkle::SinglesScorer.new(), Farkle::MultiplesScorer.new(), Farkle::StraightsScorer.new(), Farkle::TripleDoublesScorer.new(), Farkle::DoubleTriplesScorer.new() ]
  else
    [ Farkle::SinglesScorer.new() ]
  end
end

def make_scorer
  if ARGV.size == 1
    Farkle::Scorer.new( make_scorers( :open ) )
  elsif ARGV.size == 2
    if ARGV[ 0 ] == "--open"
      Farkle::Scorer.new( make_scorers( :open ) )
    elsif ARGV[ 0 ] == "--not-open"
      Farkle::Scorer.new( make_scorers( :not_open ) )
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
