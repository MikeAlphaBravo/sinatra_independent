require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/dictionary')
require('pry')

get('/') do
  if Dictionary.all.empty?
    Dictionary.add_or_update("apple","The round fruit of a tree of the rose family, which typically has thin red or green skin and crisp flesh.  Many varieties have been developed as dessert or cooking fruit or for making cider.")
    Dictionary.add_or_update("banana","A long curved fruit that grows in clusters and has soft pulpy flesh and yellow skin when ripe.")
    Dictionary.add_or_update("zebra","An African wild horse with black and white stripes and an erect mane.")
  end

  @list = Dictionary.all().sort
  erb(:input)
end

post('/') do
  Dictionary.add_or_update(params["word"], params["definition"])
  redirect '/'
end

get('/words/:word') do
  @word = Dictionary.find(params[:word])
  erb(:output)
end

post('/words/:word') do
  Dictionary.add_or_update(params[:word], params[:definition])
  redirect "/words/#{params[:word]}"
end

# post('/words/:word') do
#   @word = Dictionary.find(params[:word])
#   Dictionary.delete(word)
#   redirect '/'
# end
