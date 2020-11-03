REPOSITORY = spa-weather-monitor-vuecli

help:
	@echo -B --always-make
	@echo first //make this the first and the only commit
	@echo repo //create repository

.PHONY: first
first:
	rm -rfv .git
	git init
	git add --all
	git commit -m "."
	git remote add origin https://github.com/albraga/${REPOSITORY}
	git tag -a v0.1 -m "vue, bootstrap, feather-icons, leaflet"
	git push --tags -u --force origin master 

.PHONY: repo
repo:
	curl -u 'albraga' https://api.github.com/user/repos -d '{"name":"${REPOSITORY}"}'
	$(MAKE) first

.PHONY: pull
pull:
	git fetch --all
	git reset --hard origin/master

.PHONY: push
push:
	git add --all
	git commit -m '.'
	git push

.PHONY: build
build:
	echo "module.exports = {publicPath: '/spa-weather-monitor-vuecli/'}" > vue.config.js
	npx vue-cli-service build
	rm -rfv docs
	mv dist docs

.PHONY: serve
serve:
	rm -rfv vue.config.js
	npx vue-cli-service serve
	rm -rfv docs
	mv dist docs

.PHONY: reset
reset:
	git status
	git reset --hard HEAD
