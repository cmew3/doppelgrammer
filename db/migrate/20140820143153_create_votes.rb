class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :direction

      t.timestamps
    end
  end
end
