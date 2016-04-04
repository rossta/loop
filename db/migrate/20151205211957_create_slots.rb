class CreateSlots < ActiveRecord::Migration
  def change
    create_table :slots do |t|
      t.references :post, index: true, foreign_key: true
      t.references :schedulable, polymorphic: true
      t.datetime :publish_at
      t.datetime :published_at

      t.timestamps null: false
    end
  end
end
