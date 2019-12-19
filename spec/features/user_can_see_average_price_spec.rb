require 'rails_helper'

RSpec.describe 'When a user visits a vending machine show page', type: :feature do
  scenario 'see name and price of all snacks in vending machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    soda = dons.snacks.create(name: "Dr.Pepper", price: 1.25)
    snickers = dons.snacks.create(name: "Snickers", price: 1.75)

    visit machine_path(dons)
    expect(page).to have_content("Average Price: $1.50")
  end
end
