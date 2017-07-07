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

post('word/saved') do
  word = params.fetch('word')
  new_word = Word.new('word')
  new_word.save
  erb(:save_word_success)
end
