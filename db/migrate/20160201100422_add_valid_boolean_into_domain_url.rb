class AddValidBooleanIntoDomainUrl < ActiveRecord::Migration
  def change
    add_column :domain_urls, :valid, :boolean, default: true
  end
end
