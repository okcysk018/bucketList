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

## 実装予定機能

- 検索機能
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

## DEMO
![demo](https://github.com/okcysk018/bucketList/blob/master/app/assets/images/bucketlist_intro.gif)

# 使用技術
### ■言語
バックエンド Ruby 2.5.1

フロントエンド jquery-rails 4.3.5
### ◼︎フレームワーク
Ruby on Rails 5.2.4.2
### ◼︎データベース
MySQL 0.5.3
### ◼︎インフラ
AWS EC2
AWS S3
### デプロイ
Capistranoによる自動デプロイ

# DB設計
![](https://i.gyazo.com/b76b14aecb50da168420844e814bc62f.png)

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
