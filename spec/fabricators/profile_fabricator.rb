Fabricator(:profile) do
  name { "#{Faker::Name.first_name} #{Faker::Name.last_name}" }
  handle { Faker::Internet.user_name }
  bio "My awesome bio, yay"
  location "Sweden, Norrköping"

  user_id 1
end
