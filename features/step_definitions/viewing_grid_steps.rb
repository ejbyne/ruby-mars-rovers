Then(/^I should see the plateau grid$/) do
  expect(page).to have_css('#grid')
  expect(page).to have_css('td', :count => 36)
end
