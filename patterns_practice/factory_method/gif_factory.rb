class GifFactory < PictureFactory
    def get_picture
        GifPicture.new
    end
end
