require File.join( File.dirname( __FILE__ ), "../rspec_helper" )

module Farkle
  
  describe MultiplesScorer do
    let( :scorer ) { MultiplesScorer.new() }
    context "when scoring triples" do
      it "should score triple 1s" do
        scorer.score( [ 1, 1, 1 ] ).should include Score.new( 1000, [ 1, 2, 3 ], :triple )
      end
      it "should score triple 1s anywhere in the roll" do
        scorer.score( [ 2, 1, 3, 1, 1, 5 ] ).should include Score.new( 1000, [ 2, 4, 5 ], :triple )
      end
      it "should score triple 2s" do
        scorer.score( [ 2, 2, 2 ] ).should include Score.new( 200, [ 1, 2, 3 ], :triple )
      end
    end
  end
end
