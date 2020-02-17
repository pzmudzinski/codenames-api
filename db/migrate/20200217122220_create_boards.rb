# frozen_string_literal: true

class CreateBoards < ActiveRecord::Migration[6.0]
  def change
    create_table :boards do |t|
      t.integer :grid_size
      t.jsonb :tiles
      t.string :starting_team
      t.string :code
      t.string :status

      t.timestamps
    end
  end
end
