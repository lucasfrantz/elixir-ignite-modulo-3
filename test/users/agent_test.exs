defmodule Exlivery.Users.AgentTest do
  use ExUnit.Case

  import Exlivery.Factory

  alias Exlivery.Users.Agent, as: UserAgent
  alias Exlivery.Users.User

  describe "save/1" do
    setup do
      UserAgent.start_link(%{})

      :ok
    end

    test "saves the user" do
      user = build(:user)

      assert UserAgent.save(user) == :ok
    end
  end

  describe "get/1" do
    setup do
      UserAgent.start_link(%{})

      cpf = "12345678900"

      {:ok, cpf: cpf}
    end

    test "when the user is found, returns the user", %{cpf: cpf} do
      :user
      |> build(cpf: cpf)
      |> UserAgent.save()

      response = UserAgent.get(cpf)

      expected_response =
        {:ok,
         %User{
           address: "Rua das bananeiras 35",
           age: 27,
           cpf: "12345678900",
           email: "lucas@banana.com",
           name: "Lucas"
         }}

      assert response == expected_response
    end

    test "when the user is not found, returns an error", %{cpf: cpf} do
      response = UserAgent.get(cpf)

      expected_response = {:error, "User not found"}

      assert response == expected_response
    end
  end
end
