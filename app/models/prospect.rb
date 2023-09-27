# require 'sib-api-v3-sdk'

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
  before_create :clean_infos
  after_create_commit :create_contact_brevo

  def full_name
    "#{first_name} #{last_name}"
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
