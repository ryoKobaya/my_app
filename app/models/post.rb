class Post < ApplicationRecord
    validates :content,{presence: true,length:{maximum:1000}}
    validates :user_id,{presence: true}
end
