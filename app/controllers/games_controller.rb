class GamesController < ApplicationController

  def new
    @lettersArray = []
    10.times{@lettersArray << ('A'..'Z').to_a.sample }


  end

  def score
  end

end
