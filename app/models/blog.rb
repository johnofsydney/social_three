class Blog < ApplicationRecord
  validates :content, presence: true
  belongs_to :user
end
