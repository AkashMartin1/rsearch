class AddressData < ActiveRecord::Base

  self.table_name = 'address_data'

  def seed
    10000000000.times do
      address_data                   = AddressData.new
      address_data.city              = Faker::Address.city #=> "Imogeneborough"
      address_data.street_name       = Faker::Address.street_name #=> "Larkin Fork"
      address_data.street_address    = Faker::Address.street_address #=> "282 Kevin Brook"
      address_data.secondary_address = Faker::Address.secondary_address #=> "Apt. 672"
      address_data.building_number   = Faker::Address.building_number #=> "7304"
      # address_data.zip_code  = Faker::Address.zip_code #=> "58517"
      address_data.zip               = Faker::Address.zip #=> "58517"
      address_data.postcode          = Faker::Address.postcode #=> "58517"
      address_data.time_zone         = Faker::Address.time_zone #=> "Asia/Yakutsk"
      address_data.street_suffix     = Faker::Address.street_suffix #=> "Street"
      address_data.city_suffix       = Faker::Address.city_suffix #=> "fort"
      address_data.city_prefix       = Faker::Address.city_prefix #=> "Lake"
      address_data.state             = Faker::Address.state #=> "California"
      address_data.state_abbr        = Faker::Address.state_abbr #=> "AP"
      address_data.country           = Faker::Address.country #=> "French Guiana"
      address_data.country_code      = Faker::Address.country_code #=> "IT"
      address_data.latitude          = Faker::Address.latitude #=> "-58.17256227443719"
      address_data.longitude         = Faker::Address.longitude #=> "-156.65548382095133"
      if address_data.save
        puts "Hooray it is save : #{address_data.to_json}".colorize(:green)
      else
        puts 'can not save !'.colorize(:red)
      end
    end
  end
end
