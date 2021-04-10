class AddVintageToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :vintage, :integer
  end
end
