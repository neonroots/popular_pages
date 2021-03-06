module PopularPages
  class Configuration
    attr_accessor :private_key_id, :private_key, :client_email, :client_id

    def initialize(private_key_id = ENV['GOOGLE_PRIVATE_KEY_ID'],
                   private_key = ENV['GOOGLE_PRIVATE_KEY'],
                   client_email = ENV['GOOGLE_CLIENT_EMAIL'],
                   client_id = ENV['GOOGLE_CLIENT_ID'])
      @private_key_id = private_key_id
      @private_key = private_key
      @client_email = client_email
      @client_id = client_id
    end
  end
end
