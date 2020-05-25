# PareCommit
===

## 気軽に共存

### 概要
- 趣味や勉強、達成したい目標で同志とマッチング
- 目標設定やペナルティを経て、目標を達成を補助

### 本番環境
- URL:http://parecomit.herokuapp.com/
- テストアカウント
  - mail:
  - pass:

### 制作背景
- モチベーションの維持が出来ない、昔からの自分の悩みでした。
- 目標や計画を立てた直後の熱心さが時間が立つと共に低下し、最終的には諦めてしまうことも多々ありました。
- この習慣を改善したいと書籍などで調べると、目標の設定は自分自身で決めるが、継続するための策やペナルティは
- 他人に決めてもらうと他人との約束となるため継続しやすいと書かれていました。
- そこで、他人と目標を共有することを目的としたアプリを制作出来れば自分自身だけで無く、同じ悩みを持つ人の助け
- にもなると感じたことから本アプリの制作に取り掛かりました。

### DEMO

### 工夫したポイント
- どの手順でマッチングしていくか、フローの流れを工夫した。
- 当初はユーザーとユーザーのマッチングを行う想定で制作を開始したが、複数の目標を同じユーザーのマッチングを行いたい
- 場合に機能の複雑化が必要になると感じた。
- そこで目標 - ユーザーでのマッチングとすることで目標単位での管理が行える様に修正を行い、同じユーザーのマッチング
- でも複数の目標を共有出来る様変更し、工数を減らした。

### 使用技術(開発環境)
- Ruby
- Ruby on Rails
- html
- MySQL
- Github
- heroku
- Visual Studio Code

### 課題や今後実装したい機能
- 目標達成補助のためのツール
  - ペナルティ設定機能
  - 進捗表の作成/管理
  - 課題達成したときのご褒美設定機能


### DB設計
#### usersテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, unique: true|
|nickname|string|null: false|
|mail|string|null: false, unique: true|
|password|string|null: false|
|gender|string|null: false|
|profile|text||
|icon|text||

##### Association
- has_many :targets
- has_many :matchings

#### targetsテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, unique: true|
|user_id|references|null: false, foreign_key: true|
|target|string|null: false|
|explanation|text|null: false|
|Limit|string|null: false|
|status|string|null: false|

##### Association
- belongs_to :user

#### matchingsテーブル
|Column|Type|Options|
|------|----|-------|
|target_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|
|comment|string|null: false|

##### Association
- belongs_to :user