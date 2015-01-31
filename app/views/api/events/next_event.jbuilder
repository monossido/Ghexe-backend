json.event do
  json.id    @event.id
  json.title @event.title
  json.dayofweek @event.dayofweek
  json.time @event.time
  @presences = @event.presences
  json.presences @presences do |presence|
    json.id presence.id
    json.presence presence.presence
    presence.user.password  = ""
    json.user presence.user
    json.created_at presence.created_at
    json.updated_at presence.updated_at
  end
end
