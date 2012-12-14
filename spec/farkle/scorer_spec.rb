require File.join( File.dirname( __FILE__ ), "../rspec_helper" )

module Farkle
  
  describe Scorer do
    context "when not open" do
      it "should score singles"
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
