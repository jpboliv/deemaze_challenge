class AddOwnerToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :owner, :string
  end
end
