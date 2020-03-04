# アプリケーション概要
生産性を高めるノウハウやちょっとした工夫、裏技などの生活に役立つライフハック術を投稿、共有するアプリケーション
aaaaaa
## 実装機能
  - ユーザー管理機能(ユーザー登録/ログイン/ログアウト)
  - 投稿機能/編集機能
  - 投稿一覧閲覧機能
  - 投稿詳細機能
  - 投稿保存機能(Pin機能)
  - キーワード検索機能/カテゴリー別検索機能
  - コメント機能
  - 非同期通信機能
  - ユーザーマイページ(投稿一覧/保存一覧)
  - ページネーション機能
  - 画像アップロード機能
  - いいね機能
  - google analytics

# 使用技術一覧
|種別|名称|
|------|----|
|開発言語|Ruby(ver.2.5.1)|
|マークアップ|HTML|
|フロントエンド|JavaScript(jquery)|
|DB|MySQL|
|本番環境|AWS EC2|
|Webサーバー|Nginx|
|Applicationサーバー|Unicorn|
|画像アップロード|carrierwave|
|自動デプロイ|capistrano|
|ユーザー管理|devise|

# データベース

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|password|string|null: false|
|email|string|null: false|
|image|string|

### Association
  - has_many :article
  - has_many :pins
  - has_many :comments
  - has_many :pined_articles, through: :pins, source: :article
  
## articlesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|title|string|null: false|
|text|text|null: false|
|image|string|null: false|
|category|string|null: false|

### Association
  - belongs_to :user
  - has_many :comments
  - has_many :pins
  - has_many :pined_users, through: :pins, source: :user
  - has_many :image

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|article_id|integer|null: false, foreign_key: true|
|text|text|null: false|

### Association
  - belongs_to :user
  - belongs_to :article

## imageテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|article_id|integer|null: false, foreign_key: true|
|iamge|string|null: false|

### Association
  - belongs_to :user
  - belongs_to :article

## pinsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: :true|
|article_id|integer|null: false, foreign_key: :true|

### Association
  - belongs_to :user
  - belongs_to :article
  - validates_uniqueness_of :article_id, scope: :user_id
  