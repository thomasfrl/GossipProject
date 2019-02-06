FactoryBot.define do
    factory :gossip do
        title {Faker::Name.name}
        content {Faker::HarryPotter.quote}
        user {FactoryBot.create(:user)}
    end
end