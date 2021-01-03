class AddDeptlocationToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :deptlocation, :string
  end
end
