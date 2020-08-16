require 'rails_helper'

RSpec.describe Vote, type: :model do
  it { is_expected.to(belong_to(:campaign)) }
  it { is_expected.to(belong_to(:option)) }

  describe 'Validates' do
    let(:vote) { create(:vote) }

    context 'with valid factory' do
      it { expect(vote).to(be_valid) }
    end

    context 'with campaign finished' do
      let(:campaign_finished) { create(:campaign, finished: true) }
      let(:option) { create(:option) }
      
      it 'is invalid create' do 
        vote = Vote.new(campaign: campaign_finished, option: option, voter: Faker::Crypto.sha1)

        expect(vote.save).to(eq(false)) 
      end
    end

    context 'when voter alread voted' do
      let(:voter_code) { Faker::Crypto.sha1 }
      let(:first_vote) { create(:vote, voter: voter_code) }
      let(:campaign) { first_vote.campaign }

      it 'is invalid create' do 
        vote = Vote.new(campaign: campaign, voter: voter_code)

        expect(vote.save).to(eq(false)) 
      end
    end
  end
end
