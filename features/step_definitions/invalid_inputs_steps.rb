When(/^I enter invalid upper\-right coordinates$/) do
  fill_in('coords', :with => '55')
  click_button('Enter')  
end
