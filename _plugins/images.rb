module Jekyll
  module ImagesFilter

    def images(name)
      dir="images"
      files = Dir.glob(File.join(dir,name, "*"))
      imageTags = files.map do |filename|
          basename = File.basename(filename)

          url  = ['', dir, name, basename] - ['.']
          url  = url.join '/'

          puts "<img src='#{url}' alt='#{basename}' />"
      end
      imageTags.join  "\n\r"
    end

  end # ImagesFilter
end

Liquid::Template.register_filter(Jekyll::ImagesFilter)