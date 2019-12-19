require 'rails_helper'

RSpec.describe 'When a user visits a snack show page', type: :feature do
    scenario 'see info for that snack, where its located, and average price and inventory count of those locations' do
      owner = Owner.create(name: "Sam's Snacks")
      dons  = owner.machines.create(location: "Don's Mixed Drinks")
      joes  = owner.machines.create(location: "Joe's Snack Shack")
      soda = dons.snacks.create(name: "Orange Soda", price: 2.00)
      joes.snacks << soda
      chips = dons.snacks.create(name: "Cheetos", price: 1.00)
      gum = joes.snacks.create(name: "Bubblicious Gum", price: 1.50)

      visit snack_path(soda)
      expect(page).to have_content("Orange Soda")
      expect(page).to have_content("Price: $2.00")
      expect(page).to have_content("Don's Mixed Drinks: 2 kinds of snacks, average price of $1.50")
      expect(page).to have_content("Joe's Snack Shack: 2 kinds of snacks, average price of $1.75")

    end
  end
