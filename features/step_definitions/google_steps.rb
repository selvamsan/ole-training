
When /^I search for \"([\w\s]+)\"$/ do |term|
  @search = GoogleSearch.new(@browser,:term => term)
end

Then // do |term|
  expect(@search.results_exist?(term)).to be_true
end
