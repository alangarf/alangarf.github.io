build:
	JEKYLL_ENV=production bundle exec jekyll build

serve:
	bundle exec jekyll serve

deploy:
	JEKYLL_ENV=production bundle exec jekyll build

	git -C _site add .
	git -C _site commit -m "Deploy update: $$(date)"
	git -C _site push origin master

	@echo "------------------------------------------------"
	@echo "✅ Deployment complete! Sources and Master stayed separated."
