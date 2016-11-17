
# -the database of chat-space

## tables
### messages

|column|type|option|
|:--:|:--:|:--:|
|body|text||
|image|string|
|group_id|integer|references|
|user_id|integer|references|

#### relations

- belongs_to :users
- belongs_to :groups

### users

|column|type|option|
|:--:|:--:|:--:|
|name|text|unique: true|
|user_id|string|
|email|string|unique: true|
|password|string|null: false|

#### relations

- has_many :messages
- has_many :groups


### groups

|column|type|option|
|:--:|:--:|:--:|
|name|text|null: false|
|user_id|integer|references|

#### relations

- belongs_to :users
- has_many :messages




