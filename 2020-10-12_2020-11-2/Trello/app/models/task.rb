class Task < ApplicationRecord
  belongs_to :tasklist
  validates :title, presence: true
  validates :description, presence: true
end
