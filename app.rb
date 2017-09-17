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
  redirect '/'
end

get('/words/:word') do
  @word = Dictionary.find(params[:word])
  # binding.pry
  erb(:output)
end

post('/words/:word') do
  Dictionary.add_or_update(params[:word], params[:definition])
  redirect "/words/#{params[:word]}"
end

post('/words/:word') do
  @word = Dictionary.find(params[:word])
  Dictionary.delete(@word.word)
  @list = Dictionary.sort
  redirect '/'
end
