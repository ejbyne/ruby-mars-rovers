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
