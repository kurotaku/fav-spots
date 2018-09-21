class ImageUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog
  # storage :sftp
  
  # CarrierWave.configure do |config|
  #   config.ftp_host = ENV['FTP_HOST']
  #   config.ftp_port = 21
  #   config.ftp_user = ENV['FTP_USER']
  #   config.ftp_passwd = ENV['FTP_PASS']
  #   config.ftp_folder = ENV['FTP_PATH']
  #   config.ftp_url = ENV['FTP_URL']
  #   config.ftp_passive = false
  #   config.ftp_tls = false
  # end
  
  CarrierWave.configure do |config|
    config.sftp_host = ENV['FTP_HOST'],
    config.sftp_user = ENV['FTP_USER'],
    config.sftp_options = {
    :password => ENV['FTP_PASS'],
    :port => 22
    }
    config.sftp_folder = ENV['FTP_PATH']
    config.sftp_url = ENV['FTP_URL']
  end
  
  

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  
  def size_range
    1..5.megabytes
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  process resize_to_limit: [1200, 900]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  version :thumb do
    process resize_to_limit: [600, 600]
  end
  
  version :thumb300 do
    process resize_to_fill: [300, 300, "Center"]
  end
  
  version :thumb100 do
    process resize_to_fill: [100, 100, "Center"]
  end
  
  version :thumb60 do
    process resize_to_fill: [60, 60, "Center"]
  end
  
  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end
  
  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  def filename
    "#{secure_token}.#{file.extension}" if original_filename.present?
  end
  
  protected
  def secure_token
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.uuid)
  end
end
