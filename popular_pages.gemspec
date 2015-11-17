Gem::Specification.new do |s|
  s.name        = 'popular_pages'
  s.version     = '1.0.3'
  s.date        = '2015-11-17'
  s.summary     = 'Gem to extract Google analytics metrics for popular pages'
  s.description = 'Gem to extract Google analytics metrics for popular pages'
  s.authors     = ['Pablo Gonzaga', 'Oscar Siniscalchi']
  s.email       = 'pgonzaga.uy@gmail.com'
  s.files       = Dir.glob("{bin,lib}/**/*")
  s.homepage    = 'https://github.com/neonroots/popular_pages'
  s.license       = 'MIT'

  s.add_development_dependency 'rspec', '~> 3.3'
  s.add_development_dependency 'byebug', '~> 8.0'
  s.add_development_dependency 'dotenv', '>= 2.0.2'

  s.add_dependency 'bundler', '>= 1.10.6'
  s.add_dependency 'rake', '>= 10.4.2'
  s.add_dependency 'googleauth', '~> 0.4.2'
  s.add_dependency 'json', '>= 1.8.3'
end
