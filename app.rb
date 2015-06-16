require 'sinatra'
require 'json'


class CarReviewAPI < Sinatra::Base
  get '/' do
    haml :index
  end

  get '/about' do
    haml :about
  end

  get '/help' do
    haml :help
  end

  get '/contact' do
    haml :contact
  end

end
