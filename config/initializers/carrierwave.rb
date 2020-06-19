unless Rails.env.development? || Rails.env.test?
  # CarrierWave.configure do |config|
  #   config.asset_host = 'https://s3.amazonaws.com/gsimage'
  #   config.fog_credentials = {
  #     provider: 'AWS',
  #     aws_access_key_id: 'AKIATLKQBI5SFVKEAGMI',
  #     aws_secret_access_key: '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',
  #     region: 'ap-northeast-1'
  #   }
  #   config.fog_public = false 
  #   config.fog_directory  = 'gsimage'
  #   config.cache_storage = :fog
  # end
  CarrierWave.configure do |config|
    config.asset_host = 'http://localhost:3000'
  end
    # config.asset_host = 'https://game-share-api.herokuapp.com'
end