class Flight < ApplicationRecord
  belongs_to :airline
  has_many :manifest_entries
  has_many :passengers, through: :manifest_entries
end
