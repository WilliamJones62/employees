json.array! @employees do |e|
  json.lastname e.Lastname
  json.firstname e.Firstname
  json.image e.image
  json.cc e.Cost_Center_Code
  json.dept e.Department
end
