class CreateDomains < ActiveRecord::Migration
  def change
    create_table :domains do |t|
      t.string :name
      t.boolean :blocked, default: false

      t.timestamps null: false
    end
  end
end
