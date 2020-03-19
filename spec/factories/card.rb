FactoryBot.define do
  factory :card do
    question { 'Test question?' }
    answer { 'Test answer!' }
    topic
  end
end
