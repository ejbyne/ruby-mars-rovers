Given(/^I input the plateau dimensions$/) do
  visit('/')
  step('I enter the relevant upper-right coordinates')
end

When(/^I input the position of a rover/) do
  fill_in('position', :with => '1 2 N')
  click_button('Enter')
end

When(/^I input a command for that rover$/) do
  fill_in('commands', :with => 'LMLMLMLMM')
  click_button('Enter')
end
