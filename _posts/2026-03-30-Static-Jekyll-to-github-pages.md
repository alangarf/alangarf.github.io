---
title: Using git subtree to send `_site` to `master` branch
excerpt: "More for the brain file"
---

# What?

If you use github pages and you want to generate your static files yourself you can use a repo with a `master` branch that is your public static rendered files, and another branch in my case `sources` that is the raw source files that I render with Jeykll locally.

# Why?

Because I want to add my own modules and plugins and have the rendered locally and not be forced to use the supported ones for github to render for me.

# How?

It's pretty neat I think:

```
rm -rf _site
git worktree add _site master
```

Then add the following to your `Makefile` if you use make, alter to adjust to your use case.

```
deploy:
	JEKYLL_ENV=production bundle exec jekyll build
	cd _site && git add . && git commit -m "Deploy: $(shell date)" && git push origin master
```

Which will commit the `_site` into the `master` branch and push it to github.

Which you simply do by:

```
make deploy
```

And 30 seconds later your github pages is updated and live!
