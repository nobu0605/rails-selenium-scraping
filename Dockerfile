FROM ruby:3.2

# 必要なライブラリをインストール
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs \
  yarn \
  chromium-driver \
  curl

# Node.jsをインストール
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - && apt-get install -y nodejs

# 作業ディレクトリの設定
WORKDIR /app

# GemfileとGemfile.lockをコピー
COPY Gemfile Gemfile.lock ./

# Bundlerのインストール
RUN gem install bundler && bundle install

# アプリケーションコードをコピー
COPY . .

# デフォルトコマンド
CMD ["rails", "server", "-b", "0.0.0.0"]
