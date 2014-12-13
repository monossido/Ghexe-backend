json.events @events do |event|
  json.id    event.id
  json.title event.title
  json.dayofweek event.dayofweek
  json.time event.time
end
