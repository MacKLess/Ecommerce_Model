FactoryBot.define do
  factory(:user) do
    name("Tester")
    email("test@test.com")
    password("Test123")
    password_confirmation("Test123")
  end

  factory(:product) do
    name("Fizzbobble")
    description("nob wozzle")
    price(15)
    quantity(10)
  end
end
