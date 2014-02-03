require 'pathname'
class App < Sinatra::Base
  set :root, Pathname(__dir__).parent # You must set app root
  set :views, settings.root + 'app/views'

  register Sinatra::AssetPack
  register Sinatra::Ember

  ember {
    templates '/js/templates.js', ['app/templates/**/*.hbs'], :relative_to => 'app/templates'
  }
  assets {
    serve '/js',     from: 'app/scripts'         # Default
    serve '/css',    from: 'app/styles'          # Default
    serve '/images', from: 'app/images'          # Default
    serve '/bower', from: 'app/bower_components' # Default

    js :application, '/js/application.js', [
      '/js/app.js',
      '/js/models/**/*.js',
      '/js/controllers/**/*.js',
      '/js/store/**/*.js',
      '/js/routes/**/*.js',
      '/js/views/**/*.js',
      '/js/router.js',
    ]

    js_compression  :jsmin    # :jsmin | :yui | :closure | :uglify
    css_compression :sass   # :simple | :sass | :yui | :sqwish
  }



  get '/' do
    erb :layout
  end
end
