require 'sinatra'
require 'json'

get '/' do
  erb :index
end

post '/parse' do
  content_type 'application/json'

  response = {}
  if params.has_key? 'target' and params.has_key? 'template'
    response[:status] = "ok"
    response[:result] = {:foo => 'lala'}
  else
    status 400
    response[:status]  = "error"
    response[:message] = "Required parameters: target, template"
  end

  response.to_json
end
