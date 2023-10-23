class CreateBrevoContactService
  def initialize(prospect)
    @prospect = prospect
  end

  def call
    set_api_brevo

    api_instance = SibApiV3Sdk::ContactsApi.new

    create_contact = SibApiV3Sdk::CreateContact.new(attributes_contact)

    begin
      api_instance.create_contact(create_contact)
    rescue SibApiV3Sdk::ApiError => e
      puts "Exception when calling ContactsApi->create_contact: #{e}"
    end
  end

  private

  def set_api_brevo
    SibApiV3Sdk.configure do |config|
      config.api_key['api-key'] = ENV.fetch('BREVO_API_KEY')
    end
  end

  def attributes_contact
    {
      listIds: [20],
      email: @prospect.email,
      emailBlacklisted: !@prospect.newsletter,
      attributes: {
        PRENOM: @prospect.first_name,
        NOM: @prospect.last_name,
        METIER: @prospect.position_id,
        ENTREPRISE: @prospect.company,
        NEWSLETTER: @prospect.newsletter
      }
    }
  end
end
