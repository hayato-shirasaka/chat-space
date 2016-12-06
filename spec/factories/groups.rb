FactoryGirl.define do
  factory :group do
    name {Faker::Name.name}
    after(:create) do |group|
      group.users << create(:user)
    end
  end
end
