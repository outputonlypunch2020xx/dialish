## users テーブル

| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| name        | string | null: false |
| email       | string | null: false |
| password    | string | null: false |


has_many :diaries
has_many :comments
has_many :favorites

## diaries テーブル

| Column     | Type       | Options     |
| ---------- | -----------| ----------- |
| diary_text | text       | null: false |
| title      | string     | null: false |
| user       | references |             |

belongs_to :user
has_many :comments
has_many :favorites


## comments テーブル

| Column         | Type       | Options     |
| -------------- | ---------- | ----------- |
| comment_text   | text       | null: false |
| user           | references |             |
| diary          | references |             |

belongs_to :user
belongs_to :diary

## favorites テーブル

| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| user       | references |             |
| diary      | references |             |

belongs_to :user
belongs_to :diary