# frozen_string_literal: true

class BoardChannel < ApplicationCable::Channel
  def subscribed
    board = Board.find_by code: params[:room]
    reject unless board.present?
    return unless board.present?

    stream_for board
    board.increment!(:active_connections)
    BoardChannel.broadcast_to(board, board)
  end

  def unsubscribed
    return unless (board = Board.find_by(code: params[:room]))

    board.decrement!(:active_connections)
    BoardChannel.broadcast_to(board, board)
  end

  def reveal_tile(data)
    return unless (board = Board.find_by(code: params[:room]))

    board.open_tile(data['index'].to_i)
    board.save
    BoardChannel.broadcast_to(board, board)
  end

  def end_turn
    return unless (board = Board.find_by(code: params[:room]))

    board.end_turn
    board.save
    BoardChannel.broadcast_to(board, board)
  end
end
