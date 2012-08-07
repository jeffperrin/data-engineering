class AddContentToImport < ActiveRecord::Migration
  def change
    add_column :imports, :content, :text
  end
end
