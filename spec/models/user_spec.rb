require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to(validate_presence_of(:name)) }

  it { is_expected.to(have_many(:campaigns)) }

  describe 'Validates' do
    let(:user) { create(:user) }

    context 'with valid factory' do
      it { expect(user).to(be_valid) }
    end
  end
end
