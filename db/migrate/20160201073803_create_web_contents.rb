class CreateWebContents < ActiveRecord::Migration
  def change
    create_table :web_contents do |t|
      t.text :data
      t.integer :domain_url_id

      t.timestamps null: false
    end
  end
end
