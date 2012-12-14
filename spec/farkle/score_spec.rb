require File.join( File.dirname( __FILE__ ), "../rspec_helper" )

module Farkle
  describe Score do
    it "should instantiate" do
      Score.new()
    end
  end
end
