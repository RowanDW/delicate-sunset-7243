class Passenger< ApplicationRecord
  has_many :manifest_entries
  has_many :flights, through: :manifest_entries

  def get_manifest_entry(flight)
    ManifestEntry.find_by(flight: flight, passenger: self)
  end
end
