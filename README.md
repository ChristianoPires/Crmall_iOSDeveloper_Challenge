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
  - Listar os programas favoritados (a listagem é estática, isso quer dizer que toda vez que fechar e abrir o app a lista é zerada).
  
A funcionalidade de favoritar um programa funciona da seguinte maneira:
  - Dê um duplo click no programa que deseja favoritar e pronto foi adicionado a lista. (Até o momento 23/12/2020, não foi implementado um feedback visual ou sensível para o usuário, quando implementado tal feedback o readme será atualizado.)
  
Listar os programas favoritados:
  - Basta clicar no botão "favoritos" na toolBar, após o click ele te redireciona para outra tela com seus programas favoritos listados. Se quiser voltar para a primeira tela, basta clicar no botão "voltar" na navigationBar, e então voltará para a tela inicial onde pode continuar a ver os programas populares e favoritar mais programas.
  
# Planos futuros

Implementações:
  - Launch screen;
  - Icone;
  - Função de desfavoritar um programa;
  - Persistência dos dados referentes aos programas favoritados;
  
# Dúvidas e sugestões

Se tiver dúvidas ou sugestões me mande um email.
  - Meu email é cristianof95@gmail.com;

  


