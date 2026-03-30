build:
	JEKYLL_ENV=production bundle exec jekyll build

serve:
	bundle exec jekyll serve

deploy:
	@echo "Cleaning old build..."
	rm -rf _site
	JEKYLL_ENV=production bundle exec jekyll build
	@# Ensure .nojekyll exists so GitHub doesn't ignore folders starting with underscores
	touch _site/.nojekyll
	cd _site && \
	git add . && \
	git commit -m "Deploy: $$(date)" && \
	git push origin master
