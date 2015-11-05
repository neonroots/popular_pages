require 'popular_pages/configuration'
require 'popular_pages/rest_client'

module PopularPages
  @rest_client = PopularPages::RestClient.new

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  def self.most_populars(from = 7, to = 1, paths = [])
    all = @rest_client.all(from, to)
    return all if paths.empty?
    populars = []
    paths.each do |path|
      populars += all.select { |page| page[:path].match(/\A\/#{path}/) }
    end
    populars
  end
end
