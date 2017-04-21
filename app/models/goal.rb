class Goal < ApplicationRecord
  validates :title, :user_id, :visibility, :finished, presence: true
  validates :visibility, inclusion: {in: ["Public", "Private"]}
  validates :finished, inclusion: {in: ["Ongoing", "Completed"]}

  belongs_to :user,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :User

  
end
