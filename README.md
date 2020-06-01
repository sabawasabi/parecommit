# PareCommit

## 概要
- 趣味や勉強、達成したい目標で同志とマッチング
- 目標設定やペナルティを経て、目標を達成を補助

## 本番環境
- URL:http://parecomit.herokuapp.com/
- テストアカウント
  - mail:test_user01@test.com
  - pass:password01

## 制作背景
モチベーションの維持が出来ない、昔からの自分の悩みでした。<br>
目標や計画を立てた直後の熱心さが時間が立つと共に低下し、最終的には諦めてしまうことも多々ありました。<br>
この習慣を改善したいと書籍などで調べると、目標の設定は自分自身で決めるが、継続するための策やペナルティは<br>
他人に決めてもらうと他人との約束となるため継続しやすいと書かれていました。<br>
そこで、他人と目標を共有することを目的としたアプリを制作出来れば自分自身だけで無く、同じ悩みを持つ人の助け<br>
にもなると感じたことから本アプリの制作に取り掛かりました。

## DEMO
TOP<br>
["https://gyazo.com/3a75f0203e5bb82beb1b08e1b009817c"]<br>
目標設定
https://gyazo.com/a224515ee7b6329ae9afcbb39b3c59fe
目標リスト(自分の目標管理)
https://gyazo.com/a224515ee7b6329ae9afcbb39b3c59fe
目標検索(別のユーザの目標を検索、Pare作成)
https://gyazo.com/0a2735fe7909f82adb2e484fce6ea197
メッセージ画面
https://gyazo.com/cbcd85aef7a4309532589aa29616a679
https://gyazo.com/b488866474f033ce1e37738d9e292e3e

## 工夫したポイント
どの手順でマッチングしていくか、フローの流れを工夫した。<br>
当初はユーザーとユーザーのマッチングを行う想定で制作を開始したが、複数の目標を同じユーザーのマッチングを<br>
行いたい場合に機能の複雑化が必要になると感じた。<br>
そこで目標 - ユーザーでのマッチングとすることで目標単位での管理が行える様に修正を行い、同じユーザーの<br>
マッチングでも複数の目標を共有出来る様変更し、工数を減らした。

## 使用技術(開発環境)
- Ruby
- Ruby on Rails
- html
- MySQL
- Github
- heroku
- Visual Studio Code

## 課題や今後実装したい機能
- 目標達成補助のためのツール
  - ペナルティ設定機能
  - 進捗表の作成/管理
  - 課題達成したときのご褒美設定機能

## DB設計
### usersテーブル
|Column    |Type    |Options                    |
|----------|--------|---------------------------|
|nickname  |string  |null: false                |
|mail      |string  |null: false, unique: true  |
|password  |string  |null: false                |
|gender    |string  |null: false                |
|profile   |text    |                           |
|icon      |text    |                           |

#### Association
- has_many :targets
- has_many :matchs
- has_many :messages

### targetsテーブル
|Column       |Type        |Options                         |
|-------------|------------|--------------------------------|
|user_id      |references  |null: false, foreign_key: true  |
|target       |string      |null: false                     |
|explanation  |text        |null: false                     |
|Limit        |string      |null: false                     |
|status       |string      |null: false                     |

#### Association
- belongs_to :user
- has_many   :matchs

### matchsテーブル
|Column     |Type        |Options                         |
|-----------|------------|--------------------------------|
|target_id  |references  |null: false, foreign_key: true  |
|user_id    |references  |null: false, foreign_key: true  |

#### Association
- belongs_to :user
- belongs_to :target
- has_many   :messages

### messagesテーブル
|Column     |Type        |Options                         |
|----------|------------|--------------------------------|
|match_id  |references  |null: false, foreign_key: true  |
|user_id   |references  |null: false, foreign_key: true  |
|comment   |string      |null: false                     |

#### Association
- belongs_to :user
- belongs_to :match