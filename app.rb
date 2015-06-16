require 'sinatra'
require 'json'


class CarReviewAPI < Sinatra::Base
  get '/' do
    haml :index
  end

end
