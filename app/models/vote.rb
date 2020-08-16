class Vote < ApplicationRecord
  belongs_to :campaign
  belongs_to :option

  validates_presence_of :voter

  before_create :finished?
  before_create :voted?

  private 

  # Checks if the campaign is finished and aborts the Vote create
  def finished?
    if campaign.finished
      throw(:abort)
    end
  end

  # Checks if the voter already voted and aborts the Vote create
  def voted?
    voted = Vote.find_by(voter: voter).present?
    if voted
      throw(:abort)
    end
  end
end
