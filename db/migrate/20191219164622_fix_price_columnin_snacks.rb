class FixPriceColumninSnacks < ActiveRecord::Migration[5.1]
  def change
    remove_column :snacks, :price
    add_column :snacks, :price, :decimal, :precision => 4, :scale => 2
  end
end
