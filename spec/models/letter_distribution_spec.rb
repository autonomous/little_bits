require 'rails_helper'

RSpec.describe LetterDistribution, type: :model do
  describe 'validations' do
    it{ is_expected.to validate_presence_of(:original_sentence)}
  end
end
