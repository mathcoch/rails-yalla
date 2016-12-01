# encoding: utf-8

class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process :tags => ['posted_picture_' + ENV['CLOUDINARY_USER'] ]

  process eager: true  # Force version generation at upload time.

  process convert: 'jpg'

  version :background do
    cloudinary_transformation width: 1600, height: 500, crop: :fill
  end

  version :cards do
    cloudinary_transformation width: 400, height: 300, crop: :fill
  end

end
