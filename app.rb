require 'sinatra'
require 'json'
require_relative './model/car'
require 'csv'
require 'config_env'


class CarReviewAPI < Sinatra::Base
  get '/' do
    if Car.all.empty?
      CSV.foreach("Sentiments_overall.csv", :headers => true) do |row|
        c = Car.new(car_id: row['ID'], year: row['Year'], make: row['Make'], model: row['Model'], model_sentiment: row['Model Sentiment'], make_sentiment: row['Make Sentiment'], model_positive: row['Model Positive Sentiments'], model_negative: row['Model Negative Sentiments'])
        c.save
      end
    end
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

  get '/over' do
    haml :over
  end

  get '/over1' do
    @makes = Car.where("year = ?", params[:year])
    @year = params[:year]
    haml :over1
  end

  get '/over2' do
    @skills = Car.where("make = ?", params[:make])
    @makes = params[:make]
    @year = params[:year]
    haml :over2
  end

end
