FactoryGirl.define do
  factory :offer do
    type "yes"
    association :shift, factory: :shift
  end
  factory :offer_no do
    type "no"
    association :shift, factory: :shift
  end
  factory :user do
    name "Roche"
    email "rochej@gmail.com"
    cell "+13232400224"
    password "password"
    association :team, factory: :team

    factory :user_with_offers do
      transient do
        offers_count 5
      end
      after(:create) do |user, evaluator|
        create_list(:offer, evaluator.offers_count, offerer: user)
      end
    end
    factory :user_with_shifts_given do
      transient do
        shifts_count 5
      end
      after(:create) do |user, evaluator|
        create_list(:shift, evaluator.shifts_count, giver: user)
      end
    end
  end
  factory :shift do
    datetime DateTime.now.to_s
    association :giver, factory: :user
  end
  factory :team do
    name "Giants"
    factory :team_with_users do
      transient do
        users_count 5
      end
      after(:create) do |team, evaluator|
        create_list(:user, evaluator.users_count, team: team)
      end
    end
  end
end