class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :provider, null: false, limit: 24
      t.string :uid, null: false
      t.string :name, null: false
      t.string :email
      t.string :nickname
      t.string :first_name
      t.string :last_name
      t.string :location
      t.string :description
      t.string :image
      t.string :phone, limit: 24
      t.hstore :urls, default: {}
      t.string :token
      t.string :secret
      t.string :expires
      t.datetime :expires_at

      t.timestamps null: false
    end

    add_index :accounts, :provider
    add_index :accounts, :uid
  end
end
