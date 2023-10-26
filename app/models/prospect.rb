# require 'sib-api-v3-sdk'

class Prospect < ApplicationRecord
  enum position: {
    Artisan: 1,
    Entreprise: 2,
    Particulier: 3,
    Presse: 4,
    Architecte: 5,
    'Art Advisor': 6,
    Artiste: 7,
    Autre: 8,
    Collectionneur: 9,
    Curateur: 10,
    Décorateur: 11,
    Designer: 12,
    Distributeur: 13,
    Salon: 14,
    Fournisseur: 15,
    Galerie: 16
  }

  validates :first_name, :last_name, :email, :position, :company, presence: true
  before_create :clean_infos
  # after_create_commit :create_contact_brevo

  def full_name
    "#{first_name} #{last_name}"
  end

  def position_id
    self.class.positions[position] if position.present?
  end

  private

  def clean_infos
    self.first_name = first_name.strip.titleize
    self.last_name = clean_last_name
    self.email = email.strip.downcase
    self.company = company.strip
  end

  def clean_last_name
    exceptions = %w[des de du le la]

    last_name.strip.split.map do |word|
      if exceptions.include?(word.downcase)
        word.downcase
      elsif word.include?("'")
        word.split("'").map { |s| s.match?(/[ld]/i) ? s.downcase : s.capitalize }.join("'")
      else
        word.capitalize
      end
    end.join(' ')
  end

  def create_contact_brevo
    CreateBrevoContactService.new(self).call
  end
end
