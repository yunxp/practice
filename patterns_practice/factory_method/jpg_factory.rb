class JpgFactory < PictureFactory
    def get_picture
        JpgPicture.new
    end
end
