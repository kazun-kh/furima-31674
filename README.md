# アプリケーション情報
## アプリケーション概要
## フリーマーケットのアプリケーションを作成しました。
## 接続先情報
## https://furima-31674.herokuapp.com/

- ID/Pass
- ID: admin
- Pass: 2222

### テスト用アカウント等
#### 購入者用
- メールアドレス: test@com
- パスワード: 12qwas

#### 購入用カード情報
- 番号：424242424242
- 期限：Tue Jan 28 2020 00:00:00 GMT+0900 (日本標準時)
- セキュリティコード：123

#### 出品者用
- メールアドレス名: xxx@com
- パスワード: 12qwas

## Githubリポジトリ
## https://github.com/kazun-kh/furima-31674

## 開発状況
### 開発環境
#### Ruby/Ruby on Rails/MySQL/Github/AWS/Visual Studio Code
##### 開発期間と平均作業時間
- 開発期間：11/10~12/1
- 1日あたりの平均作業時間：8
- 合計：170時間程度

### 動作確認方法
WebブラウザGoogle Chromeの最新版を利用してアクセスしてください。
ただしデプロイ等で接続できないタイミングもございます。その際は少し時間をおいてから接続してください。
接続先およびログイン情報については、上記の通りです。
同時に複数の方がログインしている場合に、ログインできない可能性があります。
テストアカウントでログイン→トップページから出品ボタン押下→商品情報入力→商品出品
確認後、ログアウト処理をお願いします。


### 最終課題を経ての気づき
- 工夫した点
しっかりと実装ごとにブランチを切り、コミットして何かエラーが出た際は何が原因だったのかを確認しました。
- 苦労した点
JavaScriptによる非同期通信で消費税を表示させるのが苦労しました。実際にどこのidを取得するか、エラーが多く出て詰まったところなので理解するまで学習し実装する事ができました。

# テーブル設計

## users テーブル

| Column               | Type   | Options     |
| ---------------------| ------ | ----------- |
| email                | string | null: false |
| encrypted_password   | string | null: false |
| nickname             | string | null: false |
| last_name            | string | null: false |
| first_name           | string | null: false |
| last_name_kana       | string | null: false |
| first_name_kana      | string | null: false |
| birth_date           | date   | null: false |


### Association

- has_many :items
- has_many :orders


## items テーブル

| Column    | Type       | Options                        
| ---------------------- | ---------- |------------------- |
| name                   | string     | null: false        |
| info                   | text       | null: false        |
| price                  | integer    | null: false        |
| user                   | references | foreign_key: true  |
| category_id            | integer    | null: false        |
| sales_status_id        | integer    | null: false        |
| shipping_fee_status_id | integer    | null: false        |
| prefecture_id          | integer    | null: false        |
| scheduled_delivery_id  | integer    | null: false        |


### Association

- has_one : order
- belongs_to :user


## orders テーブル

| Column   | Type       | Options           |
| -------- | ---------- | ----------------- |
| user     | references | foreign_key: true |
| item     | references | foreign_key: true |



### Association

- belongs_to :user
- belongs_to :item
- has_one : address


## addresses テーブル

| Column           | Type        | Options           |
| ---------------- | ----------- | ----------------- |
| postal_code      | string      | null: false       |
| city             | string      | null: false       |
| house_number     | string      | null: false,      |
| building_name    | string      |                   |
| phone_number     | string      | null: false       |
| prefecture_id    | integer     | null: false       |
| order            | references  | foreign_key: true |


### Association

- belongs_to :order