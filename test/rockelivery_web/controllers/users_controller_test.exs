defmodule RockeliveryWeb.UsersControllerTest do
  use RockeliveryWeb.ConnCase, async: true

  import Rockelivery.Factory

  alias RockeliveryWeb.Auth.Guardian

  describe "create/2" do
    test "When all params are valid, creates the user", %{conn: conn} do
      params = %{
        "age" => 57,
        "address" => "Visconde de Barbacena, 67",
        "cep" => "10203040",
        "cpf" => "55667788899",
        "email" => "dominga@gmail.com",
        "password" => "123456",
        "name" => "Dominga"
      }

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "message" => "User created!",
               "user" => %{
                 "address" => "Visconde de Barbacena, 67",
                 "age" => 57,
                 "cpf" => "55667788899",
                 "email" => "dominga@gmail.com",
                 "id" => _id
               }
             } = response
    end

    test "When there is some error, returns the error", %{conn: conn} do
      params = %{
        "password" => "123456",
        "name" => "Dominga"
      }

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:bad_request)

      expected_response = %{
        "message" => %{
          "address" => ["can't be blank"],
          "age" => ["can't be blank"],
          "cep" => ["can't be blank"],
          "cpf" => ["can't be blank"],
          "email" => ["can't be blank"]
        }
      }

      assert response == expected_response
    end
  end

  describe "delete/2" do
    setup %{conn: conn} do
      user = insert(:user)
      {:ok, token, _claims} = Guardian.encode_and_sign(user)
      conn = put_req_header(conn, "authorization", "Bearer #{token}")

      {:ok, conn: conn, user: user}
    end

    test "When there is a user with the given id, deletes the user", %{conn: conn} do
      id = "05c0f5f6-2480-11ed-861d-0242ac120002"

      response =
        conn
        |> delete(Routes.users_path(conn, :delete, id))
        |> response(:no_content)

      assert response == ""
    end
  end
end
