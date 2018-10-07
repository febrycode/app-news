json.error error
json.news news do |new|
  json.id new.id
  json.status new.status
  json.topics new.topics do |topic|
    json.id topic.id
  end
end