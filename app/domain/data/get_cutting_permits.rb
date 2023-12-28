# frozen_string_literal: true

# Class used to get permits from the govermental api
class Data::GetCuttingPermits
  include Interactor::Initializer

  URL = 'https://get.data.gov.lt/datasets/gov/miskai/leidimai/Leidimas/:format/csv'

  KEY_CHANGES = {
    'mu._id' => 'mu_id',
    'ur_gir._id' => 'ur_gir_id',
    'strukp._id' => 'strukp_id'
  }.freeze

  def run
    batch_size = 1000
    batches = []
    URI.open(URL) do |file|
      CSV.new(file, headers: true).each do |row|
        hash = row.to_hash
        hash = hash.transform_keys { |key| KEY_CHANGES[key] || key }

        batches << CuttingPermit.new(hash)

        if batches.size >= batch_size
          CuttingPermit.import(batches)
          batches = []
        end
      end
      CuttingPermit.import batches unless batches.empty?
    end
  end
end
