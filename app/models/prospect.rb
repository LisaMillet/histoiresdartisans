require 'csv'

class Prospect < ApplicationRecord
  POSITIONS = [
    'Particulier',
    'Presse',
    'Architecte',
    'Artiste',
    'Autre',
    'Décorateur',
    'Designer',
    'Distributeur',
    'Salon',
    'Fournisseur',
    'Galerie'
  ]

  validates :first_name, :last_name, :email, :position, :company, presence: true
  validates :position, inclusion: { in: POSITIONS }
end
