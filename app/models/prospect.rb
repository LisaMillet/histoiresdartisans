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
  after_create :clean_infos
  after_create_commit :store_in_csv

  private

  def clean_infos
    update(
      first_name: first_name.strip.titleize,
      last_name: last_name_clean,
      email: email.strip.downcase,
      company: company.strip
    )
  end

  def last_name_clean
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

  def store_in_csv
    filepath = "public/csv/prospects.csv"

    CSV.open(filepath, "wb") do |csv|
      csv << %w[Prénom Nom email Fonction Entreprise]
      csv << [first_name, last_name, email, position, company]
    end
  end
end
