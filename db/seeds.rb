User.create!(name: 'John Doe',
             email: 'john@example.com',
             password: 'password',
             password_confirmation: 'password')
User.create!(name: 'Jill Smith',
             email: 'jill@example.com',
             password: 'password',
             password_confirmation: 'password')
  
john = User.find_by(email: 'john@example.com')
jill = User.find_by(email: 'jill@example.com')

List.create!(name: "John's list",
             description: 'This is the first list',
             user_id: john.id)
List.create!(name: "John's list",
             description: 'This is the second list',
             user_id: john.id)

List.create!(name: "Jill's list",
             description: 'This is the first list',
             user_id: jill.id)
List.create!(name: "Jill's list",
             description: 'This is the second list',
             user_id: jill.id)