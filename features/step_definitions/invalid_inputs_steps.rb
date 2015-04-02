When(/^I enter invalid upper\-right coordinates$/) do
  fill_in('coords', :with => '55')
  click_button('Enter')
end

When(/^I input an invalid position$/) do
  fill_in('position', :with => '12N')
  click_button('Enter')
end

When(/^I input invalid coordinates$/) do
  fill_in('position', :with => '1 6 N')
  click_button('Enter')
end

When(/^I try to move the rover outside the grid$/) do
  fill_in('commands', :with => 'MMMM')
  click_button('Enter')
end

When(/^I input an invalid command$/) do
  fill_in('commands', :with => 'LRMZ')
  click_button('Enter')
end

When(/^I input the position of another rover$/) do
  step('I input the position of a rover')
end

When(/^I try to move that rover onto the same cell as the first rover$/) do
  step('I input a command for that rover')
end
