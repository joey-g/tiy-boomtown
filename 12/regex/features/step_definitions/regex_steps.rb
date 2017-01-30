Given(/^I have the email (.*)$/) do |email|
  @inst_email = email
end

When(/^I validate the email$/) do
  email_regex = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  @regex_comparison_result = email_regex.match(@inst_email)
end

Then(/^I expect it to be (valid|invalid)$/) do |switch|
  if switch == 'valid'
    expect(@regex_comparison_result).not_to be_nil
  else
    expect(@regex_comparison_result).to be_nil
  end
end
