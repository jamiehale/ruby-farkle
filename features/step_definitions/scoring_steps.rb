Given /^the player is not open$/ do
  @open_or_not_open = "--not-open"
end

Given /^the roll "(.*?)"$/ do |roll|
  @roll = roll
end

When /^the scorer is run$/ do
  @scores = `ruby bin/scorer.rb #{@open_or_not_open} #{@roll}`
  raise( 'Command failed!' ) unless $?.success?
end

Then /^the scores should include "(.*?)"$/ do |score|
  @scores.should include score
end

Then /^the scores should not include "(.*?)"$/ do |score|
  @scores.should_not include score
end