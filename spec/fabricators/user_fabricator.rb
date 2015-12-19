Fabricator(:user) do
  handle { Faker::Internet.user_name.gsub('.', '-') }
  email { Faker::Internet.email }
  password { Faker::Internet.password }

  after_create { |user| Fabricate(:profile, handle: user.handle_lower, user_id: user.id) }
end
