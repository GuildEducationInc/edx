
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'edx/version'

Gem::Specification.new do |spec|
  spec.name          = 'edx'
  spec.version       = Edx::VERSION
  spec.authors       = ['Guild Engineering']
  spec.email         = ['engineering@guildeducation.com']

  spec.summary       = 'A ruby client for the edX API'
  spec.description   = 'A ruby client and models for the edX catalog and course API'
  spec.homepage      = 'https://github.com/GuildEducationInc/edx'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'faraday', '~> 0.12'
  spec.add_dependency 'faraday_middleware', '~> 0.12.2'
  spec.add_dependency 'resource_kit', '~> 0.1.7'
  spec.add_dependency 'virtus', '~> 1.0.5'

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
