unless Rails.env.development? || Rails.env.test?
  CarrierWave.configure do |config|
    config.asset_host = 'https://game-share-api.herokuapp.com'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: 'AKIATLKQBI5SFVKEAGMI',
      aws_secret_access_key: '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',
      region: 'ap-northeast-1'
    }

    config.fog_directory  = 'gsimage'
    config.cache_storage = :fog
  end
# else
#   CarrierWave.configure do |config|
#     config.asset_host = 'http://localhost:3000'
#     # config.asset_host = 'https://game-share-api.herokuapp.com'
end