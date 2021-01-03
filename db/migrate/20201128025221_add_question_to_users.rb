class AddQuestionToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :question, :string
  end
end
