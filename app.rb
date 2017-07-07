require('sinatra')
require('sinatra/reloader')
require('./lib/dictionary')
also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end

get('/word/new') do
  erb(:word_new)
end
