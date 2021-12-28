# frozen_string_literal: true

# Model for kvartalas
class Kvartalas < ApplicationRecord
  self.table_name = 'kvartalai'
  self.primary_key = :mu_kod, :gir_kod, :kv_nr

  has_many :sklypai, foreign_key: %i[mu_kod gir_kod kv_nr], class_name: 'Sklypas'

  belongs_to :girininkija, foreign_key: %i[mu_kod gir_kod]
end
