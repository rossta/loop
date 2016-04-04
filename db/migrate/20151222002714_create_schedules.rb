class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.text :recurrence
      t.references :channel, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
