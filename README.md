Rubylator
=========

Rubylator is a web interface for tranlating Ruby on Rails apps (or any other app that uses YAML files to store translations).

Its features include:

* Simple Interface
* Import/Export YAML files
* Multiple Projects
* User Management
  * Roles: Project Admin, Translator
* Machine Translation (using Bing)

Get started
-----------

* Clone this repository
* Copy `config/database.yml.example` to `config/database.yml`
* If you want to use Bing translation, you need to get an API key and enter it in `config/initializers/bing_translator.rb`
