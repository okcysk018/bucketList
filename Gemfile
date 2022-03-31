source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.4', '>= 5.2.4.2'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.4.4', '< 0.6.0'
# Use Puma as the app server
gem 'puma', '~> 4.3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :production do
  gem 'unicorn', '5.4.1'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capistrano'
  gem 'capistrano-rbenv'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano3-unicorn'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'                  # RspecなどでRailsをプリロードする
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'rails-erd'               # モデルのER図をPDF出力
  gem 'rails_best_practices', require: false # Railsのベストプラクティスを教えてくれる
  gem 'annotate'                # テーブル情報をモデルファイルに追記
  gem 'bullet'                  # N+1問題検知
  gem 'rubocop', require: false # コード解析
  # gem 'guard'                # ファイルの変更を監視して作業を自動化 ※bundlerを使わないほうがいいためコメントアウト
  # gem 'guard-rspec'            # ファイルが変更されたらRsepcを自動実行
  # gem 'guard-livereload'       # ファイルが変更されたらページを自動リロード

  # debug
  gem 'better_errors'           # エラー画面を見やすくする
  gem 'binding_of_caller'       # better_errorsのエラー画面でREPLが使える
  gem 'pry-rails'               # binding pry
  gem 'pry-byebug'              # pryでデバックコマンドが使える
  gem 'tapp'                    # プリントデバッグがしやすくなる
  gem 'awesome_print'           # プリントデバッグの出力を整形
  gem 'hirb'                    # SQLの結果を見やすく整形してくれる
  gem 'hirb-unicode'            # hirbの日本語対応

  gem 'capistrano-git-copy', require: false
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
  gem 'rspec'                  # テストツール
  gem 'rspec-rails'            # RailsでRspecが使える
  gem 'factory_girl_rails'     # テストデータの生成
  # gem 'database_cleaner'       # テスト実行後にDBをクリア
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'font-awesome-sass', '~> 5.13.0'
# gem "font-awesome-rails"
gem "devise"
gem 'acts-as-taggable-on', '~> 6.0'
gem 'bootstrap', '~> 4.4.1'
gem 'jquery-ui-rails'
gem 'jquery-rails'
gem 'gon'               # rubyからjsに変数を渡す
gem 'carrierwave'       # 画像アップロード
gem 'mini_magick'       # 画像編集（リサイズなど）
gem 'fog-aws'           # S3対応
# gem 'dropzonejs-rails'
# gem 'geocoder'
# gem 'gmaps4rails'
gem 'jquery-turbolinks' # turbolinksとgoogleMapの競合回避
gem 'kaminari'          # ページネーション
gem 'ransack'           # 検索機能簡易実装
gem 'chart-js-rails'
