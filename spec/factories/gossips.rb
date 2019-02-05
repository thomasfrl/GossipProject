FactoryBot.define do
    factory :gossip do
        title {Faker::HarryPotter.book}
        content {Faker::HarryPotter.quote}
        user {FactoryBot.create(:user)}
    end
end  