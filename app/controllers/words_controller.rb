class WordsController < ApplicationController
  load_and_authorize_resource

  def update
    @word = Word.find(params[:id])
    @success = @word.update_attributes(word_params)
  end

  def translate
    @word = Word.find(params[:word_id])
    @word.translate
  end

  private
    def word_params
      params.require(:word).permit(:text)
    end
end
