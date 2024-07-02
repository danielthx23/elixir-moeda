defmodule ElixirMoeda.Taxas do
  @moduledoc """
  Cria um mapping com atributos para o módulo, que define as taxas de câmbio
  para diversas moedas em relação ao Dólar Americano (USD).

  Os valores das taxas de câmbio podem ser atualizadas regularmente conforme necessário.
  """

@taxas_cambio %{
  :USD => %{taxa: 1.0, simbolo: "$", casas_decimais: 2},
  :EUR => %{taxa: 1.073560, simbolo: "€", casas_decimais: 2},
  :GBP => %{taxa: 1.264387, simbolo: "£", casas_decimais: 2},
  :BRL => %{taxa: 0.178806, simbolo: "R$", casas_decimais: 2},
  :INR => %{taxa: 0.011995, simbolo: "₹", casas_decimais: 2},
  :AUD => %{taxa: 0.667796, simbolo: "A$", casas_decimais: 2},
  :CAD => %{taxa: 0.730671, simbolo: "C$", casas_decimais: 2},
  :SGD => %{taxa: 0.737567, simbolo: "S$", casas_decimais: 2},
  :CHF => %{taxa: 1.114815, simbolo: "Fr", casas_decimais: 2},
  :MYR => %{taxa: 0.211954, simbolo: "RM", casas_decimais: 2},
  :JPY => %{taxa: 0.006223, simbolo: "¥", casas_decimais: 0},
  :CNY => %{taxa: 0.137602, simbolo: "¥", casas_decimais: 2},
  :ARS => %{taxa: 0.001101, simbolo: "ARS", casas_decimais: 2},
  :BHD => %{taxa: 2.659574, simbolo: "BD", casas_decimais: 3},
  :BWP => %{taxa: 0.073701, simbolo: "P", casas_decimais: 2},
  :BND => %{taxa: 0.737567, simbolo: "B$", casas_decimais: 2},
  :BGN => %{taxa: 0.548903, simbolo: "лв", casas_decimais: 2},
  :CLP => %{taxa: 0.001057, simbolo: "CLP", casas_decimais: 0},
  :COP => %{taxa: 0.000240, simbolo: "COL$", casas_decimais: 2},
  :CZK => %{taxa: 0.042714, simbolo: "Kč", casas_decimais: 2},
  :DKK => %{taxa: 0.143952, simbolo: "kr", casas_decimais: 2},
  :AED => %{taxa: 0.272294, simbolo: "د.إ", casas_decimais: 2},
  :HKD => %{taxa: 0.128067, simbolo: "HK$", casas_decimais: 2},
  :HUF => %{taxa: 0.002718, simbolo: "Ft", casas_decimais: 2},
  :ISK => %{taxa: 0.007206, simbolo: "kr", casas_decimais: 0},
  :IDR => %{taxa: 0.000061, simbolo: "Rp", casas_decimais: 0},
  :IRR => %{taxa: 0.000024, simbolo: "IRR", casas_decimais: 0},
  :ILS => %{taxa: 0.265459, simbolo: "₪", casas_decimais: 2},
  :KZT => %{taxa: 0.002112, simbolo: "₸", casas_decimais: 2},
  :KWD => %{taxa: 3.258099, simbolo: "KD", casas_decimais: 3},
  :LYD => %{taxa: 0.205276, simbolo: "LD", casas_decimais: 3},
  :MUR => %{taxa: 0.021207, simbolo: "₨", casas_decimais: 2},
  :MXN => %{taxa: 0.054568, simbolo: "MX$", casas_decimais: 2},
  :NPR => %{taxa: 0.007493, simbolo: "₨", casas_decimais: 2},
  :NZD => %{taxa: 0.609858, simbolo: "NZ$", casas_decimais: 2},
  :NOK => %{taxa: 0.093909, simbolo: "kr", casas_decimais: 2},
  :OMR => %{taxa: 2.599077, simbolo: "ر.ع.", casas_decimais: 3},
  :PKR => %{taxa: 0.003593, simbolo: "₨", casas_decimais: 2},
  :PHP => %{taxa: 0.017119, simbolo: "₱", casas_decimais: 2},
  :PLN => %{taxa: 0.248782, simbolo: "zł", casas_decimais: 2},
  :QAR => %{taxa: 0.274725, simbolo: "QR", casas_decimais: 2},
  :RON => %{taxa: 0.215519, simbolo: "lei", casas_decimais: 2},
  :RUB => %{taxa: 0.011694, simbolo: "₽", casas_decimais: 2},
  :SAR => %{taxa: 0.266667, simbolo: "SR", casas_decimais: 2},
  :ZAR => %{taxa: 0.055458, simbolo: "R", casas_decimais: 2},
  :KRW => %{taxa: 0.000724, simbolo: "₩", casas_decimais: 0},
  :LKR => %{taxa: 0.003268, simbolo: "₨", casas_decimais: 2},
  :SEK => %{taxa: 0.094649, simbolo: "kr", casas_decimais: 2},
  :TWD => %{taxa: 0.030750, simbolo: "NT$", casas_decimais: 2},
  :THB => %{taxa: 0.027296, simbolo: "฿", casas_decimais: 2},
  :TND => %{taxa: 0.334472, simbolo: "د.ت", casas_decimais: 3},
  :TRY => %{taxa: 0.030580, simbolo: "₺", casas_decimais: 2},
  :VEF => %{taxa: 0.0000002755, simbolo: "Bs", casas_decimais: 2},
  :VND => %{taxa: 0.000043, simbolo: "₫", casas_decimais: 0},
  :XAF => %{taxa: 0.001752, simbolo: "FCFA", casas_decimais: 0},
  :XCD => %{taxa: 0.370370, simbolo: "EC$", casas_decimais: 2},
  :XOF => %{taxa: 0.001752, simbolo: "CFA", casas_decimais: 0},
  :ZMW => %{taxa: 0.049206, simbolo: "ZK", casas_decimais: 2}
}

@doc ~S"""
Retorna o mapa completo de taxas de câmbio.

## Retorna

Retorna o mapa @taxas_cambio.
"""
def get_taxas_cambio() do
  @taxas_cambio
end

@doc ~S"""
Obtém os detalhes completos de uma moeda a partir do mapa de taxas de câmbio.

## Parâmetros

* `moeda`: Código da moeda desejada para consulta.

## Retorna

Retorna a estrutura completa da moeda se encontrada no mapa, ou `nil` caso contrário.

## Exemplo

      iex> Moeda.Taxas.get_moeda(:USD)
      %{taxa: 1.0, simbolo: "$", casas_decimais: 2}

      iex> Moeda.Taxas.get_moeda("XYZ")
      nil
"""
def get_moeda(moeda) do
  case Map.get(@taxas_cambio, moeda) do
    nil -> nil
    moeda_info -> moeda_info
  end
end

@doc ~S"""
Obtém a taxa de câmbio de uma moeda específica a partir do mapa de taxas de câmbio.

## Parâmetros

* `moeda`: Código da moeda desejada para consulta.

## Retorna

Retorna a taxa de câmbio da moeda se encontrada no mapa, ou `nil` caso contrário.

## Exemplo

      iex> Moeda.Taxas.get_taxa(:USD)
      1.0

      iex> Moeda.Taxas.get_taxa(:XYZ)
      nil
"""
def get_taxa(moeda) do
  case get_moeda(moeda) do
    nil -> nil
    %{taxa: taxa} -> taxa
  end
end

@doc ~S"""
Obtém o símbolo de uma moeda específica a partir do mapa de taxas de câmbio.

## Parâmetros

* `moeda`: Código da moeda desejada para consulta.

## Retorna

Retorna o símbolo da moeda se encontrado no mapa, ou `nil` caso contrário.

## Exemplo

      iex> Moeda.Taxas.get_simbolo(:USD)
      "$"

      iex> Moeda.Taxas.get_simbolo(:XYZ)
      nil
"""
def get_simbolo(moeda) do
  case get_moeda(moeda) do
    nil -> nil
    %{simbolo: simbolo} -> simbolo
  end
end

@doc ~S"""
Obtém o número de casas decimais de uma moeda específica a partir do mapa de taxas de câmbio.

## Parâmetros

* `moeda`: Código da moeda desejada para consulta.

## Retorna

Retorna o número de casas decimais da moeda se encontrado no mapa, ou `nil` caso contrário.

## Exemplo

      iex> Moeda.Taxas.get_casas(:USD)
      2

      iex> Moeda.Taxas.get_casas(:XYZ)
      nil
"""
def get_casas(moeda) do
  case get_moeda(moeda) do
    nil -> nil
    %{casas_decimais: casas} -> casas
  end
end
end
