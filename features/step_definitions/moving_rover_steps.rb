Given(/^I have inputted the plateau dimensions$/) do
  visit('/')
  step('I enter the relevant upper-right coordinates')
end

When(/^I input x and y coordinates and an orientation/) do
  fill_in('command', :with => '1 2 N')
  click_button('Enter')
end
