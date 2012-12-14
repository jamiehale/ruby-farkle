require File.join( File.dirname( __FILE__ ), "../rspec_helper" )

module Farkle
  
  describe Scorer do
    context "when not open" do
      let( :scorer ) { Scorer.new( :not_open ) }
      describe "singles" do
        it "should score single 1s" do
          scorer.score( [ 1 ] ).should include "100:1"
        end
        it "should score single 1s at other positions" do
          scorer.score( [ 2, 2, 1 ] ).should include "100:3"
        end
        context "when roll includes multiple 1s" do
          let( :scores ) { scorer.score( [ 1, 2, 1, 4, 1 ] ) }
          it "should score first 1" do
            scores.should include "100:1"
          end
          it "should score second 1" do
            scores.should include "100:3"
          end
          it "should score third 1" do
            scores.should include "100:5"
          end
        end
        it "should score single 5s" do
          scorer.score( [ 5 ] ).should include "50:1"
        end
        it "should score single 5s at other positions" do
          scorer.score( [ 3, 3, 4, 5 ] ).should include "50:4"
        end
        context "when roll includes multiple 5s" do
          let( :scores ) { scorer.score( [ 2, 5, 5, 3, 4, 5 ] ) }
          it "should score first 5" do
            scores.should include "50:2"
          end
          it "should score second 5" do
            scores.should include "50:3"
          end
          it "should score third 5" do
            scores.should include "50:6"
          end
        end
        context "when roll includes both 1s and 5s" do
          let( :scores ) { scorer.score( [ 1, 5, 2, 5, 1, 1 ] ) }
          it "should score first 1" do
            scores.should include "100:1"
          end
          it "should score first 5" do
            scores.should include "50:2"
          end
          it "should score second 5" do
            scores.should include "50:4"
          end
          it "should score second 1" do
            scores.should include "100:5"
          end
          it "should score third 1" do
            scores.should include "100:6"
          end
        end
      end
      context "when scoring farkles" do
        it "should recognize 1-die farkles" do
          scorer.score( [ 2 ] ).should be_empty
        end
        it "should recognize 2-die farkles" do
          scorer.score( [ 3, 4 ] ).should be_empty
        end
        it "should recognize 3-die farkles" do
          scorer.score( [ 6, 2, 3 ] ).should be_empty
        end
        it "should recognize 4-die farkles" do
          scorer.score( [ 2, 3, 3, 2 ] ).should be_empty
        end
        it "should recognize 5-die farkles" do
          scorer.score( [ 3, 4, 6, 6, 4 ] ).should be_empty
        end
        it "should recognize 6-die farkles" do
          scorer.score( [ 2, 4, 3, 6, 4, 3 ] ).should be_empty
        end
      end
      context "when scoring multiples" do
        it "should not score triples" do
          scorer.score( [ 2, 2, 2 ] ).should_not include "200:1,2,3"
        end
        it "should not score quadruples" do
          scorer.score( [ 3, 3, 3, 3 ] ).should_not include "600:1,2,3,4"
        end
        it "should not score quintuples" do
          scorer.score( [ 4, 4, 4, 4, 4 ] ).should_not include "1600:1,2,3,4,5"
        end
        it "should not score sextuples" do
          scorer.score( [ 5, 5, 5, 5, 5, 5 ] ).should_not include "4000:1,2,3,4,5,6"
        end
      end
      context "when scoring straights" do
        it "should not score a straight" do
          scorer.score( [ 1, 2, 3, 4, 5, 6 ] ).should_not include "1500:1,2,3,4,5,6"
        end
        it "should not score a messed up straight" do
          scorer.score( [ 2, 3, 5, 4, 6, 1 ] ).should_not include "1500:1,2,3,4,5,6"
        end
      end
      context "when scoring triple-doubles" do
        it "should not score a triple-double" do
          scorer.score( [ 1, 1, 2, 2, 3, 3 ] ).should_not include "1500:1,2,3,4,5,6"
        end
        it "should not score a triple-double in a sextuple" do
          scorer.score( [ 3, 3, 3, 3, 3, 3 ] ).should_not include "1500:1,2,3,4,5,6"
        end
      end
      context "when scoring double-triples" do
        it "should not score a double-triple" do
          scorer.score( [ 1, 1, 1, 2, 2, 2 ] ).should_not include "2500:1,2,3,4,5,6"
        end
        it "should not score a double-triple in a sextuple" do
          scorer.score( [ 4, 4, 4, 4, 4, 4 ] ).should_not include "2500:1,2,3,4,5,6"
        end
      end
    end
    context "when open" do
      it "should score singles"
      it "should recognize farkles"
      it "should score multiples"
      it "should score straights"
      it "should score triple-doubles"
      it "should score double-triples"
    end
  end
  
end
