5.times do |i|
  user = User.create!(username: "foo_#{i}", password: "123456")
  user.wines.create!(name: "Merlot ##{i}", description: "Made with #{i} grapes")
end