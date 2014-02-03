require 'pathname'
class App < Sinatra::Base
  set :root, Pathname(__dir__).parent # You must set app root
  set :views, settings.root + 'app/views'

  register Sinatra::AssetPack

  assets {
    serve '/js',     from: 'app/scripts'        # Default
    serve '/css',    from: 'app/styles'       # Default
    serve '/images', from: 'app/images'    # Default

    js :application, '/js/application.js', [
      '/js/models/**/*.js',
      '/js/controllers/**/*.js',
      '/js/store/**/*.js',
      '/js/routes/**/*.js',
      '/js/views/**/*.js',
      '/js/router.js'
    ]

    css :application, '/css/application.css', [
      '/css/screen.css'
    ]

    js_compression  :jsmin    # :jsmin | :yui | :closure | :uglify
    css_compression :sass   # :simple | :sass | :yui | :sqwish
  }



  get '/' do
    erb :layout
  end
end
