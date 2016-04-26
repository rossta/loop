class AddUserIdToAccounts < ActiveRecord::Migration
  def change
    change_table :accounts do |t|
      t.references :user, index: true, foreign_key: true
    end
  end
end
