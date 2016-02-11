class WelcomeController < ApplicationController
  def index
     @address_data = AddressData.limit(1000).offset(100)
  end
end
