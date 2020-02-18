# frozen_string_literal: true

class Board < ApplicationRecord
  enum status: { in_progress: 'in_progress', ended: 'ended' }
  enum starting_team: { blue: 'blue', red: 'red ' }
  attribute :grid_size, :integer, default: 5

  validates :code, presence: true, length: { minimum: 3 }
end
