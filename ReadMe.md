# Core Principes - CoC
	- Coc (Convention over Configuration)
		- provides default options for most things
	- DRY (Don't Repeat Yourself)

## Rubys env
	-youtube.com/watch?v=IvzEvrPJH6w
	- ruby --version
	- sqlite3 --version
	- node --version
	- yarn --version
	- gem --version
	- rails --version

## Rails installation
	- gem install rails

## Rails commands
	- rails new <proj_name>
	- rails server
	- or rails s

## Changes in Gem File
	- for windows we need to change gem file to run the server
	- go to vks_blog\Gemfile and change
		- gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ] to
		- ** gem "tzinfo-data", '~> 1.2021', '>= 1.2021.5' **
	- and run bundle install (any changes in gem file require this command to insert)

### Controller
	- rails generate[or g] controller articles index --skip-routes (only use small letters)

### Database
	- rails generate scaffold person name:string position:string phone_number:integer married:boolean
		- rails generate migration add_last_name_to_person last_name:string
	- rails db:migrate RAILS_ENV=development
		or
	- bundle exec rake db:migrate
	- rails routes

### Shallow routing
http://localhost:3000/organization/:org_id/people/:people_id/claims/:id

http://localhost:3000/people/:people_id/claims/:id

	- COLLECTION
		- index new create
	- MEMBER
		- show, edit, update, destroy

------------------------------------------------------------------------------------

name = 'vineesh'
name.class -> string
fixnum for integer
1..10 -> range


## RSpec
https://rspec.info/documentation/

1) 	bundle init #will create gem File
 		- add *gem 'rspec'* to the File

2) 	bundle config set --local path 'vendor'
		bundle install --binstub

3) 	bin/rspec --init # will create spec folder
			spec folder is important as it contains all the test classes
# to run the RSpec
4) 	bundle exec rspec
