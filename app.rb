require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word')
require('./lib/define')
require('pry')

get('/') do
  if Dictionary.all.empty?
    Dictionary.add_or_update("word1","definition1")
    Dictionary.add_or_update("word2","definition2")
    Dictionary.add_or_update("word3","definition3")
  end

  @list = Dictionary.all()
  binding.pry
  
  erb(:input)
end

post('/') do
  Dictionary.add_or_update(params["word"], params["definition"])
  @word = Dictionary.all
  erb(:input)
end

get('/words/:word') do
  @word = Dictionary.find(params[:word])
  erb(:output)
end

post('/words/:word') do
  @word = Dictionary.find(params[:word])
  @word.additional_definitionextra({:define=>params["define"]})
  erb(:output)
end

post('/words/:word') do
  @word = Dictionary.find(params[:word])
  Dictionary.delete(@word.word)
  @list = Dictionary.sort
  redirect '/'
  erb(:output)
end
