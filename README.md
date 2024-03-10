# Mich's Mystery Blog
This repo houses the source for my [blog](https://www.zkxs.dev/).

## Running locally

[Setup instructions](https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll/testing-your-github-pages-site-locally-with-jekyll)

```shell
# change into the root of the website
cd docs
# install dependencies
bundle install
# Run locally
bundle exec jekyll serve
# Run locally, but show drafts
bundle exec jekyll serve --drafts
```

## License
- The blog source code in this repository is licensed under the [MIT License](LICENSE.txt).
- The blog content and assets (posts/images/etc.) are not provided under any license. Therefore, if you wish to fork your own blog from this you need to remove the following:
  - `/docs/_drafts/*`
  - `/docs/_posts/*`
  - `/docs/svg/*`
  - `/docs/about.md`
  - `/graphs/*`

## Credits
- Uses [Graphviz](https://graphviz.org/) for graph layout and rendering - Common Public License Version 1.0
- Uses [svg-pan-zoom](https://github.com/bumbu/svg-pan-zoom) for SVG decoration - BSD-2-Clause License
- Uses the [minima](https://github.com/jekyll/minima) theme for Jekyll - MIT License