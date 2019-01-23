require 'sinatra/base'

class App < Sinatra::Base
  configure do
    set :server, :puma
    set :bind, '0.0.0.0'
    set :port, 9100
  end

  get '/metrics' do
    `bash smartmon.sh`
  end

  run! if app_file == $PROGRAM_NAME
end

