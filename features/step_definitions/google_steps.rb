
When /^I search for \"([\w\s]+)\"$/ do |term|
  @search = GoogleSearch.new(@browser,:term => term)
  @search.start
end

Then /^\"([\w\s]+)\" appears in the results$/ do |term|
  expect(@search.found?(term)).to be_true
end
