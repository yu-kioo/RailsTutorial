class User < ApplicationRecord

  # DB格納前に小文字化(メアド一意性対応)
  before_save { self.email = email.downcase } 
  #             email.downcase! メソッド末尾に!で

  # validation定義：presence:true=空を禁止
  validates(:name, presence: true, length: {maximum: 50})

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  # format：正規表現 case_sensitive:false = 大文字・小文字を同一とみなす
  validates(:email, presence: true, length: {maximum: 255},
            format: {with: VALID_EMAIL_REGEX},
            uniqueness: {case_sensitive: false})
  # passのhash化
  has_secure_password
  validates(:password, presence: true, length: {minimum: 6})
end