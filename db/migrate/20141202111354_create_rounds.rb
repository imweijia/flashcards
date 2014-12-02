class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.belongs_to :user, null: false
      t.belongs_to :deck, null: false
      t.integer :chances, default: 5
      t.integer :score, default: 0

      t.timestamps
    end
  end
end
