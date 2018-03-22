class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :insurance
      t.float :latitude
      t.float :longitude
    end
  end
end
