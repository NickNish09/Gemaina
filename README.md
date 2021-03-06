# Gemaina

Gema utilizada para gerar features para o Cucumber utilizando o rails generate

**Instalação:**  
adicione  
```
gem 'gemaina', '~> 1.0'  
```
ao seu gemfile e
execute  
```
$ bundle install
```
**Uso básico:**  
Com a Gemaina instalada você pode gerar os arquivos das features mais rapidamente com o rails generator feature.
Por exemplo, uma feature de list filmes seria criada com:  
 ```
 rails generate feature list_movies
 ```
  - Cria o arquivo list_movies.feature na pasta features do cucumber  
  - Cria o arquivo list_movies_steps.rb na pasta features/step_definitions do cucumber  
  
**Parâmetros:**  
Você pode criar as features também em outras linguagens (padrão é o inglês), como por exemplo em português, passando o parâmetro --language e a sigla da linguagem:  
```
rails generate feature list_movies --language pt  
```
E também criar ela numa pasta específica, para melhor organização, com o parâmetro --folder:  
```
rails generate feature list_movies --folder movies  
```
Você pode utilizar o parâmetro --scaffold para gerar os cenários de CRUD:
```
rails generate feature movie --scaffold  #nome da feature no singular
```
Isso irá gerar os cenários para index,create,show,edit e delete
