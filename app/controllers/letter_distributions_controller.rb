class LetterDistributionsController < ApplicationController
  def new
    @letter_distribution = LetterDistribution.new
  end
end
