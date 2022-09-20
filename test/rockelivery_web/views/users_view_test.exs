defmodule RockeliveryWeb.UsersViewTest do
  use RockeliveryWeb.ConnCase, async: true

  import Phoenix.View
  import Rockelivery.Factory

  alias RockeliveryWeb.UsersView

  test "renders create.json" do
    user = build(:user)
    token = "xpto1234"

    response = render(UsersView, "create.json", token: token, user: user)

    assert %{
             message: "User created!",
             token: "xpto1234",
             user: %Rockelivery.User{
               address: "Visconde de Barbacena, 67",
               age: 57,
               cep: "10203040",
               cpf: "55667788899",
               email: "dominga@gmail.com",
               id: "05c0f5f6-2480-11ed-861d-0242ac120002",
               inserted_at: nil,
               name: "Dominga",
               password: "123456",
               password_hash: nil,
               updated_at: nil
             }
           } = response
  end
end
