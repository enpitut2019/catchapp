CarrierWave.configure do |config|
    # if Rails.env.development? or Rails.env.test?
    #   config.asset_host = 'http://localhost:3000'
    # end
  

    if Rails.env.production?
      # 本番環境であればAWS周りの設定をする
      config.fog_credentials = {
        provider: 'AWS',
        aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
        aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
        region: ENV['AWS_REGION'],
      }
    
      config.fog_directory  = ENV['AWS_S3_BUCKET']
      config.cache_storage = :fog
    else
      # ローカル・テスト環境であればAWSの設定はスキップ
      # キャッシュ先ｇはローカルに設定する
      config.cache_storage = :file
    end
  end