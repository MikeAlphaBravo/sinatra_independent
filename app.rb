require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word')
require('./lib/define')
require('pry')

get('/') do
  @list = Word.all()
  erb(:input)
end

post('/') do
  extra = Word.new({:word=>params["word"]})
  extra.save()
  @word = Word.all()
  erb(:input)
end

get('/words/:id') do
  @word = Word.find(params[:id])
  erb(:output)
end

post('/words/:id') do
  @word = Word.find(params[:word])
  @word.additional_definitionextra({:define=>params["define"]})
  erb(:output)
end

post('/words/:id') do
  @word = Word.find(params[:id])
  Word.delete(@word.id)
  @list = Word.sort
  redirect '/'
  erb(:output)
end
