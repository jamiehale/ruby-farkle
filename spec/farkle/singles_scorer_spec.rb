require File.join( File.dirname( __FILE__ ), "../rspec_helper" )

module Farkle
  describe SinglesScorer do
    let( :scorer ) { SinglesScorer.new() }
    it "should score single 1s" do
      scorer.score( [ 1 ] ).should include Score.new( 100, [ 1 ], :single )
    end
    it "should score single 1s at other positions" do
      scorer.score( [ 2, 2, 1 ] ).should include Score.new( 100, [ 3 ], :single )
    end
    context "when roll includes multiple 1s" do
      let( :scores ) { scorer.score( [ 1, 2, 1, 4, 1 ] ) }
      it "should score first 1" do
        scores.should include Score.new( 100, [ 1 ], :single )
      end
      it "should score second 1" do
        scores.should include Score.new( 100, [ 3 ], :single )
      end
      it "should score third 1" do
        scores.should include Score.new( 100, [ 5 ], :single )
      end
    end
    it "should score single 5s" do
      scorer.score( [ 5 ] ).should include Score.new( 50, [ 1 ], :single )
    end
    it "should score single 5s at other positions" do
      scorer.score( [ 3, 3, 4, 5 ] ).should include Score.new( 50, [ 4 ], :single )
    end
    context "when roll includes multiple 5s" do
      let( :scores ) { scorer.score( [ 2, 5, 5, 3, 4, 5 ] ) }
      it "should score first 5" do
        scores.should include Score.new( 50, [ 2 ], :single )
      end
      it "should score second 5" do
        scores.should include Score.new( 50, [ 3 ], :single )
      end
      it "should score third 5" do
        scores.should include Score.new( 50, [ 6 ], :single )
      end
    end
    context "when roll includes both 1s and 5s" do
      let( :scores ) { scorer.score( [ 1, 5, 2, 5, 1, 1 ] ) }
      it "should score first 1" do
        scores.should include Score.new( 100, [ 1 ], :single )
      end
      it "should score first 5" do
        scores.should include Score.new( 50, [ 2 ], :single )
      end
      it "should score second 5" do
        scores.should include Score.new( 50, [ 4 ], :single )
      end
      it "should score second 1" do
        scores.should include Score.new( 100, [ 5 ], :single )
      end
      it "should score third 1" do
        scores.should include Score.new( 100, [ 6 ], :single )
      end
    end
  end
end
