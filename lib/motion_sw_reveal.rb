require 'motion-cocoapods'
require 'bubble-wrap'
require 'ProMotion'

unless defined?(Motion::Project::Config)
  raise "This file must be required within a RubyMotion project Rakefile."
end

Motion::Project::App.setup do |app|
  Dir.glob(File.join(File.dirname(__FILE__), 'motion_sw_reveal/**/*.rb')).each do |file|
    app.files << file 
  end

  app.pods do
    pod 'SWRevealViewController'
  end

end