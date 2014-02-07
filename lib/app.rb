require 'pathname'
class App < Sinatra::Base
  use Rack::Session::Cookie, key: 'rack.session',
                             path: '/',
                             secret: ENV['SESSION_SECRET']
  use OmniAuth::Builder do
    provider :google_apps, domain: 'newsdesk.se'
  end

  set :root, Pathname(__dir__).parent # You must set app root
  set :views, settings.root + 'app/views'
  enable :logging

  register Sinatra::AssetPack
  register Sinatra::Ember

  ember {
    templates '/js/compiled_templates.js', ['app/templates/**/*.hbs'], :relative_to => 'app/templates'
  }

  assets {
    serve '/js',     from: 'app/scripts'
    serve '/css',    from: 'app/styles'

    css :application, '/css/application.css', [
      '/css/vendor/pure.min.css',
      '/css/vendor/odometer-theme-minimal.css',
      '/css/vendor/bootstrap.min.css',
      '/css/style.css',
    ]

    js :templates, '/js/templates.js', [
      '/js/compiled_templates.js',
    ]

    js :application, '/js/application.js', [
      '/js/app.js',
      '/js/models/**/*.js',
      '/js/controllers/**/*.js',
      '/js/store/**/*.js',
      '/js/routes/**/*.js',
      '/js/views/**/*.js',
      '/js/router.js',
    ]

    js_compression  :uglify # :jsmin | :yui | :closure | :uglify
    css_compression :sass   # :simple | :sass | :yui | :sqwish
    prebuild true
  }

  %w(get post).each do |method|
    send(method, "/auth/:provider/callback") do
      session[:google_auth] = env['omniauth.auth']["info"]["email"]
      redirect to('/')
    end
  end

  get '/signout' do
    session[:google_auth] = nil
    redirect to('/')
  end

  get '/*' do
    if session[:google_auth].nil?
      erb :sign_in
    else
      erb :app
    end
  end
end
