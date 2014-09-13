# To enable Bing translation, set `bing_available` to true and enter your bing credentials
# (replace `app_name` and `token`)

Rails.application.config.bing_available = false
Rails.application.config.bing_translator = BingTranslator.new('app_name', 'token', true, nil)
