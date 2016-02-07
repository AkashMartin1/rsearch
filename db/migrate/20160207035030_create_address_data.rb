class CreateAddressData < ActiveRecord::Migration
  def change
    create_table :address_data do |t|
      t.string :city
      t.string :street_name
      t.string :street_address
      t.string :secondary_address
      t.string :building_number
      t.string :zip
      t.string :postcode
      t.string :time_zone
      t.string :street_suffix
      t.string :city_suffix
      t.string :city_prefix
      t.string :state
      t.string :state_abbr
      t.string :country
      t.string :country_code
      t.string :latitude
      t.string :longitude

      t.timestamps null: false
    end
  end
end
