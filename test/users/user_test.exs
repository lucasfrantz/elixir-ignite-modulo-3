defmodule Exlivery.Users.UserTest do
  use ExUnit.Case

  import Exlivery.Factory

  alias Exlivery.Users.User

  describe "build/5" do
    test "when all params are valid, returns an user struct" do
      response =
        User.build(
          "Rua das bananeiras 35",
          "Lucas",
          "lucas@banana.com",
          "12345678900",
          27
        )

      expected_response = {:ok, build(:user)}

      assert response == expected_response
    end

    test "when the age is less than 18, returns an error" do
      response =
        User.build(
          "rua total",
          "lucas f",
          "lucas@banana.com",
          "12345678909",
          17
        )

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end

    test "when the cpf is not a string, returns an error" do
      response =
        User.build(
          "rua total",
          "lucas t",
          "lucas@banana.com",
          1_234_566_789,
          19
        )

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
