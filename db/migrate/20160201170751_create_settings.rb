class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :index
      t.string :status

      t.timestamps null: false
    end
  end
end
