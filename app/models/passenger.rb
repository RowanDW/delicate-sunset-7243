class Passenger< ApplicationRecord
  has_many :manifest_entries
  has_many :flights, through: :manifest_entries
end
