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
  after_create_commit :store_in_prospects_csv

  private

  def clean_infos
    update(
      first_name: first_name.strip.titleize,
      last_name: clean_last_name,
      email: email.strip.downcase,
      company: company.strip
    )
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

  def newsletter_inscription?
    newsletter ? 'Inscrit' : 'Non Inscrit'
  end

  def store_in_prospects_csv
    filepath = 'storage/csv/prospects.csv'

    CSV.open(filepath, 'a') { |csv| csv << [id, first_name, last_name, email, position, company, newsletter_inscription?] }
  end
end
