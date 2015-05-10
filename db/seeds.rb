["Sherry", "Boris", "Vicente", "Matte", "Jack", "Sherry",
 "Matte", "Kevin", "Kevin", "Vicente", "Zoe", "Kevin", "Matte", "Zoe", "Jay", "Boris", "Eadon", "Sherry",
 "Franky", "Sherry", "Matte", "Franky", "Franky", "Kevin",
 "Boris", "Franky", "Vicente", "Luis", "Eadon", "Boris",
 "Kevin", "Matte", "Jay", "James", "Kevin", "Sherry",
 "Sherry", "Jack", "Sherry", "Jack"].each_with_index do | name, index |
    user = User.where(name: name).first_or_create!
    SupportAssignment.create! date: (Date.today+index), user_id: user.id

end

