# frozen_string_literal: true

class AddActiveConnectionsToBoards < ActiveRecord::Migration[6.0]
  def change
    add_column :boards, :active_connections, :integer, default: 0
  end
end
