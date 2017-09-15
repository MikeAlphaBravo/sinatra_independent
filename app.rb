require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/contact')
require('pry')

get('/') do
  @list = Contact.all()
  erb(:input)
end

post('/') do
  first_name = params["first_name"]
  last_name = params["last_name"]
  job_title = params["job_title"]
  company = params["company"]
  type = params["type"]
  phone_number = params["phone_number"]
  street_address = params["street_address"]
  city = params["city"]
  state = params["state"]
  zip = params["zip"]

  contact = Contact.new(first_name, last_name, job_title, company, type, phone_number, street_address, city, state, zip)

  contact.save()
  @list = Contact.sort
  erb(:input)
end

get('/contacts/:id') do
  @contact = Contact.find(params[:id])
  erb(:output)
end

post('/contacts/:id') do
  @contact = Contact.find(params[:id])
  Contact.delete(@contact.id)
  @list = Contact.sort
  redirect '/'
  erb(:output)
end
