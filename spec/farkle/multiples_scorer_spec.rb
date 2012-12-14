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
    context "when scoring quadruples" do
      context "quadruples" do
        it "should score quadruple 1s" do
          scorer.score( [ 1, 1, 1, 1 ] ).should include Score.new( 2000, [ 1, 2, 3, 4 ], :quadruple )
        end
        it "should score quadruple 2s" do
          scorer.score( [ 2, 2, 3, 2, 2 ] ).should include Score.new( 400, [ 1, 2, 4, 5 ], :quadruple )
        end
        it "should score quadruple 3s" do
          scorer.score( [ 3, 3, 3, 3 ] ).should include Score.new( 600, [ 1, 2, 3, 4 ], :quadruple )
        end
        it "should score quadruple 4s" do
          scorer.score( [ 4, 4, 4, 4 ] ).should include Score.new( 800, [ 1, 2, 3, 4 ], :quadruple )
        end
        it "should score quadruple 5s" do
          scorer.score( [ 5, 5, 5, 5 ] ).should include Score.new( 1000, [ 1, 2, 3, 4 ], :quadruple )
        end
        it "should score quadruple 6s" do
          scorer.score( [ 6, 6, 6, 6 ] ).should include Score.new( 1200, [ 1, 2, 3, 4 ], :quadruple )
        end
      end
      context "triples too" do
        let( :scores ) { scorer.score( [ 1, 1, 1, 1 ] ) }
        it "should score 4 choose 3 (3) triples too" do
          scores.should include Score.new( 1000, [ 1, 2, 3 ], :triple )
        end
      end
    end
    context "when scoring quintuples" do
      it "should score quintuple 1s" do
        scorer.score( [ 1, 1, 1, 1, 1 ] ).should include Score.new( 4000, [ 1, 2, 3, 4, 5 ], :quintuple )
      end
    end
    context "when scoring sextuples" do
      it "should score sextuple 1s" do
        scorer.score( [ 1, 1, 1, 1, 1, 1 ] ).should include Score.new( 8000, [ 1, 2, 3, 4, 5, 6 ], :sextuple )
      end
    end
  end
end
