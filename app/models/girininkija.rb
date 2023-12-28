# frozen_string_literal: true

# Model for Girininkijos
class Girininkija < ApplicationRecord
  self.table_name = 'girininkijos'

  has_many :sklypai, through: :kvartalai

  belongs_to :uredija, foreign_key: 'mu_kod'
end
