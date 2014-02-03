require 'rubygems'
require 'bundler'
Bundler.require
Dotenv.load


$: << 'lib'

require 'app'

run App
