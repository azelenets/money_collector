class CreateCurrencies < ActiveRecord::Migration
  def change
    create_table :currencies do |t|
      t.string :name
      t.string :code
      t.boolean :collected, default: false

      t.timestamps null: false
    end

    create_table :countries_currencies, id: false do |t|
      t.belongs_to :currency
      t.belongs_to :country
    end
  end
end
