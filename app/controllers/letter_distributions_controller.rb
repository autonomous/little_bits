class LetterDistributionsController < ApplicationController
  def new
    @letter_distribution = LetterDistribution.new
  end

  def create
    if @letter_distribution = LetterDistribution.create(letter_distribution_params)
      redirect_to letter_distribution_url(@letter_distribution)
    else
      render :new
    end
  end

  def show
    @letter_distribution = LetterDistribution.find(params[:id])
  end

private

  def letter_distribution_params
    params.require(:letter_distribution).permit!
  end
end
