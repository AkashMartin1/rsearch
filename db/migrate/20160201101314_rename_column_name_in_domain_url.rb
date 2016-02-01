class RenameColumnNameInDomainUrl < ActiveRecord::Migration
  def change
    rename_column :domain_urls, :valid, :valid_url
  end
end
