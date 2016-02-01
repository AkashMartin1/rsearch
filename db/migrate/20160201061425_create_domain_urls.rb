class CreateDomainUrls < ActiveRecord::Migration
  def change
    create_table :domain_urls do |t|
      t.integer :domain_id	
      t.text :url
      t.boolean :blocked

      t.timestamps null: false
    end
  end
end
