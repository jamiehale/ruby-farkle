require File.join( File.dirname( __FILE__ ), "../rspec_helper" )

module Farkle
  describe DoubleTriplesScorer do
    let( :scorer ) { DoubleTriplesScorer.new() }
    it "should score a double-triple" do
      scorer.score( [ 1, 1, 1, 3, 3, 3 ] ).should include Score.new( 2500, [ 1, 2, 3, 4, 5, 6 ], :double_triple )
    end
  end
end
