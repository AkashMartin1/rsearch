class AddIndexForDateAndTimeI < ActiveRecord::Migration
  def change
    add_index :domain_urls, :date_and_time_i
  end
end
