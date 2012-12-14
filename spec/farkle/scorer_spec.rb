require File.join( File.dirname( __FILE__ ), "../rspec_helper" )

module Farkle
  
  describe Scorer do
    context "when not open" do
      describe "singles" do
        let( :scorer ) { Scorer.new( :not_open ) }
        it "should score single 1s" do
          scorer.score( [ 1 ] ).should include "100:1"
        end
        it "should score single 5s" do
          scorer.score( [ 5 ] ).should include "50:1"
        end
      end
      it "should recognize farkles"
      it "should not score non-single combinations"
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
