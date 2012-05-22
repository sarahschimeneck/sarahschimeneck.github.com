module Jekyll

#https://github.com/mojombo/jekyll/pull/295/files

  class GalleryTag < Liquid::Block
    include Convertible
    attr_accessor :content, :data

    def initialize(tag_name, markup, tokens)
      attributes = {}

      # Parse parameters
      markup.scan(Liquid::TagAttributes) do |key, value|
        attributes[key] = value
      end

      @dir  = attributes['dir']    || 'images'
      @name = attributes['name']   || '.'

      super
    end

    def render(context)
      context.registers[:gallery] ||= Hash.new(0)

      files = Dir.glob(File.join(@dir,@name, "*"))
      length = files.length
      result = []

      context.stack do
        files.each_with_index do |filename, index|
          basename = File.basename(filename)

          url  = ['', @dir,@name, basename] - ['.']
          path = url[-2..-1].join '/'
          url  = url.join '/'

          context['file'] = {
            'title' => basename,
            'name' => basename,
            'path' => path,
            'url' => url
          }

          context['forloop'] = {
            'name' => 'gallery',
            'length' => length,
            'index' => index + 1,
            'index0' => index,
            'rindex' => length - index,
            'rindex0' => length - index - 1,
            'first' => (index == 0),
            'last' => (index == length - 1)
          }

          result << render_all(@nodelist, context)
        end
      end
      result
    end

  end

end

Liquid::Template.register_tag('gallery', Jekyll::GalleryTag)
