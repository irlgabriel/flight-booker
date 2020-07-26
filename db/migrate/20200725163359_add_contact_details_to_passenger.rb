class AddContactDetailsToPassenger < ActiveRecord::Migration[6.0]
  def change
    add_column :passengers, :first_name, :string
    add_column :passengers, :last_name, :string
  end
end
