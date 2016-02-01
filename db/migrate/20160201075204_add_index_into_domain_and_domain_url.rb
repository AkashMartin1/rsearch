class AddIndexIntoDomainAndDomainUrl < ActiveRecord::Migration
  def change
    add_index :domains, :name, unique: true
    add_index :domain_urls, [:url, :domain_id], unique: true
  end
end
