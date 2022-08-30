class AddForDonationToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :for_donation, :boolean, :default => false
    end
end
