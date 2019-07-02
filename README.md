# BeerLife

ビール好きのための、写真共有サービスです。
<https://beer-life.info/>

## デモアカウント

```md
メールアドレス:test@test.com
パスワード:password
トップページからテストユーザーボタンでもログインできます。
```
  
## 機能と使用技術

- AWS
  - Route53
  - ACM
  - ALB
  - VPC
  - EC2(AmazonLinux,Nginx,Unicorn)
  - RDS for Postgresql
  - S3
  - SES
- 単体・統合テスト(RSpec, factory_bot, capybara)
- データベース(PostgreSQL)
- 画像アップロード(Amason S3, CarrierWave, Mini_Magick, aws-fog)
- ページネーション(kaminari)
- 検索(ransack)
- デザイン(Bootstrap4, Font Awesome) 
- ログイン認証機能(devise)
- パスワードリセット機能
- ユーザー関連（フォロー・フォロワー）
- いいね機能
- 退会機能

## 環境

- 言語(Ruby 2.6.3)
- フレームワーク(Rails 5.2.3) 
- Slim,Sass
- Docker
- Circleci
- GitHub
- テキストエディタ(VScode,vim)
