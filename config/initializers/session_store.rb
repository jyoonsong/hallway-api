if Rails.env === 'production' 
    Rails.application.config.session_store :cookie_store, key: '_minglr', domain: 'https://minglr.io'
  else
    Rails.application.config.session_store :cookie_store, key: '_minglr' 
  end