Then(/^I should see the plateau grid$/) do
  expect(page).to have_css('#grid')
  expect(page).to have_css('td', :count => 36)
end

Then(/^I should see that rover on the grid$/) do
  expect(page).to have_css('.glyphicon')
end
