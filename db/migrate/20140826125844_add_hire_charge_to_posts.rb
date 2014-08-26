class AddHireChargeToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :hire_charge, :integer, default: 50
  end
end
