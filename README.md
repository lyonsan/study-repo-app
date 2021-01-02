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
本アプリをご利用頂く方は学習をされている方を想定していますが、学習する内容は人により様々で、ほとんどの人が複数の題材について学習されていると考えます
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
| job_genre_id       | integer         | null: false      |

#### Association

- has_many :room_users
- has_many :rooms, through: user_rooms
- has_many :reports
- has_many :subjects, through: user_subjects
- has_many :memos

### roomsテーブル

| Column             | Type            | option           |
| ------------------ | --------------- | ---------------- |
| title              | string          | null: false      |

#### Association

- has_many :user_rooms
- has_many :users, through: user_rooms
- has_many :reports

### user_rooms テーブル

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
| nickname           | string          | null: false                    |
| study-time         | time            | null: false                    |
| concentrated-time  | time            | null: false                    |
| good-way           | text            | null: false                    |
| achievement        | binary          | null: false                    |
| why_not            | text            |                                |
| tomorrow-plan      | text            | null: false                    |
| study-content      | text            | null: false                    |
| solution-proposal  | text            | null: false                    |

#### Association

- belongs_to :user
- belongs_to :room

### subjects テーブル

| Column             | Type            | option                         |
| ------------------ | --------------- | ------------------------------ |
| name               | string          | null: false                    |

#### Association

- has_many :user_subjects
- has_many :users, through: user_subjects
- has_many :memos

### user_subjects テーブル

| Column             | Type            | option                         |
| ------------------ | --------------- | ------------------------------ |
| user               | references      | null: false, foreign_key: true |
| subject            | references      | null: false, foreign_key: true |

#### Association

- belongs_to :user
- belongs_to :subject



## ローカルでの動作方法
- データベース: MySQL
- database.yml にて default: &defaultのencoding: utf8に変更
- app/javascript/packs/application.js にて require("turbolinks").start() を削除する
- .gitignore に .Ds_Store を追加する
