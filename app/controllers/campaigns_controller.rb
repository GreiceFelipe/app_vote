class CampaignsController < ApplicationController
  before_action :set_campaigns, only: [:show]
  
  def index
    @campaigns = Campaign.all
  end

  def show
    @voter_number = voter_number
    @voter_present = Vote.find_by(voter: @voter_number, campaign: @campaign).present? 
    set_votes_count if @campaign.finished
  end

  private

  def set_campaigns
    @campaign = Campaign.find(params[:id])
  end

  def set_votes_count
    all_votes = Vote.where(campaign_id: 1)
    total = all_votes.size
    @total_votes = []

    all_votes.group_by(&:option).each do |option, votes|
      percent = (votes.size.to_f/total.to_f)*100
      @total_votes << {name: option.name, percent: percent}
    end
  end

  def voter_number
    return session[:voter] if session[:voter].present?

    session[:voter] = SecureRandom.urlsafe_base64

    session[:voter]
  end
end
