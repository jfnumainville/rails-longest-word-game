require 'open-uri'
require 'json'
class GamesController < ApplicationController

  def new
    @lettersArray = []
    10.times{@lettersArray << ('A'..'Z').to_a.sample }
    @letters = @lettersArray.join(" ")

  end

  def score
    @word = params[:word]
    @randomLetters  = params[:randomLetters].split(" ")
    @results = ""

    if api_result(@word) == false
    @results = "Sorry but #{@word} does not seem to be a valid English word...."
    else
      letter_found = true
      @word.split("").each do |letter|
        if @randomLetters.include?(letter.upcase)
          @randomLetters.delete(letter)

        else
           letter_found = false

           break
        end

      end
          if letter_found == false
            @results = "Sorry but #{@word} can't be built out of #{@randomLetters}"
          else
            @results = "Congratulations #{@word.capitalize} is a valid English word!"

    end

  end
end
end


def api_result(word)
  url = "https://wagon-dictionary.herokuapp.com/#{word}"
  dictionary_seriliazed = URI.open(url).read
  dictionary = JSON.parse(dictionary_seriliazed)
  dictionary["found"]
end
