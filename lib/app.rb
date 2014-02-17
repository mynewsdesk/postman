require 'pathname'
class App < Sinatra::Base

  configure do
    use Rack::Session::Cookie, key: 'rack.session',
                               path: '/',
                               secret: ENV['SESSION_SECRET']
    use OmniAuth::Builder do
      provider :google_apps, domain: 'newsdesk.se'
    end
    set :root, Pathname(__dir__).parent
    set :views, settings.root + 'views'
    enable :logging

    register Sinatra::AssetPipeline
    set :assets_precompile, %w(application.js application.css libs.js templates.js)
    sprockets.append_path HandlebarsAssets.path
    HandlebarsAssets::Config.ember = true
  end


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
