require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word')
require('pry')

get('/') do
  @base_list = Word.all()
  @word_add_list = Word.all()
  erb(:input)
end

post('/') do
  word = params["word"]
  definition = params["definition"]

  word = Word.new(word, definition)

get('/words/:id') do
  @word = Word.find(params[:id])
  erb(:output)
end

post('/words/:id') do
  @word = Word.find(params[:id])
  Word.delete(@word.id)
  @list = Word.sort
  redirect '/'
  erb(:output)
end
