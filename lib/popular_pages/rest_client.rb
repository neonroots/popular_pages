require 'net/http'
require 'googleauth'
require 'json'

module PopularPages
  class RestClient
    def initialize
      config = PopularPages::Configuration.new
      ENV['GOOGLE_PRIVATE_KEY'] = config.private_key
      ENV['GOOGLE_CLIENT_EMAIL'] = config.client_email
      ENV['GOOGLE_CLIENT_ID'] = config.client_id
    end

    def all(from = 7, to = 1)
      url="#{ENV['GOOGLE_API_URL']}?ids=ga%3A#{ENV['GOOGLE_APPLICATION_ID']}&"\
      "start-date=#{from}daysAgo&end-date=#{to}daysAgo&metrics=ga%3AuniquePageviews&"\
      "dimensions=ga%3ApagePath&sort=-ga%3AuniquePageviews&max-results=200&"\
      "access_token=#{access_token}"

      uri = URI(url)
      res = Net::HTTP.get_response(uri)
      parse_response(res.body)
    end

    private

    def access_token
      authorization =
        Google::Auth.get_application_default([ENV['GOOGLE_AUTH_PATTERN']])
      return unless authorization
      authorization.apply!({})
      authorization.access_token
    end

    def parse_response(body)
      response = []
      JSON.parse(body)['rows'].each do |row|
        response << { path: row[0], views: row[1] }
      end
      response
    end
  end
end
