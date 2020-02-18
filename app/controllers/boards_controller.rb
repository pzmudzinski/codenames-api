# frozen_string_literal: true

class BoardsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def show
    @board = Board.find_by! code: params[:id], status: 'in_progress'
    render json: @board
  end

  def create
    board = Board.new(board_params)

    Board
      .where(status: 'in_progress', code: board_params[:code])
      .update_all(status: 'ended')

    board.current_turn = board.starting_team
    board.tiles = generate_tiles(board.grid_size * board.grid_size, board.starting_team)

    if board.save
      render json: board
    else
      render json: board.errors, status: :unprocessable_entity
    end
  end

  def generate_tiles(tiles_count, start_team)
    other_team = start_team == 'blue' ? 'red' : 'blue'

    word_base = Rails.configuration.word_base
    words = word_base.sample(tiles_count)

    starting_team_tiles = 9
    other_team_tiles = 8
    number_of_bombs = 1

    tiles = words.each_with_index.map do |word, index|
      {
        index: index,
        word: word,
        status: 'default',
        assignment: 'neutral'
      }
    end

    indices = [*0..tiles_count - 1]

    starting_team_tiles.times do
      start_team_tile_idx = indices.delete(indices.sample)
      tiles[start_team_tile_idx]['assignment'] = start_team
    end

    other_team_tiles.times do
      other_team_tile_idx = indices.delete(indices.sample)
      tiles[other_team_tile_idx]['assignment'] = other_team
    end

    number_of_bombs.times do
      bomb_idx = indices.delete(indices.sample)
      tiles[bomb_idx]['assignment'] = 'bomb'
    end

    tiles
  end

  private

  def board_params
    puts params.inspect
    params.require(:board).permit(:code, :starting_team, :grid_size)
  end

  def record_not_found
    render json: { error: '404 Not Found' }, status: 404
  end
end
