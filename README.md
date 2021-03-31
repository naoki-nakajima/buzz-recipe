# The-View
 料理の写真、レシピの投稿サイトです。
<img width="1000" src="https://user-images.githubusercontent.com/64394899/113078815-d115db00-920e-11eb-9907-346157f2132f.png">
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

<!--# AWS構成図-->

<!--## Travis CI/CD
- Githubへのpush時に、RspecとRubocopが自動で実行されます。
- masterブランチへのpushでは、EC2への自動デプロイが実行されます
- masterブランチへのpushでは、RspecとRubocopが成功した場合、EC2への自動デプロイが実行されます
-->
# 機能一覧
- ユーザー登録、ログイン機能(devise)
- 投稿機能
  - 画像投稿(carrierwave)
- ダグ機能(cocoon)
- いいね機能(Ajax)
- コメント機能(Ajax)
<!-- - フォロー機能(Ajax) 
- ページネーション機能(kaminari)
  - 無限スクロール(Ajax)
- 検索機能(ransack)
# テスト
 - RSpec
  - 単体テスト(model)
  - 機能テスト(request)
  - 統合テスト(f
-->

# これから実装したいこと(優先順)
- 検索機能
- テスト機能
  - 単体テスト
  - 機能テスト
  - 統合テスト
- フォロー機能(Ajax) 
- ページネーション機能(kaminari)
  - 無限スクロール(Ajax)
- 投稿されているコメントに対してメンションをつけてコメントを返す機能
- AWSへのデプロイ
- HTML/CSS
  - ビューの修正
  - React(SPAの導入)
- CI/CDの導入
- Docker/Docker-composeの導入

#  拘りたいポイント
- 検索機能
  - このアプリでは、ジャンル、食材、ユーザー、タグなど多角的に検索できるようにしたいです。料理をテーマとしていますが、ショッピングサイトなどのECサイトを利用してストレスを感じる大きな要因が、目的の物が検索し辛いためです。また、UI/UXなどにおいても直感的に検索しやすいアプリを目指します。
  - オリジナルの機能としては、レシピにある調味料の配合などから、甘い、しょっぱいなど味に関する情報を定量化したいです。そして、甘い、しょっぱいとから検索できれば良いなと考えています。なぜなら。実際に作ってみないとその味が自分にあっているのかわかりにくいと感じることが多々あるためです。
- テスト機能
  - 実際の業務を想定して、テストコードを実装したいと考えています。バックエンドエンジニアとして業務に携わりたいので、APIの深掘りを強化したいです。
