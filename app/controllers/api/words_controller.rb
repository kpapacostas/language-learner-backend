class Api::WordsController < ApplicationController

  def index
    @words = Word.all
    render json: @words
  end

  def create
    @word = Word.new(word_params)

    if @word.save
      render json: @word
    else
      render json: {errors: @word.errors.full_messages}, status: 422
    end
  end

  private
  def word_params
    params.permit(:name, :english_translation, :language_id)
  end

end
