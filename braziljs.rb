require 'bundler/setup'
require 'active_record'
require 'models/keynote'
require 'models/checkin'

require 'sinatra'
configure do
  require 'database'
end

get '/(index)' do
  erb :index
end

get '/keynotes' do
  Keynote.all.to_json
end

post '/keynotes' do
  @keynote = Keynote.new params[:keynote]
  if @keynote.save
    @keynote.to_json
  else
    @keynote.errors.to_json
  end
end

post '/checkin' do
  @checkin = Checkin.new params[:checkin]
  if @checkin.save
    @checkin.to_json
  else
    @checkin.errors.to_json
  end
end
