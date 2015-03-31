Given(/^I am on the start page$/) do
  visit('/')
end

Then(/^I should see "(.*?)"$/) do |arg1|
  expect(page).to have_content(arg1)
end
