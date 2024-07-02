defmodule ElixirMoeda do
  @moduledoc """
  Documentação do módulo Moeda
  Versão: 1.1.1
  Criado por Daniel Akiyama
  GitHub: https://github.com/danielthx23
  Linkedin: https://www.linkedin.com/in/daniel-akiyama/

  Desafio proposto pela Stone: https://gist.github.com/Isabelarrodrigues/873b8849e8b54f0968d77a4b2f111ec4

  Este módulo serve para reunir várias funções de operações financeiras.
  Tanto as mais básicas, como subtrair e somar, quanto operações complexas como a de Split e de conversão de moedas.
  Este aplicativo utiliza uma estrutura de dados abstrata para representar valores monetários em centavos e suas respectivas moedas.
  """

  #Importa o mapping de taxas com alias do modulo
  alias Moeda.Taxas

  #Define a estrutura de dados (map) com o nome do modulo e define os valores padrões para centavos,
  #código da moeda, simbolo da moeda e quantidade de casas decimais da moeda.

  #Structs são simplesmente Maps com um campo "especial" chamado __struct__ que contém o nome da estrutura.
  #Contudo, não herdam nenhum dos protocolos que os Maps herdam.
  defstruct centavos: 0, codigo_moeda: "BRL", simbolo: "$", casas_decimais: 0

end
