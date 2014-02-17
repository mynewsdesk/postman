require 'rubygems'
require 'bundler'
Bundler.require
Dotenv.load

$: << 'lib'
require 'app'
require 'sinatra/asset_pipeline/task'

Sinatra::AssetPipeline::Task.define! App
