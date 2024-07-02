defmodule ElixirMoedaTeste do
  use ExUnit.Case
  doctest ElixirMoeda

  test "retorna erro para moeda inexistente" do
    assert {:error, _} = ElixirMoeda.novo(1000, :XYZ)
  end

  test "lança exceção para centavos não ser um inteiro" do
    assert_raise FunctionClauseError, fn ->
      ElixirMoeda.novo(10.00, :USD)
    end
  end

  test "lança exceção para centavos não ser maior ou igual a zero" do
    assert_raise FunctionClauseError, fn ->
      ElixirMoeda.novo(-100, :USD)
    end
  end

  test "lança exceção para moeda não ser um atom" do
    assert_raise FunctionClauseError, fn ->
      ElixirMoeda.novo(100, "USD")
    end
  end

  test "lança exceção para moeda inexistente (novo!)" do
    assert_raise CaseClauseError, fn ->
      ElixirMoeda.novo!(1000, :XYZ)
    end
  end

  test "lança exceção quando a moeda destino não for um atom" do
    valor = ElixirMoeda.novo!(1000, :USD)
    assert_raise FunctionClauseError, fn ->
      ElixirMoeda.converte(valor, "EUR")
    end
  end

  test "retorna erro ao somar moedas diferentes" do
    moeda1 = ElixirMoeda.novo!(1000, :USD)
    moeda2 = ElixirMoeda.novo!(500, :EUR)
    assert {:error, _} = ElixirMoeda.somar(moeda1, moeda2)
  end

  test "retorna erro ao subtrair moedas diferentes" do
    moeda1 = ElixirMoeda.novo!(1000, :USD)
    moeda2 = ElixirMoeda.novo!(500, :EUR)
    assert {:error, _} = ElixirMoeda.subtrair(moeda1, moeda2)
  end

  test "divide moeda em partes iguais" do
    moeda = ElixirMoeda.novo!(1000, :USD)
    assert {:ok, partes} = ElixirMoeda.split(moeda, 3)
    assert length(partes) == 3
    assert Enum.all?(partes, fn parte -> parte.codigo_moeda == :USD end)
  end

  test "lança exceção quando qtd_partes não é um número inteiro" do
    moeda = ElixirMoeda.novo!(1000, :USD)
    assert_raise FunctionClauseError, fn ->
      ElixirMoeda.split(moeda, 2.5)
    end
  end

  test "lança exceção quando qtd_partes não é maior que 0" do
    moeda = ElixirMoeda.novo!(1000, :USD)
    assert_raise FunctionClauseError, fn ->
      ElixirMoeda.split(moeda, 0)
    end
  end
end
