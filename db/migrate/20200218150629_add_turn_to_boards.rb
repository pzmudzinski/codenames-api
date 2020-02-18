class AddTurnToBoards < ActiveRecord::Migration[6.0]
  def change
    add_column :boards, :current_turn, :string
    add_column :boards, :winner, :string
  end
end
