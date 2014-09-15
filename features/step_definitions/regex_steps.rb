# This background step ensures that there are two arrays created
# each time one of the scenarios in the Regular Expressions feature
# is run.
#
Given /^I am matching keywords$/ do
  @words    = Array.new
  @numbers  = Array.new
end

# Match the words 'special' and 'alternate' with a single capture group
# to make the first two scenarios pass.
# - Use optional matching to match both 'a' and 'an', as explained
#   in the tutorial at http://codular.com/regex.
# - Use simple grouping as explained in the tutorial at
#   http://codular.com/regex.
#
# NOTE  Cucumber Matching
# 
# When writing matching expressions in Cucumber step definitions,
# 'Given','When','Then', and 'And' are freely interchangeable.
# An expression written with 'When' in the step definitions could
# match an expression in the feature files that starts with any of 
# these four keywords.
#
# They are kept separate for the sake of readability.  In our step
# definitions, we can just use 'Given' for any background steps,
# 'When' for any steps matching an action to be taken,
# and 'Then' for any steps matching an expected outcome.
# There's no need to use the 'And' keyword in step definitions.
#
When /^I have a () word$/ do |word|
  @words << word
end

# Match the data between the quotes.  Follow the steps below to write
# a regular expression to make the next two scenarios pass.
# - Escape quotation marks with backslashes \
# - Create a capture group in parentheses () between the escaped quote marks.
# - Use square brackets to create collection.
# - Use the characters discussed in the 'Predefined Groups' section of the
#   tutorial at http://codular.com/regex to match a whole word and a space.
# - Match one or more occurrences of the bracketed collection you have created
#   as explained in the 'Multiple Occurrences' section of the tutorial at
#   http://codular.com/regex.
#
When /^I have data $/ do |data|
  @words << data
end

# Write a regular expression to match the following lines:
#   I have a 1
#   I have a 23
#   I have an 18
#
# - Write your expression between ^ and $, the start-of-line and
#   end-of-line matching characters.
# - Use the optional character matcher so that the expression
#   matches both a and an.
# - Use the number quantifier to match one or more digits
#   as explained in 'Predefined Groups' and 'Multiple Occurrences'
#   in the tutorial at http://codular.com/regex.
# - Make sure the number quantifier expression is inside of a capture
#   group so that it is captured as the variable 'num'.
#
When /^$/ do |num|
  # *INFO*
  #
  # num is actually a string when first captured,
  # so we call #to_i on it to turn it into
  # an integer when adding it to the array.
  #
  @numbers << num.to_i
end

# Write an expression to capture the following line:
#   I have a sum of 42
#
# - As above, use a capture group and a number quantifier expression
#   to ensure that the value '42' is passed to the variable 'sum'.
#
Then /^$/ do |sum|
  # *INFO*
  #
  # This is an RSpec expectation.
  # It will raise an error unless it evaluates correctly,
  # causing the Cucumber test to fail and this step to turn red
  # in the terminal window.
  #
  # Ruby does not have a 'sum' method to call on an array,
  # so instead, we are asserting that the integer value of sum
  # must be equal to the output of this function, which 
  # iterates over each member of the array @numbers
  # and adds them to the value tot.
  #
  # A simpler way to get the sum of all numbers is to call the 
  # method #inject and tell it to call the method + on each member,
  # like this:
  #
  #   @numbers.inject(:+)
  #
  expect(sum.to_i).to eq(@numbers.inject {|tot,x| tot + x})
end

# -- These are just matchers for the outcomes of the first four scenarios. --
Then /^I select it$/ do
  expect(@words.count == 1).to be_true
end

Then /^I select them$/ do
  expect(@words.count > 1).to be_true
end
