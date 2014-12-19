<<<<<<< HEAD
json.presences @presences do |presence|
=======
json.users @presences do |presence|
>>>>>>> 7cc049fc30505611072b7afce4fce3e7abb85011
  json.id    presence.id
  json.user presence.user
  json.event presence.event
  json.presence presence.presence
end
