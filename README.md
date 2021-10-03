# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| birthday           | integer | null: false |

### Association

- has_many :items
- has_many :purchase

## items テーブル

| Column    | Type    | Options     |
| --------- | --------| ----------- |
| product   | string  | null: false |
| price     | integer | null: false |
| seller    | string  | null: false |
| category  | string  | null: false |
| condition | string  | null: false |

### Association

- belongs_to :user
- has_many :purchase

## purchase テーブル

| Column                  | Type       | Options                        |
| ----------------------- | ---------- | ------------------------------ |
| shipping_charges        | references | null: false, foreign_key: true |
| shipping_area           | references | null: false, foreign_key: true |
| estimated_shipping_date | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping

## shipping テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postal_code      | references | null: false, foreign_key: true |
| prefectures      | references | null: false, foreign_key: true |
| municipalities   | references | null: false, foreign_key: true |
| address          | references | null: false, foreign_key: true |
| building_name    | references | null: false, foreign_key: true |
| telephone_number | references | null: false, foreign_key: true |

### Association

- has_one :purchase
