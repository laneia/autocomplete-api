class DictionariesController < ApplicationController
  def search
    dictionaries = Dictionary.where("word ILIKE ?", "%#{params[:input]}%").limit(20)
    render json: dictionaries
  end
end
