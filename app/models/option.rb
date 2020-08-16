class Option < ApplicationRecord
  belongs_to :campaign

  has_many :votes

  validates_presence_of :name
end
