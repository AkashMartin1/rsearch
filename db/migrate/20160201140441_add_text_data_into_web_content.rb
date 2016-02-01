class AddTextDataIntoWebContent < ActiveRecord::Migration
  def change
    add_column :web_contents, :text_data, :text
  end
end
