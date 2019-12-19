require 'rails_helper'

RSpec.describe 'When a user visits a vending machine show page', type: :feature do
  scenario 'see name and price of all snacks in vending machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    soda = dons.snacks.create(name: "Orange Soda", price: 1.50)
    chips = dons.snacks.create(name: "Cheetos", price: 0.75)

    visit machine_path(dons)

    expect(page).to have_content("#{soda.name}: $#{soda.price}")
    expect(page).to have_content("#{chips.name}: $#{chips.price}")
  end
end
