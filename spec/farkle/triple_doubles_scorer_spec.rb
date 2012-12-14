require File.join( File.dirname( __FILE__ ), "../rspec_helper" )

module Farkle
  describe TripleDoublesScorer do
    let( :scorer ) { TripleDoublesScorer.new() }
    it "should score a triple-double" do
      scorer.score( [ 1, 1, 2, 2, 3, 3 ] ).should include Score.new( 1500, [ 1, 2, 3, 4, 5, 6 ], :triple_double )
    end
    it "should score a messed up triple-double" do
      scorer.score( [ 2, 3, 1, 1, 2, 3 ] ).should include Score.new( 1500, [ 1, 2, 3, 4, 5, 6 ], :triple_double )
    end
  end
end
