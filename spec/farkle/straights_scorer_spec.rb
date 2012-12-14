require File.join( File.dirname( __FILE__ ), "../rspec_helper" )

module Farkle
  describe StraightsScorer do
    let( :scorer ) { StraightsScorer.new() }
    it "should score a straight" do
      scorer.score( [ 1, 2, 3, 4, 5, 6 ] ).should include Score.new( 1500, [ 1, 2, 3, 4, 5, 6 ], :straight )
    end
  end
end
