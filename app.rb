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
  definition = params.fetch('definition')
  new_word = Word.new(word: word)
  new_word.save
  unless definition == ''
    new_definition = Definition.new(definition: definition)
    new_definition.save_def
    new_word.add_definition(new_definition)
  end
  erb(:save_word_success)
end

post('/definition/saved') do
  definition = params.fetch('definition')
  new_definition = Definition.new(definition: definition)
  new_definition.save_def
  word_id = params.fetch('word_id').to_i
  @word = Word.find(word_id)
  @word.add_definition(new_definition)
  erb(:save_definition_success)
end
