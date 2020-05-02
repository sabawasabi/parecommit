PareCommit
===

気軽に共存

## Description
- 趣味や勉強、達成したい目標で同志とマッチング
- 目標設定やペナルティを経て、目標を達成を補助

# DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, unique: true|
|nickname|string|null: false|
|mail|string|null: false, unique: true|
|password|string|null: false|
|gender|string|null: false|
|profile|text||
|icon|text||

### Association
- has_many :targets
- has_many :matchings

## targetsテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, unique: true|
|user_id|references|null: false, foreign_key: true|
|target|string|null: false|
|explanation|text|null: false|
|Limited_time|string|null: false|
|status|string|null: false|

### Association
- belongs_to :user

## matchingsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|
|comment|string|null: false|

### Association
- belongs_to :user