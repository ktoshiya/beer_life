# BeerLife

ビール好きのための、写真共有サービスです。

<https://beer-life.info/>
※ELBを使用し、SSL化を行なっています。

## デモアカウント

```md
メールアドレス:test@test.com
パスワード:password
```
  
## 機能と使用技術

- AWS
  - EC2(AmazonLinux2,Nginx,Unicorn)
  - RDS for Postgresql
  - S3
  - SES
  - Route53
  - ELB
  - ACM
  - VPC
- 単体・統合テスト(RSpec, factory_bot, capybara)
- データベース(PostgreSQL)
- 画像アップロード(Amason S3, carrierwave, mini_magick, aws-fog)
- ページネーション(kaminari)
- 検索(ransack)
- デザイン(Bootstrap4) 
- ログイン認証機能(devise)
- パスワードリセット機能
- ユーザー関連（フォロー・フォロワー）
- いいね機能

## 環境

- 言語(Ruby 2.6.3)
- フレームワーク(Rails 5.2.3) 
- Sass
- Slim
- 開発(rbenv)
- Docker
- circleci
- GitHub
- テキストエディタ(VScode,vim)
