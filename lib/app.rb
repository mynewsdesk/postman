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

  register Sinatra::AssetPack
  register Sinatra::Ember

  ember {
    templates '/js/templates.js', ['app/templates/**/*.hbs'], :relative_to => 'app/templates'
  }
  assets {
    serve '/js',     from: 'app/scripts'         # Default
    serve '/css',    from: 'app/styles'          # Default
    serve '/images', from: 'app/images'          # Default

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

  %w(get post).each do |method|
    send(method, "/auth/:provider/callback") do
      session[:google_auth] = env['omniauth.auth']["info"]["email"]
      redirect to('/')
    end
  end

  get '/' do
    if session[:google_auth].nil?
      erb :sign_in
    else
      erb :app
    end
  end

  get '/signout' do
    session[:google_auth] = nil
    redirect to('/')
  end

end
