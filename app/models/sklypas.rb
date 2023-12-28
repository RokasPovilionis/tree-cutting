# frozen_string_literal: true

# Model for sklypas
class Sklypas < ApplicationRecord
  self.table_name = 'sklypai'

  validates :mu_kod, presence: true
  validates :gir_kod, presence: true
  validates :kv_nr, presence: true
  validates :skl_nr, presence: true
end
