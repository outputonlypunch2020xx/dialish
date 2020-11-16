# Dialish
"Dialish"は、英語日記を投稿するサービスです。
Dialishで英語日記を投稿して日常に英語を取り込もう！

# Features
"Dialish"は、英語日記専用の投稿サイト。
英語日記専用とすることで、英語で書くことに集中できます。
また、他のユーザーも同じように英語日記を投稿しているので、
それらを参考にして、自分も英語日記を書けるようになります。
また、いいね機能やコメント機能などを通して、継続する力、質問する力などを養えます。
さらにマイページにて、自分がどれくらい日記を書いてきたかを視覚化できるグラフが搭載されており、
モチベーションにもつながります。

# 目指した課題解決	
英語を日記で学習しいた人が、お互いの日記を参考にしながら学習を継続できる環境。

# 要件定義
ユーザー登録機能、日記投稿機能、画像投稿機能、リッチテキスト機能、いいね機能、コメント機能、SNS認証機能、グラフ機能、ユーザー詳細情報画面

# URL
https://dialish.herokuapp.com

# DEMO

GIF載せる

# Requirement

* ruby '2.6.5'
* gem 'devise'
* gem "chartkick"
* gem 'bootstrap', '~> 4.4.1'
* gem 'jquery-rails'
* gem 'groupdate'
* gem 'omniauth-facebook'
* gem 'omniauth-google-oauth2'
* gem "omniauth-rails_csrf_protection"
* gem 'rails_12factor'
* gem 'actiontext'
	

## Table & Association

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