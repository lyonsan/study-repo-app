# アプリケーション名: StudyReport

## アプリケーション概要
本アプリケーションでは学習のアウトプットを行うプラットフォームを提供しています。
具体的には下記の機能を実装しています。
- 学習項目別メモ書き機能
- 仲間との一日の学習報告ルーム機能

## URL

## テスト用アカウント

## 利用方法
サービスをご利用いただくにはユーザー登録＆ログインをしていただく必要があります。
ログインが完了されましたら、大きく2つの機能をご利用いただけます。
1つ目は「学習項目別のメモ書き」機能です。
本アプリをご利用頂く方は歯科プログラミングや資格等の学習をされている方を想定していますが、学習する内容は人により様々で、ほとんどの人が複数の題材について学習されていると考えます
本アプリではまず「学習項目」というものを作成いただき、その「学習項目」の中で、日々の学習でメモをしたい事項を書き残すことができます。
またお書きいただいたメモは一覧で表示されるようになっており、キーワード検索をすることでこれまでご自身が残されたメモを検索することができます
2つ目は「仲間との一日の学習報告ルーム」機能です。
学習内容を要約してアウトプットすること、他人の目があることで質の高い学習を継続していけると考えています。そのため本アプリには仲間と学習報告をし合える「学習報告ルーム」機能を用意しています。ルームを作成いただき、仲間を招待して毎日報告し合いましょう。報告は定型のフォーマットを用意しており、そのフォーマットに従ってご記入いただくことで質の高いアウトプットを行えます。

## 目指した課題解決
本アプリは自由度の高い投稿機能ではなく、敢えてフォーマットの決まった学習報告フォーマットのみのコミュニケーションとすることで、質の高いアウトプットを行わざるを得ない環境を作ることができます。

## 洗い出した要件

## 実装した機能についてのGIFと説明

## 実装予定の機能

## データベース設計
### usersテーブル

| Column             | Type            | option           |
| ------------------ | --------------- | ---------------- |
| email              | string          | null: false      |
| encrypted_password | string          | null: false      |
| nickname           | string          | null: false      |
| birthday           | date            | null: false      |
| study_genre_id     | integer         | null: false      |
| self_introduction  | text            |                  |

#### Association

- has_many :room_users
- has_many :rooms, through: :room_users
- has_many :reports
- has_many :subjects
- has_many :memos
- has_many :chat_users
- has_many :chats, through: :chat_users
- has_many :messages
- belongs_to_active_hash :study_genre

### roomsテーブル

| Column             | Type            | option           |
| ------------------ | --------------- | ---------------- |
| title              | string          | null: false      |
| purpose_room       | text            | null: false      |

#### Association

- has_many :room_users
- has_many :users, through: :room_users
- has_many :reports

### room_users テーブル

| Column             | Type            | option                         |
| ------------------ | --------------- | ------------------------------ |
| user               | references      | null: false, foreign_key: true |
| room               | references      | null: false, foreign_key: true |

#### Association

- belongs_to :user
- belongs_to :room

### reports テーブル

| Column             | Type            | option                         |
| ------------------ | --------------- | ------------------------------ |
| user               | references      | null: false, foreign_key: true |
| room               | references      | null: false, foreign_key: true |
| study_time         | time            | null: false                    |
| concentrated_time  | time            | null: false                    |
| good_way           | text            | null: false                    |
| achieved           | boolean         | null: false                    |
| go_wrong           | text            |                                |
| tomorrow_plan      | text            | null: false                    |
| study_content      | text            | null: false                    |
| advice             | text            | null: false                    |

#### Association

- belongs_to :user
- belongs_to :room

### subjects テーブル

| Column             | Type            | option                         |
| ------------------ | --------------- | ------------------------------ |
| user               | references      | null: false, foreign_key: true |
| name               | string          | null: false                    |
| purpose_subject    | text            |                                |


#### Association

- belongs_to :user
- has_many :memos

### memos テーブル

| Column             | Type            | option                         |
| ------------------ | --------------- | ------------------------------ |
| user               | references      | null: false, foreign_key: true |
| subjects           | references      | null: false, foreign_key: true |
| topic              | string          | null: false                    |
| point              | text            |                                |
| explanation        | text            |                                |

#### Association

- belongs_to :user
- belongs_to :subject

### chats テーブル

| Column             | Type            | option           |
| ------------------ | --------------- | ---------------- |
| theme              | string          |                  |

#### Association

- has_many :chat_users
- has_many :users, through: :chat_users
- has_many :messages

### chat_users テーブル

| Column             | Type            | option                         |
| ------------------ | --------------- | ------------------------------ |
| user               | references      | null: false, foreign_key: true |
| chat               | references      | null: false, foreign_key: true |

#### Association

- belongs_to :user
- belongs_to :chat

### messages テーブル

| Column             | Type            | option                         |
| ------------------ | --------------- | ------------------------------ |
| user               | references      | null: false, foreign_key: true |
| chat               | references      | null: false, foreign_key: true |
| content            | text            | null: false                    |

#### Association

- belongs_to :user
- belongs_to :chat

### articles テーブル
| Column             | Type            | option                         |
| ------------------ | --------------- | ------------------------------ |
| user               | references      | null: false, foreign_key: true |
| study_genre_id     | integer         | null: false                    |
| summary            | string          | null: false                    |
| detail             | string          | null: false                    |

#### Association
- belongs_to :user
- has_many :article_tag_relations
- has_many :tags, through: :article_tag_relations
- belongs_to_active_hash :study_genre

### tags テーブル
| Column             | Type            | option                         |
| ------------------ | --------------- | ------------------------------ |
| tag_name           | string          | null: false, uniqueness: true  |

#### Association
- has_many :article_tag_relations
- has_many :article, through: :article_tag_relations

### article_tag_relations テーブル
| Column             | Type            | option                         |
| ------------------ | --------------- | ------------------------------ |
| article            | references      | foreign_key: true              |
| tag                | references      | foreign_key: true              |

#### Association
- belongs_to :article
- belongs_to :tag


## ローカルでの動作方法
- データベース: MySQL
- ユーザー登録で使用したパッケージ: devise
- database.yml にて default: &defaultのencoding: utf8に変更
- app/javascript/packs/application.js にて require("turbolinks").start() を削除する
- .gitignore に .Ds_Store を追加する
