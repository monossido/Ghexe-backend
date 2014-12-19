json.presences @presences do |presence|
  json.id    presence.id
  json.user presence.user
  json.event presence.event
  json.presence presence.presence
end
