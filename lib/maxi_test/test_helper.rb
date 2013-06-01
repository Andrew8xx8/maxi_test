require 'bundler/setup'
Bundler.require

at_exit do
  MaxiTest.run
end
