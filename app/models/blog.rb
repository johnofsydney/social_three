# frozen_string_literal: true

# class definition for Blog Model
class Blog < ApplicationRecord
  validates :content, presence: true
  belongs_to :user
end
