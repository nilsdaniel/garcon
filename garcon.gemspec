Gem::Specification.new do |s|
  s.name        = 'garcon'
  s.version     = '0.0.1'
  s.date        = '2012-08-14'
  s.summary     = "Garcon!"
  s.description = "A simple wrapper for the garmin connect api"
  s.authors     = ["Daniel Meisen"]
  s.email       = 'daniel.meisen@stats.io'
  s.require_paths = %w[lib]
  s.files = %w[
    garcon.gemspec
    lib/garcon.rb
    lib/garcon/garmin_activity.rb
  ]

  s.homepage    =
    'http://github.com/nilsdaniel/garcon'
end