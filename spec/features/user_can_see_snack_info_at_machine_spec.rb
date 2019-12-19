require 'rails_helper'

RSpec.describe 'When a user visits a vending machine show page', type: :feature do
  scenario 'see name and price of all snacks in vending machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    soda = dons.snacks.create(name: "Orange Soda", price: 1.50)
    chips = dons.snacks.create(name: "Cheetos", price: 0.75)

    visit machine_path(dons)
  save_and_open_page
    expect(page).to have_content("#{soda.name}: $1.50")
    expect(page).to have_content("#{chips.name}: $0.75")
    save_and_open_page
  end
end
