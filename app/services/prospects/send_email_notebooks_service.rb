class SendEmailNotebooksService
  def initialize(prospect, infos = nil)
    @prospect = prospect
    @template = infos[:template].to_i
    @title = infos[:title]
  end

  def call
    set_api_brevo

    api_instance = SibApiV3Sdk::TransactionalEmailsApi.new

    send_smtp_email = SibApiV3Sdk::SendSmtpEmail.new(email_attributes)

    begin
      result = api_instance.send_transac_email(send_smtp_email)
      # p result
    rescue SibApiV3Sdk::ApiError => e
      puts "Exception when calling TransactionalEmailsApi->send_transac_email: #{e}"
    end
  end

  private

  def set_api_brevo
    SibApiV3Sdk.configure do |config|
      config.api_key['api-key'] = ENV.fetch('BREVO_API_KEY')
    end
  end

  def email_attributes
    {
      to: [{
        email: @prospect.email,
        name: @prospect.full_name
      }],
      templateId: @template,
      params: {
        EMAIL: @prospect.email
      },
      headers: {
        'X-Mailin-custom': 'custom_header_1:custom_value_1|custom_header_2:custom_value_2'
      }
    }
  end
end
