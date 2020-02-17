# frozen_string_literal: true

class BoardsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def show
    @board = Board.find_by! code: params[:id], status: 'in_progress'
    render json: @board
  end

  private

  def record_not_found
    render json: { error: '404 Not Found' }, status: 404
  end
end
