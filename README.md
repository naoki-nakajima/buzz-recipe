# The-View
 料理の写真、レシピの投稿サイトです。<br >
 レスポンシブ対応しているのでスマホからもご確認いただけます。
 <img width="1400" alt="" src="">
 <img width="350" height="700" src="">
# URL
 https://git.heroku.com/buzz-recipe.git
 <br >
画面中部のゲストログインボタンから、メールアドレスとパスワードを入力せずにログインできます。
# 使用技術
- Ruby 2.7.2
- Ruby on Rails 6.0.3.5
- MySQL 5.6.47
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
