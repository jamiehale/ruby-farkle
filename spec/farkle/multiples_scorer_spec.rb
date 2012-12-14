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
      it "should score triple 3s" do
        scorer.score( [ 1, 3, 2, 3, 3 ] ).should include Score.new( 300, [ 2, 4, 5 ], :triple )
      end
      it "should score triple 4s" do
        scorer.score( [ 1, 2, 4, 4, 5, 4 ] ).should include Score.new( 400, [ 3, 4, 6 ], :triple )
      end
      it "should score triple 5s" do
        scorer.score( [ 5, 5, 5 ] ).should include Score.new( 500, [ 1, 2, 3 ], :triple )
      end
      it "should score triple 6s" do
        scorer.score( [ 6, 2, 6, 2, 6 ] ).should include Score.new( 600, [ 1, 3, 5 ], :triple )
      end
    end
  end
end
