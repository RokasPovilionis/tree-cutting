# frozen_string_literal: true

# Model for Uredijos
class Uredija < ApplicationRecord
  self.table_name = 'uredijos'

  has_many :girininkijos, foreign_key: 'mu_kod', class_name: 'Girininkija'
  has_many :kvartalai, through: :girininkijos
  has_many :sklypai, through: :kvartalai
end
