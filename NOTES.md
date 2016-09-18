Users table
  name:string, password_digest:string, nausea:integer, happiness:integer, tickets:integer, height:integer, role:integer


Attractions table
  name:string, tickets:integer, nausea_rating:integer, happiness_rating:integer, min_height:integer

Rides table
  user_id:integer, attraction_id:integer
