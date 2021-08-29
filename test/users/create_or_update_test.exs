defmodule Exlivery.Users.CreateOrUpdateTest do
  use ExUnit.Case

  alias Exlivery.Users.CreateOrUpdate

  alias Exlivery.Users.Agent, as: UserAgent

  describe "call/1" do
    setup do
      UserAgent.start_link(%{})

      :ok
    end

    test "when all params are valid, saves the user" do
      params = %{
        name: "Rafael",
        address: "Rua das bananeiras 15",
        email: "rafael@banana.com",
        cpf: "cpf",
        age: 19
      }

      response = CreateOrUpdate.call(params)

      expected_response = {:ok, "User created or updated successfully"}

      assert response == expected_response
    end

    test "when there are invalid params, returns an error" do
      params = %{
        name: "Rafael",
        address: "Rua das bananeiras 15",
        email: "rafael@banana.com",
        cpf: "cpf",
        age: 12
      }

      response = CreateOrUpdate.call(params)

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
