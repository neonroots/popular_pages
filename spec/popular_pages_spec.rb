require 'rspec'
require './lib/popular_pages'

describe 'it can get configured' do
  it 'works with dot env credentials' do
    a = PopularPages.most_populars(7, 1, ['videos'])
  end
end
