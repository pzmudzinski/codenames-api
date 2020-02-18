# frozen_string_literal: true

class CreateBoards < ActiveRecord::Migration[6.0]
  def change
    create_table :boards do |t|
      t.integer :grid_size, default: 5
      t.jsonb :tiles, null: false
      t.column :starting_team, :string, default: 'blue', null: false
      t.string :code, null: false
      t.string :status, default: 'in_progress', null: false

      t.timestamps
    end
  end
end
