module ImageHelper
  def background_image(args = {})
    url = args[:url]

    url = cl_image_path url if args[:cloudinary]

    color_one = 'rgba(0, 0, 0, 0)'
    color_two = 'rgba(0, 0, 0, .3)'

    "background-image: linear-gradient(#{color_one}, #{color_two}), url(#{url})"
  end
end
