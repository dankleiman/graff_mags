# encoding: utf-8

class BackCoverUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process :resize_to_fit => [1950, 1950]

  version :thumb do
    process :resize_to_fill => [200,200]
  end

  version :medium do
    process :resize_to_fill => [800, 800]
  end

  def extension_white_list
    %w(jpg jpeg)
  end
end
