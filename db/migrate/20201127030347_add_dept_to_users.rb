class AddDeptToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :dept, :string
  end
end
