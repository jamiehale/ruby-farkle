require File.join( File.dirname( __FILE__ ), "../rspec_helper" )

module Farkle
  describe Scorer do
    context "with no scorers" do
      let( :scorer ) { Scorer.new( [] ) }
      it "should always return farkles" do
        scorer.score( [ 1 ] ).should be_empty
      end
      it "should always return farkles" do
        scorer.score( [ 1, 2, 3, 4, 5, 6 ] ).should be_empty
      end
    end
    context "with 1 scorer" do
      let( :dummy_scorer ) { double( "DummyScorer" ) }
      let( :scorer ) { Scorer.new( [ dummy_scorer ] ) }
      it "should defer scoring to the dummy scorer" do
        dummy_scorer.should_receive( :score ).with( [ 1, 2, 3, 4, 5, 6 ] ).and_return( [ "1500:1,2,3,4,5,6" ] )
        scorer.score( [ 1, 2, 3, 4, 5, 6 ] ).should include "1500:1,2,3,4,5,6"
      end
    end
    context "with multiple scorers" do
      let( :dummy_scorer1 ) { double( "DummyScorer1" ) }
      let( :dummy_scorer2 ) { double( "DummyScorer2" ) }
      let( :dummy_scorer3 ) { double( "DummyScorer3" ) }
      let( :scorer ) { Scorer.new( [ dummy_scorer1, dummy_scorer2, dummy_scorer3 ] ) }
      it "should defer scoring to each dummy scorer" do
        dummy_scorer1.should_receive( :score ).with( [ 1, 2, 3, 4, 5, 6 ] ).and_return( [ "1500:1,2,3,4,5,6" ] )
        dummy_scorer2.should_receive( :score ).with( [ 1, 2, 3, 4, 5, 6 ] ).and_return( [ "100:1", "50:5" ] )
        dummy_scorer3.should_receive( :score ).with( [ 1, 2, 3, 4, 5, 6 ] ).and_return( [] )
        scores = scorer.score( [ 1, 2, 3, 4, 5, 6 ] )
        scores.should include "1500:1,2,3,4,5,6"
        scores.should include "100:1"
        scores.should include "50:5"
      end
    end
  end
end
