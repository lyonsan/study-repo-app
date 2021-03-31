![](/app/assets/images/app-landing.jpeg)
# 🖊️ StudyReportとは
本アプリケーションでは学習のアウトプットを行うプラットフォームを提供しています。
具体的には下記の機能を実装しています。
- 学習項目別メモ書き機能
- 仲間との一日の学習報告ルーム機能
- 学習に関する記事投稿機能

# 🔗 URL
http://18.176.46.136/


## テスト用アカウント
1. メールアドレス:test@test.com  パスワード:111aaa
2. メールアドレス:tester@com  パスワード:111aaa


# 🖊️ 利用方法
### 1. ログインする
本アプリのサービスの多くはログインしていただくことで利用できるようになります。
ランディングページのヘッダーリンク「Start」をクリックしていただき、画面最下部に移動すると、「ログイン」または「新規登録」へのリンクがあります。
そちらからログイン/新規登録を行ってください。
（注）記事の閲覧、ユーザー検索等ログインしていなくてもできる機能もあります。

### 2. 学習報告をする
一つ目の機能は「仲間との学習報告」です。
#### 2-1. 学習報告ルーム作成
まずは仲間と学習報告を行うための部屋を作成します
![](/public/images/create_room.gif)
#### 2-2. 学習報告実施
ルーム内で学習報告を実施できます。
![](/public/images/create_report.gif)

### 3. メモを作成する
二つ目の機能は「メモ作成」です。
#### 3-1. カテゴリ作成
メモをカテゴリ分けして保存できます。まずはカテゴリを作成します。
![](/public/images/create_subject2.gif)
#### 3-2. メモ作成
カテゴリ内でメモを作成します。作成したメモは検索することも可能です。
![](/public/images/create_memo2.gif)

### 4. 記事を作成する
記事を作成し、公開することができます。
#### 4-1. 記事作成
記事を作成します。
![](/public/images/create_article2.gif)
#### 4-2. 記事検索
記事を検索できます。フリーワード検索だけでなく、学習カテゴリー検索、タグ検索も可能です。
![](/public/images/search_article.gif)

# ❓ 作成の背景
本アプリでは`仲間に学習内容を報告すること`　`学習中の学び、気付きを明文化して記録すること`　`学びを全てのユーザーにむけて発信すること`
この3つのアウトプットを行える環境を用意しています。
様々なアウトプットが可能な環境を一つのアプリで実現することで、独学でスキルや資格を取得しようと挑戦する社会人を支援したいと思い作成しました。

# 🔧 ローカルでの動作方法
```
$ git clone https://github.com/lyonsan/study-repo-app.git
```

# 📝 その他
### ライセンス
MIT
### 作者
<p><a href="https://github.com/lyonsan" target="_blank">GitHub</a></p>
<p><a href="https://twitter.com/miro_prog_" target="_blank">Twitter</a></p>
<p><a href="https://miro-p-site.netlify.app/" target="_blank">ポートフォリオサイト</a></p>
<p><a href="https://qiita.com/lyonsan" target="_blank">Qiita</a></p>


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

### likes テーブル
| Column             | Type            | option                         |
| ------------------ | --------------- | ------------------------------ |
| user               | references      | foreign_key: true              |
| article            | references      | foreign_key: true              |

#### Association
- belongs_to :user
- belongs_to :article
