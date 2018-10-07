json.error error
json.news news do |new|
  json.id new.id
  json.name new.name
  json.status new.status
  json.topics new.topics do |topic|
    json.id topic.id
    json.name topic.name
  end
end