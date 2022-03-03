# frozen_string_literal: true

require "jekyll"

module TagGenerator
    class Generator < Jekyll:Generator
        safe true

        Jekyll.logger.info "Oh hey"
        Jekyll.logger.info "Oh hey", "Bar"
        Jekyll.logger.info "Oh hey", "Foo", "Baz"

        def generate(site)
            site.tags.each do |tag, posts|
                site.pages << TagPage.new(site, tag, posts)
            end
        end
    end

    class TagPage < Jekyll:Page
        def initialize(site, tag, posts)
            @site = site
            @base = site.source
            @dir = "tags/#{tag.slugify}"
            
            @basename = 'index'
            @ext = '.html'
            @name = 'index.html'

            @data = {
                'linked_docs' => posts
            }

            data.default_proc = proc do |_, key|
                site.frontmatter_defaults.find(relative_path, :tags, key)
            end
        end

        def url_placeholders
            {
                :basename => basename,
                :output_ext => output_ext,
            }
        end
    end
end
