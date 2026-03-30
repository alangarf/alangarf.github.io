build:
	JEKYLL_ENV=production bundle exec jekyll build

serve:
	bundle exec jekyll serve

deploy:
	JEKYLL_ENV=production bundle exec jekyll build
	cd _site && \
	git add . && \
	git commit -m "Deploy: $$(date)" && \
	git push origin master
