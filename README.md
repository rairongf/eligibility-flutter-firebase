<h1 align="center"> 
	eligibility_flutter_firebase
</h1>
<h4 align="center"> 
	Concluído ✅
</h4>

<p align="center">
Projeto desenvolvido como entrega de um desafio técnico para a vaga de Desenvolvedor Flutter Júnior ou Pleno.
</p>

<p align="center">
 <a href="#qual-o-desafio">Desafio</a> •
 <a href="#documentação">Documentação</a> • 
 <a href="#pré-requisitos">Pré-requisitos</a> •
 <a href="#executando-o-app">Executando o app</a> •
 <a href="#demonstração">Demonstração</a> •
 <a href="#tecnologias">Tecnologias</a> •
 <a href="#autor">Autor</a> 
</p>

### Qual o desafio?

Desenvolver um aplicativo em Flutter que permita a visualização de uma lista de formulários previamente cadastrados em nosso backend. A tela de listagem dos registros deve possibilitar
ao usuário filtrar os cadastros de acordo com o valor de um determinado campo.

Esses registros correspondem a uma versão simplificada da entidade Formulário de Elegibilidade. É por meio desse formulário que
pacientes são cadastrados e avaliados se estão aptos a participar de um determinado estudo. A documentação dos campos que constituem essa entidade será apresentada abaixo.

Para obter a lista de registros já cadastrada, deve-se um JSON disponibilizado [neste endereço](https://pastebin.com/raw/zPUtKAdx). Esse arquivo simula o retorno de
um serviço de um backend. Após obter a lista de registros, deve-se realizar o armazenamento dos cadastros em uma coleção no Firebase e a partir dessa coleção apresentar o
conteúdo em tela para o usuário.

Nenhuma definição de interface gráfica e os aspectos de usabilidade da tela serão exigidas. Cabe ao desenvolvedor definir a melhor forma de atender aos requisitos descritos abaixo:

#### Requisito #1

Apresentar uma lista com todos os registros obtidos do serviço.

#### Requisito #2

Cada item deverá apresentar: 
  - As iniciais do paciente (por exemplo: **`ABD`** para paciente com nome Antônio Bueno Duarte)
  - Data de nascimento
  - Idade
  - Sexo
  - Um elemento textual referente ao status do formulário:
    - Se `fillStatus = partial`, apresentar o termo **`Pendente`** no elemento;
    - Caso contrário, se `eligibilityStatus = eligible`, apresentar o termo **`Elegível`**. Senão, apresentar o termo **`Não elegível`**.

#### Requisito #3

A tela deverá possuir um mecanismo que permita ao usuário filtrar a lista de acordo com as três opções de status acima apresentadas. Dessa forma, por exemplo, deverá ser
possível exibir somente os registros com status **`Pendente`**.

### Documentação

O arquivo contendo a resposta da API é composto por objetos que possuem os campos descritos abaixo:

| Nome do campo        | Descrição                       | Formato                                                      |
| -------------------- |:--------------------------------| :------------------------------------------------------------|
| `uid`                | UUID do registro                | `String` UUID                                                  |
| `name`               | Nome do paciente                | `String` <br/> Sempre retornado                                |
| `birthday`           | Data de nascimento do paciente  | `String`, no formato YYYY-MM-DD <br/> Sempre retornado         |
| `sex`                | Sexo do paciente                | `int` (Referência _sex_) <br/> Sempre retornado               |
| `fillStatus`         | Situação de preenchimento       | `String` (Referência _fillStatus_) <br/> Sempre retornado        |
| `eligibilityStatus`  | Situação de elegibilidade       | `String` (Referência _eligibilityStatus_) <br/> Sempre retornado |

Os campos de referência podem assumir os seguintes valores:

#### Referência _**sex**_

| Código               | Descrição                       |
| -------------------- |:--------------------------------|
| `0`                  | Homem                           |
| `1`                  | Mulher                          |

#### Referência _**fillStatus**_

| Código               | Descrição                                 |
| -------------------- |:------------------------------------------|
| `partial`            | Formulário preenchido parcialmente        |
| `finished`           | Preenchimento do formulário foi concluído |

#### Referência _**eligibilityStatus**_

| Código               | Descrição                                                                                                 |
| -------------------- |:----------------------------------------------------------------------------------------------------------|
| `pending`            | Elegibilidade ainda não avaliada. Situação ocorre quando o preenchimento do formulário não foi concluído. |
| `eligible`           | Os critérios de elegibilidade do estudo foram atendidos                                                   |
| `notEligible`        | Os critérios de elegibilidade do estudo não foram atendidos                                               |

### Pré-requisitos

Antes de começar, você vai precisar ter instalado em sua máquina as seguintes ferramentas:
[Git](https://git-scm.com), [Flutter](https://flutter.dev/).

Além disso, é bom ter um editor para trabalhar com o código como o [VSCode](https://code.visualstudio.com/).

### Executando o app

```bash
# Clone este repositório
$ git clone <https://github.com/rairongf/eligibility_flutter_firebase>

# Acesse a pasta do projeto no terminal/cmd
$ cd eligibility_flutter_firebase

# Instale as dependências
$ flutter pub get

# Execute a aplicação em modo de desenvolvimento
$ flutter run

# O app será aberto no dispositivo conectado ou emulador
```

### Demonstração

🚧 Em construção 🚧

### Tecnologias

As seguintes ferramentas foram usadas na construção do projeto:

- [Flutter](https://flutter.dev/)
- [Dart](https://dart.dev/)
- [Firebase](https://firebase.google.com/)

### Autor

<a href="https://www.linkedin.com/in/raironferreira/">
 <img
    style="border-radius: 50%;"
    src="https://avatars.githubusercontent.com/u/43035850?v=4"
    width="100px;"
    alt=""/>
 <br />
 <sub><b>Rairon Ferreira</b></sub></a>


Feito com ❤️ por Rairon Ferreira 👋🏽 Entre em contato!

[![Linkedin Badge](https://img.shields.io/badge/-Rairon_Ferreira-blue?style=flat-square&logo=Linkedin&logoColor=white&link=https://www.linkedin.com/in/raironferreira/)](https://www.linkedin.com/in/raironferreira/) 
[![Gmail Badge](https://img.shields.io/badge/-rairon.dev@gmail.com-c14438?style=flat-square&logo=Gmail&logoColor=white&link=mailto:rairon.dev@gmail.com)](mailto:rairon.dev@gmail.com)