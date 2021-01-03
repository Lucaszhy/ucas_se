class AddQqToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :qq, :string
  end
end
