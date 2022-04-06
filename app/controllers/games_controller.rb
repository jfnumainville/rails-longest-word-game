class GamesController < ApplicationController

  def new
    @lettersArray = []
    10.times{@lettersArray << ('A'..'Z').to_a.sample }
    @lettersArray = @lettersArray.join(" ")

  end

  def score
  end

end
