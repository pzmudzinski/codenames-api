# frozen_string_literal: true

class Board < ApplicationRecord
  enum status: { in_progress: 'in_progress', ended: 'ended' }
  enum starting_team: { blue: 'blue', red: 'red ' }
  attribute :grid_size, :integer, default: 5

  validates :code, presence: true, length: { minimum: 3 }
  validates :active_connections, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def tiles_count
    grid_size * grid_size
  end

  def tiles_opened_by(team)
    tiles.select do |elem|
      elem['status'] == "opened_by_#{team}"
    end
  end

  def toggled_team
    if current_turn == 'red'
      'blue'
    else
      'red'
    end
  end

  def end_turn
    self.current_turn = toggled_team
  end

  def open_tile(index)
    unless index.is_a?(Integer) && index.between?(0, tiles_count)
      raise ArgumentError, "index should be between 0-#{tiles_count}"
    end

    current_team = current_turn

    tile = tiles[index]

    # hitting a bomb
    if tile['assignment'] == 'bomb'
      tile['status'] = "opened_by_#{current_team}"
      self.winner = toggled_team
      self.status = 'ended'
      self.current_turn = nil
      return
    end

    # hitting last word
    if tile['assignment'] == current_team && tiles_opened_by(current_team) == 1
      tile['status'] = "opened_by_#{current_team}"
      self.status = 'ended'
      self.winner = current_team
      self.current_turn = nil
      return
    end

    tile['status'] = "opened_by_#{current_team}"
    if tile['assignment'] == 'none' || tile['assignment'] != current_team
      self.current_turn = toggled_team
    end
  end
end
