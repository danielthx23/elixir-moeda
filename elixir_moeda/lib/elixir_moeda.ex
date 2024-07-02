defmodule ElixirMoeda do
  @moduledoc """
  Documentação do módulo ElixirMoeda
  Versão: 1.1.1
  Criado por Daniel Akiyama
  GitHub: https://github.com/danielthx23
  Linkedin: https://www.linkedin.com/in/daniel-akiyama/

  Desafio proposto pela Stone: https://gist.github.com/Isabelarrodrigues/873b8849e8b54f0968d77a4b2f111ec4

  Este módulo serve para reunir várias funções de operações financeiras.
  Tanto as mais básicas, como subtrair e somar, quanto operações complexas como a de Split e de conversão de ElixirMoedas.
  Este aplicativo utiliza uma estrutura de dados abstrata para representar valores monetários em centavos e suas respectivas ElixirMoedas.
  """

  # Importa o mapping de taxas com alias do modulo
  alias ElixirMoeda.Taxas

  # Define a estrutura de dados (map) com o nome do modulo e define os valores padrões para centavos,
  # código da moeda, simbolo da moeda e quantidade de casas decimais da moeda.

  # Structs são simplesmente Maps com um campo "especial" chamado __struct__ que contém o nome da estrutura.
  # Contudo, não herdam nenhum dos protocolos que os Maps herdam.
  defstruct centavos: 0, codigo_moeda: "BRL", simbolo: "$", casas_decimais: 0

  @doc ~S"""
  Cria uma nova instância de ElixirMoeda com os centavos e o código de ElixirMoeda especificados, buscando os outros atributos
  no mapping @taxas_cambio com o código da moeda.

  Retorna uma tupla contendo um átomo de resposta (:ok ou :error) e o resultado correspondente.

  ## Parâmetros

  * `centavos`: O valor em centavos da nova instância de ElixirMoeda, deve ser um número inteiro positivo.
  * `codigo_moeda`: O código da moeda desejada para a nova instância, deve ser um átomo existente em @taxas_cambio.

  ## Retorna

  Retorna `{:ok, ElixirMoeda}` se a moeda existir em @taxas_cambio, onde `ElixirMoeda` é uma estrutura %ElixirMoeda com os atributos preenchidos.
  Retorna `{:error, message}` se o código de ElixirMoeda não existir em @taxas_cambio.

  ## Exemplo

        iex> ElixirMoeda.novo(1000, :USD)
        {:ok, %ElixirMoeda{centavos: 1000, codigo_moeda: :USD, simbolo: "$", casas_decimais: 2}}

        iex> ElixirMoeda.novo(1000, :XYZ)
        {:error, "Essa moeda não existe!"}

  """
  def novo(centavos, codigo_moeda)
      when is_integer(centavos) and
            centavos >= 0 and
            is_atom(codigo_moeda) do
    case Taxas.get_moeda(codigo_moeda) do
      nil ->
        {:error, "Essa moeda não existe!"}

      %{simbolo: simbolo, casas_decimais: decimais} ->
        {:ok,
        %ElixirMoeda{
          centavos: centavos,
          codigo_moeda: codigo_moeda,
          simbolo: simbolo,
          casas_decimais: decimais
        }}
    end
  end

  @doc ~S"""
  Cria uma nova instância de ElixirMoeda com os centavos e o código de ElixirMoeda especificados, buscando os outros atributos
  no mapping @taxas_cambio com o código de ElixirMoeda.

  Retorna uma tupla contendo um átomo de resposta (:ok ou :error) e o resultado correspondente.

  ## Parâmetros

  * `centavos`: O valor em centavos da nova instância de ElixirMoeda, deve ser um número inteiro positivo.
  * `codigo_moeda`: O código da ElixirMoeda desejada para a nova instância, deve ser um átomo existente em @taxas_cambio.

  ## Retorna

  Retorna `{:ok, ElixirMoeda}` se a ElixirMoeda existir em @taxas_cambio, onde `ElixirMoeda` é uma estrutura %ElixirMoeda com os atributos preenchidos.
  Retorna `{:error, message}` se o código de ElixirMoeda não existir em @taxas_cambio.

  ## Exemplo

        iex> ElixirMoeda.novo(1000, :USD)
        {:ok, %ElixirMoeda{centavos: 1000, codigo_moeda: :USD, simbolo: "$", casas_decimais: 2}}

        iex> ElixirMoeda.novo(1000, :XYZ)
        {:error, "Essa moeda não existe!"}

  """
  def novo(centavos, codigo_moeda)
      when is_integer(centavos) and
            centavos >= 0 and
            is_atom(codigo_moeda) do
    case Taxas.get_moeda(codigo_moeda) do
      nil ->
        {:error, "Essa moeda não existe!"}

      %{simbolo: simbolo, casas_decimais: decimais} ->
        {:ok,
        %ElixirMoeda{
          centavos: centavos,
          codigo_moeda: codigo_moeda,
          simbolo: simbolo,
          casas_decimais: decimais
        }}
    end
  end

  @doc ~S"""
  Cria uma nova instância de ElixirMoeda com os centavos e o código de ElixirMoeda especificados, buscando os outros atributos
  no mapping @taxas_cambio com o código de ElixirMoeda.

  Apenas retorna o resultado.

  ## Parâmetros

  * `centavos`: O valor em centavos da nova instância de ElixirMoeda, deve ser um número inteiro positivo.
  * `codigo_moeda`: O código da ElixirMoeda desejada para a nova instância, deve ser um átomo existente em @taxas_cambio.

  ## Retorna

  Retorna uma estrutura %ElixirMoeda preenchida com os atributos correspondentes ao código de ElixirMoeda fornecido.

  ## Exemplo

      iex> ElixirMoeda.novo!(1000, :USD)
      %ElixirMoeda{centavos: 1000, codigo_moeda: :USD, simbolo: "$", casas_decimais: 2}

  """
  def novo!(centavos, codigo_moeda) do
    case Taxas.get_moeda(codigo_moeda) do
      %{simbolo: simbolo, casas_decimais: decimais} ->
        %ElixirMoeda{
          centavos: centavos,
          codigo_moeda: codigo_moeda,
          simbolo: simbolo,
          casas_decimais: decimais
        }
    end
  end

  @doc ~S"""
  Converte um valor de ElixirMoeda para outra ElixirMoeda com base nas taxas de câmbio definidas.

  ## Parâmetros

  * `%ElixirMoeda{...}`: O struct com código da ElixirMoeda de origem e valor em centavos, representado como uma estrutura `%ElixirMoeda{}`.
  * `destino`: O código da ElixirMoeda para a qual o `valor` será convertido.

  ## Retorna

  Retorna uma nova estrutura `%ElixirMoeda{}` com o valor convertido para a `novo_codigo_moeda`, aplicando as taxas de câmbio definidas em `@taxas_cambio`.

  ## Exemplo

      iex> valor = ElixirMoeda.novo!(1000, :USD)
      iex> ElixirMoeda.converte(valor, :EUR)
      {:ok, %ElixirMoeda{centavos: 931, codigo_moeda: :EUR, simbolo: "€", casas_decimais: 2}}

  """
  def converte(%ElixirMoeda{centavos: centavos, codigo_moeda: origem}, destino)
      when is_atom(destino) do
    case {Taxas.get_moeda(origem), Taxas.get_moeda(destino)} do
      {nil, _} ->
        {:error, "Não há taxas de câmbio definidas para #{origem}."}

      {_, nil} ->
        {:error, "Não há taxas de câmbio definidas para #{destino}."}

      {%{taxa: taxa_origem},
      %{taxa: taxa_destino, simbolo: simbolo_destino, casas_decimais: decimais}} ->
        novo_centavos = round(centavos * (taxa_origem / taxa_destino))

        {:ok,
        %ElixirMoeda{
          centavos: novo_centavos,
          codigo_moeda: destino,
          simbolo: simbolo_destino,
          casas_decimais: decimais
        }}
    end
  end

  @doc ~S"""
  Formata um valor de ElixirMoeda como uma string de saída formatada com o símbolo, valor formatado e código da ElixirMoeda.

  ## Parâmetros

  * `%ElixirMoeda{...}`: Estrutura %ElixirMoeda contendo as informações do valor monetário a ser formatado.

  ## Retorna

  Retorna `{:ok, string_formatada}` contendo a representação formatada da ElixirMoeda, ou `{:error, reason}` se houver um erro.

  ## Exemplo

      iex> ElixirMoeda.formatar_para_string(ElixirMoeda.novo!(1000, :USD))
      {:ok, "$ 10.0 USD"}

  """
  def formatar_para_string(%ElixirMoeda{
        centavos: centavos,
        codigo_moeda: moeda,
        simbolo: simbolo,
        casas_decimais: casas
      }) do
    {:ok,
    "#{simbolo} #{formatar_para_float(%ElixirMoeda{centavos: centavos, casas_decimais: casas})} #{moeda}"}
  end

  defp formatar_para_float(%ElixirMoeda{centavos: centavos, casas_decimais: casas_decimais}) do
    Float.round(centavos / 100.0, casas_decimais)
    |> Float.to_string()
  end

  @doc ~S"""
  Soma dois valores de ElixirMoeda se eles tiverem a mesma ElixirMoeda.

  ## Parâmetros

  * `moeda1`: Estrutura %ElixirMoeda contendo os valores a serem somados.
  * `moeda2`: Estrutura %ElixirMoeda contendo os valores a serem somados.

  ## Retorna

  Retorna `{:ok, %ElixirMoeda{centavos: resultado}}` se as ElixirMoedas forem iguais.
  Retorna `{:error, mensagem_de_erro}` se as ElixirMoedas forem diferentes.

  ## Exemplos

      iex> ElixirMoeda.somar(ElixirMoeda.novo!(1000, :USD), ElixirMoeda.novo!(500, :USD))
      {:ok, %ElixirMoeda{casas_decimais: 2, centavos: 1500, codigo_moeda: :USD, simbolo: "$"}}

      iex> ElixirMoeda.somar(ElixirMoeda.novo!(1000, :USD), ElixirMoeda.novo!(500, :EUR))
      {:error, "Os dois valores são de ElixirMoedas diferentes! USD != EUR"}

  """
  def somar(
        %ElixirMoeda{centavos: centavos1, codigo_moeda: moeda1},
        %ElixirMoeda{centavos: centavos2, codigo_moeda: moeda2}
      ) do
    case moeda1 == moeda2 do
      true -> ElixirMoeda.novo(centavos1 + centavos2, moeda1)
      false -> {:error, "Os dois valores são de ElixirMoedas diferentes! #{moeda1} != #{moeda2}"}
    end
  end

  @doc ~S"""
  Subtrai dois valores de ElixirMoeda se eles tiverem a mesma ElixirMoeda.

  ## Parâmetros

  * `moeda1`: Estrutura %ElixirMoeda contendo os valores a serem subtraídos.
  * `moeda2`: Estrutura %ElixirMoeda contendo os valores a serem subtraídos.

  ## Retorna

  Retorna `{:ok, %ElixirMoeda{centavos: resultado}}` se as ElixirMoedas forem iguais.
  Retorna `{:error, mensagem_de_erro}` se as ElixirMoedas forem diferentes.

  ## Exemplos

      iex> ElixirMoeda.subtrair(ElixirMoeda.novo!(1000, :USD), ElixirMoeda.novo!(500, :USD))
      {:ok, %ElixirMoeda{casas_decimais: 2, centavos: 500, codigo_moeda: :USD, simbolo: "$"}}

      iex> ElixirMoeda.subtrair(ElixirMoeda.novo!(1000, :USD), ElixirMoeda.novo!(500, :EUR))
      {:error, "Os dois valores são de ElixirMoedas diferentes! USD != EUR"}

  """
  def subtrair(
        %ElixirMoeda{centavos: centavos1, codigo_moeda: moeda1},
        %ElixirMoeda{centavos: centavos2, codigo_moeda: moeda2}
      ) do
    case moeda1 == moeda2 do
      true -> ElixirMoeda.novo(centavos1 - centavos2, moeda1)
      false -> {:error, "Os dois valores são de ElixirMoedas diferentes! #{moeda1} != #{moeda2}"}
    end
  end

  @doc ~S"""
  Divide um valor total em centavos em um número específico de partes iguais.

  ## Parâmetros

  * `total_centavos`: Total de centavos a ser dividido, representado como um valor inteiro.
  * `qtd_partes`: Número inteiro de partes em que o valor total será dividido.

  ## Retorna

  Retorna `{:ok, [parte1, parte2, ...]}` onde cada parte é uma estrutura %ElixirMoeda representando a divisão do valor.

  ## Exemplos

      iex> ElixirMoeda.split(ElixirMoeda.novo!(1000, :USD), 3)
      {:ok, [
      %ElixirMoeda{casas_decimais: 2, centavos: 334, codigo_moeda: :USD, simbolo: "$"},
      %ElixirMoeda{casas_decimais: 2, centavos: 333, codigo_moeda: :USD, simbolo: "$"},
      %ElixirMoeda{casas_decimais: 2, centavos: 333, codigo_moeda: :USD, simbolo: "$"}
      ]}

      iex> ElixirMoeda.split(ElixirMoeda.novo!(1000, :USD), 4)
      {:ok, [
      %ElixirMoeda{casas_decimais: 2, centavos: 250, codigo_moeda: :USD, simbolo: "$"},
      %ElixirMoeda{casas_decimais: 2, centavos: 250, codigo_moeda: :USD, simbolo: "$"},
      %ElixirMoeda{casas_decimais: 2, centavos: 250, codigo_moeda: :USD, simbolo: "$"},
      %ElixirMoeda{casas_decimais: 2, centavos: 250, codigo_moeda: :USD, simbolo: "$"}
      ]}

  """
  def split(%ElixirMoeda{centavos: total_centavos, codigo_moeda: codigo_moeda}, qtd_partes)
      when is_integer(qtd_partes) and qtd_partes > 0 do
    quociente = div(total_centavos, qtd_partes)
    resto = rem(total_centavos, qtd_partes)

    {:ok,
    Enum.map(1..qtd_partes, fn index ->
      ElixirMoeda.novo!(quociente + if(index <= resto, do: 1, else: 0), codigo_moeda)
    end)}
  end
end
