require('sinatra')
require('sinatra/reloader')
require('./lib/dictionary')
also_reload('lib/**/*.rb')

get('/') do
  @dictionary = Word.all
  erb(:index)
end

get('/word/new') do
  erb(:word_new)
end

get('/word/:id') do
  id = params.fetch('id').to_i
  @word = Word.find(id)
  erb(:word)
end

post('/word/saved') do
  word = params.fetch('word')
  new_word = Word.new(word: word)
  new_word.save
  erb(:save_word_success)
end
