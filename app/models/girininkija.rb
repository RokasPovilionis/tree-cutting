# frozen_string_literal: true

# Model for Girininkijos
class Girininkija < ApplicationRecord
  self.table_name = 'girininkijos'
  self.primary_key = :mu_kod, :gir_kod

  has_many :kvartalai, foreign_key: %i[mu_kod gir_kod], class_name: 'Kvartalas'

  belongs_to :uredija, foreign_key: 'mu_kod'
end
