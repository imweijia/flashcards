class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.belongs_to :round, null: false
      t.belongs_to :card, null: false
      t.string :answer
      t.boolean :correctness

      t.timestamps
    end
  end
end
