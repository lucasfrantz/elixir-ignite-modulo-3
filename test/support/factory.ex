defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Users.User
  alias Exlivery.Orders.{Item, Order}

  def user_factory do
    %User{
      name: "Lucas",
      email: "lucas@banana.com",
      cpf: "12345678900",
      age: 27,
      address: "Rua das bananeiras 35"
    }
  end

  def item_factory do
    %Item{
      category: :pizza,
      description: "Pizza de Peperoni",
      quantity: 1,
      unity_price: Decimal.new("35.5")
    }
  end

  def order_factory do
    %Order{
      delivery_address: "Rua das bananeiras 35",
      items: [
        build(:item),
        build(:item,
          description: "Temaki de Salmao",
          category: :japonesa,
          quantity: 2,
          unity_price: Decimal.new("20.50")
        )
      ],
      total_price: Decimal.new("76.50"),
      user_cpf: "12345678900"
    }
  end
end
