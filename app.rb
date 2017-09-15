require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word')
require('pry')

get('/') do
  @list = Word.all()
  erb(:input)
end

post('/') do
  input_word = params["input_word"]
  input_definition = params["input_definition"]

  word = Word.new(input_word, input_definition)

  word.save()
  @list = Word.sort
  erb(:input)
end

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
