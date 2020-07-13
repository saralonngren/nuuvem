# Nuuvem

## Especificações

- Ruby 2.6.3
- Rails 6.0.3.2
- Banco de dados: Postgresql

### Instale as dependências.

Ao abrir o projeto, rode o comando `bundle install`.

### Configure o banco de dados:

Copie o arquivo `database.yml.sample`, coloque o usuário e senha relativo ao seu banco de dados local e renomeie o arquivo com `database.yml`

Rode `rails db:create`, em seguida `rails db:migrate`

### Execute o projeto

Rode o comando `rails s` e acesse localhost:3000.

## Gemfiles adicionadas

Os gemfiles que foram adicionados que não vêm, por padrão, ao iniciar um projeto rails foram:

- `'pg'` - Para o banco de dados
- `'slim'` - Para uma construção mais enxuta da view.
- `'bootstrap'` - Para adicionar o bootstrap
- `'rspec-rails'` - Para realizar testes utilizando rspec
- `'annotate'` - Para poder visualizar melhor os dados cadastrados no banco de dados ao acessar uma model.
