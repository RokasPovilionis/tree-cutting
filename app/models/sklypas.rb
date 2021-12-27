# frozen_string_literal: true

# Model for sklypas
class Sklypas < ApplicationRecord
  self.table_name = 'sklypai'
  self.primary_key = :mu_kod, :gir_kod, :kv_nr, :skl_nr

  validates :mu_kod, presence: true
  validates :gir_kod, presence: true
  validates :kv_nr, presence: true
  validates :skl_nr, presence: true

  belongs_to :kvartalas, foreign_key: %i[mu_kod gir_kod kv_nr]
end
