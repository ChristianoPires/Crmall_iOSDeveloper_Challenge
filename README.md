# Crmall_iOSDeveloper_Challenge

Neste repositório você encontrará a implementação do desafio para a vaga de Desenvolvedor iOS da empresa CRMALL.

# Desafio

O desafio consiste em: Desenvolver um sistema para listar as séries de TV mais populares da semana, permitindo favoritar séries específicas, assim como listar as séries favoritadas.

# API

A API utilizada foi The Movie Database (https://www.themoviedb.org/).
  - O método de autenticação foi por via Bearer Token;
  - Os dados foram recuperados em pt-br.
 
Os dados são apresentados em forma tabular simples, em outras palavras foi utilizado uma simples UITableView populada com os dados recuperados da API.


# Arquitetura

A arquitetura usada foi a MVC.

# O App

Na tela inicial temos os dados recuperados da API apresentados em um TableView;

Dados Apresentados:
  - Nome do programa;
  - Gênero;
  - Sinopse;
  - Média de avaliações;
  - Avaliações;
  - Imagem poster do programa.
  
Funcionalidades:
  - Listar os programas populares de televisão (função default do app);
  - Favoritar um programa;
  - Listar os programas favoritados.
  
Tela:

  


