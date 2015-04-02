When(/^I enter the relevant upper\-right coordinates$/) do
  fill_in('max_coords', :with => '5 5')
  click_button('Enter')
end
