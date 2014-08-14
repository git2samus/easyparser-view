require 'sinatra'
require 'json'
require 'easyparser'
require 'open-uri'

# closure-based factory bananas to accumulate parsed results
def result_proc_factory(parse_result)
  return Proc.new do |on|
    # determine which of the attributes marked on the template was matched on this particular call of &block
    matched_attrs = on.public_methods(false).select {|attrname| attrname != :method_missing and !attrname.to_s.end_with?('?') }
    # excise matched pair from scope tree
    matched_attrs.each do |attrname|
      parse_result << {
        :key => attrname,
        :val => on.send(attrname) {|scope| scope.last[attrname.to_s] }
      }
    end
  end
end


## Sinatra ##

# static index (managed by Angular)
get '/' do
  erb :index
end

# webservice to request parsing and retrieve scraped results
post '/parse' do
  content_type 'application/json'

  response = {}
  if params.has_key? 'target' and params.has_key? 'template'
    # ...create an array to pass to the factory
    parse_result = []
    # ...in order to get a Proc to pass to the parser
    result_proc = result_proc_factory(parse_result)
    # ...which is able to accumulate the parsed results on the first var
    generic_parser = EasyParser.new(params['template'], &result_proc)
    # ...and then parse the target URL
    generic_parser.run open(params['target'])

    response[:status] = "ok"
    response[:result] = parse_result
  else
    status 400 # Bad Request

    response[:status]  = "error"
    response[:message] = "Required parameters: target, template"
  end

  response.to_json
end
