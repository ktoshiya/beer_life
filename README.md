# BeerLife

ビール好きのための、写真共有サービスです。

<https://beerlife.herokuapp.com/>

## デモアカウント

```md
メールアドレス:test@test.com
パスワード:password
```
  
## 機能と使用技術

- インフラ(Heroku)
- 単体・統合テスト(RSpec, factory_bot, capybara)
- データベース(PostgreSQ)
- 画像アップロード(Amason S3, carrierwave, mini_magick, fog)
- ページネーション(kaminari)
- 検索(ransack)
- デザイン(Bootstrap) 
- ログイン認証機能(devise)
- ユーザー関連（フォロー・フォロワー）
- （未実装）いいね機能

## 環境

- 言語(Ruby 2.6.3)
- フレームワーク(Rails 5.2.3) 
- 開発(rbenv)
- テキストエディタ(vim)
