class User < ApplicationRecord
    validates :mail,{presence:true,uniqueness:true}
    validates :name,{presence:true}
    validates :password,{presence:true}
end
