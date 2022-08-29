class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.belongs_to :user, foreign_key: true
      t.string :name
      t.string :location
      t.datetime :expiration_date
      t.string :image

      t.timestamps
    end
  end
end
