require 'rspec'
require './lib/popular_pages'
require 'dotenv'

describe 'it can get configured' do
  it 'works with dot env credentials' do
    Dotenv.load
    a = PopularPages.most_populars(7, 1, ['videos'])
  end
end
