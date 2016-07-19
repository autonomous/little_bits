require 'rails_helper'

RSpec.describe LetterDistributionsController, type: :controller do
  describe 'create#POST' do
    subject{ post :create, letter_distribution: params }

    context 'valid params' do
      let(:params) do
        {
          original_sentence: 'I like otters and spanking rabbits!'
        }
      end

      it 'creates a new letter distribution' do
        expect{subject}.to change{LetterDistribution.count}.by(1)
      end

      it 'redirects' do
        expect(subject).to redirect_to(letter_distribution_url(LetterDistribution.last.id))
      end
    end
  end
end
