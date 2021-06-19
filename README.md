# The-View
 ユーザーは飲食店を探したり、口コミ投稿やお気に入り保存ができます。また、店舗側は店舗情報充実や口コミへの返信ができるアプリです。
<img width="1000" src="https://user-images.githubusercontent.com/64394899/119135427-584a3700-ba79-11eb-9dbb-e1b10db9886e.png">
<img width="600" alt="スクリーンショット 2021-05-21 21 17 49" src="https://user-images.githubusercontent.com/64394899/119136152-47e68c00-ba7a-11eb-89f0-e8f629025407.png">
<img width="600" alt="スクリーンショット 2021-05-21 21 18 22" src="https://user-images.githubusercontent.com/64394899/119136156-4917b900-ba7a-11eb-9ab4-d21a57c7f84e.png">
<img width="600" alt="スクリーンショット 2021-05-21 21 19 06" src="https://user-images.githubusercontent.com/64394899/119136162-4ae17c80-ba7a-11eb-8ed9-fb4d823fd978.png">

ユーザー側
- 登録してある飲食店を検索できる
- 飲食店への口コミを点数付きで投稿・編集・削除できる
- お気に入りのお店、行ってみたいお店をマイページで管理できる

店舗側
- メニューやお店のこだわり・思いを公開できる
- 店舗情報充実
- 口コミへの返信



# URL
 https://buzz-recipe.herokuapp.com/users/sign_in
 <br >
画面中部のゲストログインボタンから、メールアドレスとパスワードを入力せずにログインできます。
# 使用技術
- Ruby 2.7.2
- Ruby on Rails 6.0.3.5
- MySQL 5.6.47
- jQuery 4.4.0
- HEROKU

# アプリを制作しようと思った背景
  現在、コロナ禍において想像以上の飲食店が潰れています。どのお店も大変だと思いますが、特に高齢の方達が経営されている町の食堂(一般的には町中華などと言われているような飲食店）の手助けができればと思い制作し始めました。お店の店主さんの多くが朝６時から夜の１２時まで休みなく働らいているような状況です。中には旦那さんを亡くし一人きりで切り盛りする７０代の女性さんなどもいらっしゃいます。ご高齢の方が多く、ツイッターやインスタグラムやTikTokなどのSNSツールさえ知らず、広告をする手段など持っていません。広告するツールを知っていても使い方がからないで困っていたりもします。ただ一人でも来てくれるお客様がいるからと、儲けなどなど考えずに毎日営業なさっています。このような状況はこのコロナ禍でさらに深刻なものとなっています。

  

# 目標としている機能一覧
- 新規登録機能（ユーザー・店舗）
- ログイン・ログアウト機能
- 検索機能（キーワード・エリア・料理の種類）
- 口コミ投稿・編集・削除機能
- お気に入りリスト、行ってみたいリストへの登録・削除機能
- 検索結果、レビュー、お気に入りリストの並び替え機能
- マイページ機能
- 店舗管理機能
- ページネーション機能

# 実装済みの機能一覧
- 新規登録機能（ユーザー）
- ログイン・ログアウト機能
- ページネーション機能

# これから実装したいこと
- 検索機能（キーワード・エリア・料理の種類）
- 口コミ投稿・編集・削除機能
- お気に入りリスト、行ってみたいリストへの登録・削除機能
- 検索結果、レビュー、お気に入りリストの並び替え機能
- マイページ機能
- 店舗管理機能
- テスト機能
  - 単体テスト
  - 機能テスト
  - 統合テスト
- AWSへのデプロイ
- HTML/CSS
  - ビューの修正
  - React(SPAの導入)
  - レスポンシブデザイン
- CI/CDの導入
- Docker/Docker-composeの導入

#  拘りたいポイント
- 検索機能
  - このアプリでは、なるべくクリック一つで検索できるようにしたいです。ユーザーは入力する手間を嫌うからです。それは多くのECサイトのデザインなどを研究したりサイト制作について検索したところそのようの記事をいくつか目にしました。また、UI/UXはシンプルすぎても作り込みすぎてもいけない、そうした学習経験から検索機能に拘りたいです。また、飲食をテーマとしていますが、ショッピングサイトなどのECサイトを利用してストレスを感じる大きな要因が、目的の物が検索し辛いためです。UI/UXなどにおいて直感的に検索しやすいアプリを目指します。
- 店舗管理機能
  - 店舗の情報を入力する人を60代と仮定して、高齢の方でも扱えられるように工夫したいです。これいついては、アイデアが浮かんでいませんが一番力を入れたいと考えています。
- テスト機能
  - 実際の業務を想定して、テストコードを実装したいと考えています。バックエンドエンジニアとして業務に携わりたいので、APIの深掘りを強化したいです。

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|encrypted_password|string|null: false|
|icon|string|

### Association
- has_many :comments, dependent: :destroy
- has_many :likes, dependent: :destroy

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|post_id|string|null: false|
|user_id|string|null: false|

### Association
- belongs_to :user
- belongs :shop_admin

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|post_id|string|null: false|
|user_id|string|null: false|

### Association
- belongs_to :user
- belongs_to :shop_admin

## shop_adminsテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false, unique: true|
|encrypted_password|string|null: false|

### Association
- has_many :posts, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :likes
- has_many :shop_infos, dependent: :destroy
- has_many :shop_hours, dependent: :destroy
- has_many :shop_commitments: :dependent: :destroy
- has_one :photo, dependent: :destroy


## postsテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|caption|string|
|price|string|
|shop_admin_id|string|null: false|

### Association
- belongs_to :shop_admin
- has_many :photos, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :comments, dependent: :destroy

## photosテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|post_id|null: false|
|user-id|string|null: false|
|shop_admin_id|string|null: false|
|shop_commitment_id|string|null: false|
### Association
- belongs_to :shop_admin
- belongs_to :user
- belongs_to :post

## shop_infosテーブル
|Column|Type|Options|
|------|----|-------|
|store_name|string|null: false|
|address|string|
|email|string|
|phone_number|
|caption|string|
shop_admin_id|string|null: false|

### Association
- belongs_to :shop_admin

## shop_hoursテーブル
|Column|Type|Options|
|------|----|-------|
|sun|string|
|mon|string|
|tues|string|
|wedens|string|
|thurs|string|
|fri|string|
|satur|string|
|sun_start_at|string|
|mon_start_at|string|
|tues_start_at|string|
|wedens_start_at|string|
|thurs_start_at|string|
|fri_start_at|string|
|satur_start_at|string|
|sun_start_at|string|
|mon_end_at|string|
|tues_end_at|string|
|wedens_end_at|string|
|thurs_end_at|string|
|fri_end_at|string|
|satur_end_at|string|

### Association
- belongs_to :shop_admin

## shop_commitmentsテーブル
|Column|Type|Options|
|------|----|-------|
|commnet|string|null: false|
|shop_admin_id|string|null: false|

### Association
- belongs_to :shop_admin
- has_one :photo
