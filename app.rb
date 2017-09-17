require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/dictionary')
require('pry')

get('/') do
  if Dictionary.all.empty?
    Dictionary.add_or_update("word1","definition1")
    Dictionary.add_or_update("word2","definition1")
    Dictionary.add_or_update("word2","definition2")
  end

  @list = Dictionary.all()
  erb(:input)
end

post('/') do
  Dictionary.add_or_update(params["word"], params["definition"])
  @word = Dictionary.all
  erb(:input)
end

get('/words/:word?') do
  binding.pry
  @word = Dictionary.find(params[:word])
  # binding.pry
  erb(:output)
end

post('/words/:word') do
  @word = Dictionary.find(params[:word])
  @word.add_or_update({:definition=>params["definition"]})
  erb(:output)
end

post('/words/:word') do
  @word = Dictionary.find(params[:word])
  Dictionary.delete(@word.word)
  @list = Dictionary.sort
  redirect '/'
  erb(:output)
end
