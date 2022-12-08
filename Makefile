ruby:
	@docker-compose run ruby bash

run.tests:
	@docker-compose run ruby bash -c "ruby -Itest all.rb"
