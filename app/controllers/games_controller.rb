class GamesController < ApplicationController
  def new
    num = Random.new
    @letters = ('A'..'Z').to_a.sample(num.rand(5..10))
  end

  def score
    @word = params[:words]
    @grid = params[:grid]
    tests = @word.split('').map do |char|
      @grid.include? char.capitalize
    end.all?

    if tests == false || @word.length > @grid.length
      @answer = 'wrong letter(s) choosen or exceed word limit'
    else
      @answer = 'Correct word'
    end
  end
end
