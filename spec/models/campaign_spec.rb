require 'rails_helper'

RSpec.describe Campaign, type: :model do
  it { is_expected.to(validate_presence_of(:title)) }
  it { is_expected.to(validate_presence_of(:description)) }

  it { is_expected.to(belong_to(:user)) }

  describe 'Validates' do
    let(:campaign) { create(:campaign) }

    context 'with valid factory' do
      it { expect(campaign).to(be_valid) }
    end

    context 'with campaign finished' do
      let(:campaign_finished) { create(:campaign, finished: true) }
      
      it 'is invalid update' do 
        campaign_finished.title = 'Novo titulo'
         
        expect(campaign_finished.save).to(eq(false)) 
      end
    end
  end
end
