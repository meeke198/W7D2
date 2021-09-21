class CreateTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :tracks do |t|
      t.integer :title
      t.integer :ord
      t.text :lyrics
      t.boolean :regular

      t.timestamps
    end
  end
end
