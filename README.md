
# -the database of chat-space

## tables
### messages

|column|type|option|
|:--:|:--:|:--:|
|body|text||
|image|string|
|group_id|references|foreign_key: true|
|user_id|references|foreign_key: true|

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
- has_many :groups_users



### groups

|column|type|option|
|:--:|:--:|:--:|
|name|text|null: false, add_index| 
|user_id|references|foreign_key: true|

#### association

- has_many :users
- has_many :messages, through:groups_users
- has_nany :groups_users


### groups_users

|column|type|option|
|:--:|:--:|:--:|
|user_id|refernces|foreign_key: true|
|group_id|refernces|foreign_key: true|

#### association
- belongs_to :group
- belongs_to :user




