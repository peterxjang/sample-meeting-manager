json.array! @meetings.each do |meeting|
  json.id meeting.id
  json.name meeting.name
  json.address meeting.address
  json.startTime meeting.start_time
  json.endTime meeting.end_time
  json.notes meeting.notes
  json.tags meeting.tags.each do |tag|
    json.id tag.id
    json.name tag.name
  end
end