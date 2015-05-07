# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

["Sherry", "Boris", "Vicente", "Matte", "Jack", "Sherry",
 "Matte", "Kevin", "Kevin", "Vicente", "Zoe", "Kevin", "Matte", "Zoe", "Jay", "Boris", "Eadon", "Sherry",
 "Franky", "Sherry", "Matte", "Franky", "Franky", "Kevin",
 "Boris", "Franky", "Vicente", "Luis", "Eadon", "Boris",
 "Kevin", "Matte", "Jay", "James", "Kevin", "Sherry",
 "Sherry", "Jack", "Sherry", "Jack"].each do | name |

  user = User.first_or_create! name: name
  SupportAssignment.create! date: Date.today, user_id: user.id
end

