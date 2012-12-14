require File.join( File.dirname( __FILE__ ), "../rspec_helper" )

module Farkle
  describe Score do
    let( :score ) { Score.new( 1000, [ 1, 2, 3 ], :triple ) }
    it "should have a value" do
      score.value.should == 1000
    end
    it "should have an array of dice" do
      score.dice_indices.should == [ 1, 2, 3 ]
    end
    it "should have a type" do
      score.type.should == :triple
    end
  end
end