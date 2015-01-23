require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/stylist")
require("./lib/client")
require("pg")

DB = PG.connect({:dbname => "hair_salon"})

get('/') do
  @stylists = Stylist.all()
  erb(:index)
end

post('/stylist') do
  name = params.fetch("name")
  stylist_entry = Stylist.new({:name => name, :id => nil})
  stylist_entry.save()
  @stylists = Stylist.all()
  erb(:index)
end

get('/stylist/:id') do
  @found_stylist = Stylist.find(params.fetch("id").to_i())
  erb(:stylist)
end

post("/clients") do
  name = params.fetch("name")
  stylist_id = params.fetch("stylist_id").to_i()
  client = Client.new({:name => name, :stylist_id => stylist_id})
  client.save()
  @found_stylist = Stylist.find(stylist_id)
  erb(:stylist)
end
