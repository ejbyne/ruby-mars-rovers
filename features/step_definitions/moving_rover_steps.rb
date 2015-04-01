Given(/^I have inputted the plateau dimensions$/) do
  visit('/')
  step('I enter the relevant upper-right coordinates')
end

When(/^I input x and y coordinates and an orientation/) do
  fill_in('position', :with => '1 2 N')
  click_button('Enter')
end

Given(/^I have inputted the position of a rover$/) do
  step('I input x and y coordinates and an orientation')
end

When(/^I input a move command for that rover$/) do
  fill_in('commands', :with => 'LMLMLMLMM')
  click_button('Enter')
end
