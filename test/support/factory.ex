defmodule Rockelivery.Factory do
  use ExMachina.Ecto, repo: Rockelivery.Repo

  alias Rockelivery.User

  def user_params_factory do
    %{
      age: 57,
      address: "Visconde de Barbacena, 67",
      cep: "10203040",
      cpf: "55667788899",
      email: "dominga@gmail.com",
      password: "123456",
      name: "Dominga"
    }
  end

  def user_factory do
    %User{
      age: 57,
      address: "Visconde de Barbacena, 67",
      cep: "10203040",
      cpf: "55667788899",
      email: "dominga@gmail.com",
      password: "123456",
      name: "Dominga",
      id: "05c0f5f6-2480-11ed-861d-0242ac120002"
    }
  end
end
