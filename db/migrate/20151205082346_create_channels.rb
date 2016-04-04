class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.string :name

      t.timestamps null: false
    end

    add_index :channels, :name
  end
end
