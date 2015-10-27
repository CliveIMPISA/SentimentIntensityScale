require 'sinatra'
require 'json'
require_relative './model/opinion'
require 'csv'
require 'config_env'


class OpinionAPI < Sinatra::Base
  get '/' do
    # Populating DataBase with file
    if Opinion.all.empty?
      CSV.foreach("Sentiments_overall.csv", :headers => true) do |row|
        c = Opinion.new(opinion_id: row['ID'], opinion_tweet: row['Features'], opinion_strength: row['Make'], opinion_type: row['Model'])
        c.save
      end
    end
      @car = Opinion.all
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
    @makes = Opinion.where("year = ?", params[:year])
    @newmake = []
    @makes.each do |m|
      @newmake << m.make
    end
    @makes = @newmake.uniq
    @year = params[:year]
    haml :over1
  end

  get '/over2' do
    @skills = Opinion.where("make = ?", params[:make]).where("year = ?", params[:year])
    @makes = params[:make]
    @year = params[:year]
    # haml :over2
  end

  post '/over3' do
    @Opinion = Opinion.where("year = ?", params[:year]).where("model = ?", params[:model_s])
    @features = []
    feat = ""
    @car.each do |f|
      feat = f.features
    end
    @features = feat.split('* ')
    haml :over3
  end

  post '/over' do
    haml :over
  end

  get '/ratings' do
    haml :ratings
  end

  get '/rlist' do
    num = params[:range].split('-')
    @car = Opinion.where("model_sentiment < ? AND model_sentiment >= ?", num[0], num[1]).order('model_sentiment DESC')
    haml :rlist
  end

end
