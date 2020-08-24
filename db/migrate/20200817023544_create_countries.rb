class CreateCountries < ActiveRecord::Migration[6.0]
  def up
    create_table :countries do |t|
      t.string :name
      t.string :url_flag
      t.string :symbol_currency
      t.string :currency_type
      t.string :dec_currency, default: '.'
      t.string :thousand_currency, default: ','

      t.timestamps
    end
  end

  def down
    drop_table :countries
  end
end
