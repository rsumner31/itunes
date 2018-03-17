require 'simplecov'
SimpleCov.start do
  add_group 'ITunes', 'lib/itunes'
<<<<<<< HEAD
  add_group 'Faraday Middleware', 'lib/faraday'
=======
>>>>>>> daa5a0d... test limit
  add_group 'Specs', 'spec'
end

require File.expand_path('../../lib/itunes', __FILE__)

require 'rspec'
require 'vcr'

RSpec.configure do |c|
  c.extend VCR::RSpec::Macros
end

VCR.config do |c|
<<<<<<< HEAD
  c.cassette_library_dir = 'spec/fixtures'
  c.stub_with              :webmock
end
=======
  c.cassette_library_dir     = 'spec/fixtures'
  c.stub_with                :webmock
end
>>>>>>> daa5a0d... test limit
