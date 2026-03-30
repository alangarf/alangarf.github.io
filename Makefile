build:
	JEKYLL_ENV=production bundle exec jekyll build

serve:
	bundle exec jekyll serve

deploy:
	# 1. Build the site on your 'sources' branch
	JEKYLL_ENV=production bundle exec jekyll build

	# 2. Copy the fresh site to /tmp so it doesn't get wiped when we switch branches
	rm -rf /tmp/_site_build
	cp -r _site /tmp/_site_build

	# 3. Switch to master, clear it, and copy new files in
	git checkout master
	# Remove everything except the .git folder
	find . -maxdepth 1 ! -name '.git' ! -name '.' -exec rm -rf {} +
	cp -r /tmp/_site_build/* .

	# 4. Commit and Push
	git add .
	git commit -m "Manual deploy: $$(date)"
	git push origin master

	# 5. Go back to sources
	git checkout sources

# deploy:
# 	@echo "Cleaning old build..."
# 	rm -rf _site
# 	JEKYLL_ENV=production bundle exec jekyll build
# 	@# Ensure .nojekyll exists so GitHub doesn't ignore folders starting with underscores
# 	touch _site/.nojekyll
# 	cd _site && \
# 	git add . && \
# 	git commit -m "Deploy: $$(date)" && \
# 	git push origin master
