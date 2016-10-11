class AddIndexToUsersEmail < ActiveRecord::Migration
  def change
  	add_index :users, :email, unnique: true
  end
end
