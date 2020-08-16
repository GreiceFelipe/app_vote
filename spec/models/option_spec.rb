require 'rails_helper'

RSpec.describe Option, type: :model do
  it { is_expected.to(validate_presence_of(:name)) }

  it { is_expected.to(belong_to(:campaign)) }
  it { is_expected.to(have_many(:votes)) }

  describe 'Validates' do
    let(:option) { create(:option) }

    context 'with valid factory' do
      it { expect(option).to(be_valid) }
    end
  end

end
