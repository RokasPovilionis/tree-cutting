# frozen_string_literal: true

# Model for kvartalas
class Kvartalas < ApplicationRecord
  self.table_name = 'kvartalai'

  belongs_to :girininkija, foreign_key: %i[mu_kod gir_kod]
end
