CarrierWave.configure do |config|
    if Rails.env.development?                                                                                                                   
        CarrierWave.configure do |config|
            config.asset_host = 'http://localhost:3000'
        end 
      elsif Rails.env.test?
        CarrierWave.configure do |config|
            config.asset_host = 'http://localhost:3000'
        end 
      else
        CarrierWave.configure do |config|
            config.fog_credentials = {
                provider: 'AWS',
                aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
                aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
                region: ENV['AWS_REGION']
              }
            
              config.fog_directory  = ENV['AWS_S3_BUCKET']
              config.cache_storage = :fog
        end 
      end
  end