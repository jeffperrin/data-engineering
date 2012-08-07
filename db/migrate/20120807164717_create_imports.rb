class CreateImports < ActiveRecord::Migration
  def change
    create_table :imports do |t|
      t.string :file_name
      t.timestamps
    end
  end
end
