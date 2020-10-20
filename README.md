# README

## アプリ名
bucketList

## アプリケーション概要
タスク管理共有アプリ

## 機能一覧
## 実装済機能
- ユーザー登録、ログイン機能
- タスク投稿機能
- コメント機能
- 画像投稿機能
- サブタスク管理機能
- GoogleMapAPI
- 検索機能

## 実装予定機能
- カレンダー連携機能
- ユーザフォロー機能
- コミュニティ機能
- いいね機能
- SNS連携機能
- 予実管理機能
- 管理者機能
- アカウント管理機能
- 動画投稿機能
- その他

## 本番環境(デプロイ先　テストアカウント＆ID)
デプロイURL：　         http://54.238.83.189/

テストアカウントID/PASS：  post@email.com / pppppppp

## 制作背景(意図)
アプリ名のbucketListとは「死ぬまでにやりたい事リスト」という意味です。

「死ぬまでにやりたい事リスト」をみんなで共有して、人生を豊かにしたい、という思いで作成しました。

## Feature
### トップページ
<p align="center">
  <a href="01_top_page"><img src="https://user-images.githubusercontent.com/60644410/96550078-5bb2ef80-12eb-11eb-8c52-170ee5f364e2.png" width="500px;"/></a>
</p>

### 検索画面
無限スクロール、フィルター、ソート機能
![02_search_compressed](https://user-images.githubusercontent.com/60644410/96558026-0d571e00-12f6-11eb-82f3-cee6cbc3c02b.gif)
### ユーザマイページ
![03_my_page](https://user-images.githubusercontent.com/60644410/96550283-9e74c780-12eb-11eb-808b-9d3176356228.png)
### 新規投稿/投稿編集画面
![04_post](https://user-images.githubusercontent.com/60644410/96550299-a3d21200-12eb-11eb-85cf-8bf4ec3465c4.png)
### 投稿詳細画面
![05_post_show](https://user-images.githubusercontent.com/60644410/96550314-aaf92000-12eb-11eb-846f-9a1a8ddc6ce7.png)

# 使用技術
### ■言語
バックエンド Ruby 2.5.1

フロントエンド jquery-rails 4.3.5
### ■フレームワーク
Ruby on Rails 5.2.4.2
### ■データベース
MySQL 0.5.3
### ■インフラ
AWS EC2

AWS S3
### ■デプロイ
Capistrano

# DB設計
![erd](https://github.com/okcysk018/bucketList/blob/master/erd.png)

## usersテーブル

|Column|Type|Options|
|------|----|-------|
| nickname | string | null: false|
| email | string | null: false, unique: true |
| password | string | null: false |

### Association
- has_many :posts, dependent: :destroy
- has_many :comments, dependent: :destroy

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
| text | text | null: false|
| post_id |references|null: false, foreign_key: true|
| user_id |references|null: false, foreign_key: true|

### Association
- belongs_to :post
- belongs_to :user

## postsテーブル

|Column|Type|Options|
|------|----|-------|
| title | string | null: false, add_index |
| description | text |  |
| deadline | date | null: false |
| address | string |  |
| place_id | string |  |
| reputation | integer |  |
| priority | integer |  |
| budget | integer | null: false |
| done_flag | boolean |  |
| private_flag | boolean |  |
| user_id |references|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_many :images
- has_many :tasks, dependent: :destroy
- has_many :comments, dependent: :destroy

## imagesテーブル

|Column|Type|Options|
|------|----|-------|
| image | string | null: false |
| post_id |references|null: false, foreign_key: true|

### Association
- belongs_to :post

## tasksテーブル

|Column|Type|Options|
|------|----|-------|
| title | string | null: false |
| deadline | date | null: false |
| done_flag | boolean |  |
| post_id |references|null: false, foreign_key: true|

### Association
- has_many :posts
