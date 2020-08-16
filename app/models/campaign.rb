class Campaign < ApplicationRecord
  has_one_attached :image

  belongs_to :user
  has_many :options

  validates_presence_of :title, :description

  before_update :finished?

  private 

  # Checks if the campaign is finished and aborts the Campaign update
  def finished?
    if finished
      throw(:abort)
    end
  end
end
