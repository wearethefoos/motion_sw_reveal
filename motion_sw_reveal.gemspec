# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'motion_sw_reveal/version'

Gem::Specification.new do |spec|
  spec.name          = "motion_sw_reveal"
  spec.version       = MotionSwReveal::VERSION
  spec.authors       = ["Wouter de Vos"]
  spec.email         = ["wouter@springest.com"]
  spec.description   = %q{Provides a subclass for presenting side view controllers inspired on the FaceBook and Wunderlist apps, done right!}
  spec.summary       = %q{A UIViewController subclass for revealing a rear (left and/or right) view controller behind a front controller, inspired by the Facebook app, done right!}
  spec.homepage      = "https://github.com/foxycoder/motion_sw_reveal"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "motion-cocoapods"
  spec.add_dependency "ProMotion"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "motion-stump"
end
