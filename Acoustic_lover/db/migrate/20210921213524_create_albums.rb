class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.integer :record_id
      t.string :title
      t.integer :year
      t.boolean :live

      t.timestamps
    end
  end
end
