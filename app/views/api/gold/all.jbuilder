json.result 0
json.golds @golds do |gold|
  json.id gold.id
  json.date gold.date + " " + gold.time
  json.price gold.price
end