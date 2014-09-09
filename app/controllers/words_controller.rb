class WordsController < ApplicationController
  def update
    @word = Word.find(params[:id])
    @success = @word.update_attributes(word_params)
asd
  end

  private
    def word_params
      params.require(:word).permit(:text)
    end
end
