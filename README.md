# BeerLife

ビール好きのための、写真共有サービスです。

<http://beerlife.info/>

## デモアカウント

```md
メールアドレス:test@test.com
パスワード:password
```
  
## 機能と使用技術

- インフラ(AWS,EC2(Nginx,Unicorn),RDS)
- 単体・統合テスト(RSpec, factory_bot, capybara)
- データベース(PostgreSQL)
- 画像アップロード(Amason S3, carrierwave, mini_magick, fog)
- ページネーション(kaminari)
- 検索(ransack)
- デザイン(Bootstrap4) 
- ログイン認証機能(devise)
- ユーザー関連（フォロー・フォロワー）
- いいね機能

## 環境

- 言語(Ruby 2.6.3)
- フレームワーク(Rails 5.2.3) 
- 開発(rbenv)
- Docker
- circleci
- テキストエディタ(VScode,vim)
