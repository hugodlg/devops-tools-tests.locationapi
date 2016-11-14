require 'json'
require 'sinatra'

set :bind, '0.0.0.0'
set :port, 80

get '/collaborator/:collaboratorid' do
  content_type :json
  halt 400, { :message => 'the collaborator id needs to be a number' }.to_json unless params['collaboratorid'] =~ /^-?\d+$/ 

  collaborators_location = [nil, 'SP', 'RJ', 'SC', 'BA', 'AM']

  collaboratorid = params['collaboratorid'].to_i
  collaborator_location = collaborators_location[collaboratorid]

  halt 404, '' unless collaboratorid > 0 && collaborator_location != nil

  { :name => collaborator_location }.to_json
end
