Fabricator(:post) do
  body { Faker::Lorem.sentences }

  profile
end
