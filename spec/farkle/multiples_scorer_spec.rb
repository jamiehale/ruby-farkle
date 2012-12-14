require File.join( File.dirname( __FILE__ ), "../rspec_helper" )

module Farkle
  
  describe MultiplesScorer do
    let( :scorer ) { MultiplesScorer.new() }
    it "should score triples" do
      scorer.score( [ 1, 1, 1 ] ).should include "1000:1,2,3:triple"
    end
  end
end
