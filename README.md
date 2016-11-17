
# -the database of chat-space

## tables
### messages

|column|type|option|
|:--:|:--:|:--:|
|body|text||
|image|string|
|group_id|integer|references|
|user_id|integer|references|

#### association

- belongs_to :user
- belongs_to :group

### users

|column|type|option|
|:--:|:--:|:--:|
|name|text|unique: true, add_index|
|email|string|unique: true|
|password|string|null: false|

#### association

- has_many :messages
- has_many :groups, through: groups_users



### groups

|column|type|option|
|:--:|:--:|:--:|
|name|text|null: false, add_index| 
|user_id|integer|references|

#### association

- has_many :users
- has_many :messages, through:groups_users


### groups_users

|column|type|option|
|:--:|:--:|:--:|
|user_id|string|refernces|
|group_id|string|refernces|

#### association
- belongs_to :group
- belongs_to :user




