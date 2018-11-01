# # fog setting
# if Rails.env == 'production'
#   CarrierWave.configure do |config|
#     config.fog_provider = 'fog/aws'
#     config.fog_credentials = {
#       provider: 'AWS',
#       aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
#       aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
#       region: 'ap-northeast-1'
#     }
#     config.fog_directory = ENV['AWS_BUCKET']
#     config.asset_host = 'https://s3.ap-northeast-1.amazonaws.com/' + ENV['AWS_BUCKET']
#   end
# end

# # ftp setting
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

# # sftp setting
if Rails.env == 'production'
  CarrierWave.configure do |config|
    config.sftp_host = ENV['FTP_HOST']
    config.sftp_user = ENV['FTP_USER']
    config.sftp_folder = ENV['FTP_PATH']
    config.sftp_url = ENV['FTP_URL']
    config.sftp_options = {
      :password => ENV['FTP_PASS'],
      :port => 22
    }
  end
end

module CarrierWave
  module MiniMagick
    def fix_exif_rotation
      manipulate! do |img|
        img.auto_orient
        img = yield(img) if block_given?
        img
      end
    end
  end
end