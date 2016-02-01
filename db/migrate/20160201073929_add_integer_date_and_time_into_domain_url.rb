class AddIntegerDateAndTimeIntoDomainUrl < ActiveRecord::Migration
  def change
    add_column :domain_urls, :date_and_time_i, :integer
  end
end
