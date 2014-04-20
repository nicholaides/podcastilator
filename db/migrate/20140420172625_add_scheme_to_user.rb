class AddSchemeToUser < ActiveRecord::Migration
  def change
    add_column :users, :scheme, :string
  end
end
