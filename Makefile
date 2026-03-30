build:
	JEKYLL_ENV=production bundle exec jekyll build

serve:
	bundle exec jekyll serve

deploy:
	JEKYLL_ENV=production bundle exec jekyll build

	rm -rf /tmp/_site_build
	cp -r _site /tmp/_site_build

	git checkout master

	find . -maxdepth 1 ! -name '.git' ! -name '.' -exec rm -rf {} +
	cp -r /tmp/_site_build/* .

	git add .
	git commit -m "Manual deploy: $$(date)"
	# git push origin master

	# git checkout sources
	# rm -rf /tmp/_site_build
