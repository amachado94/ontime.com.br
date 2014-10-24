class User
  include Mongoid::Document
  include Mongoid::Timestamps
  
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
         
  field :name,                   type: String, default: ""
  field :email,                  type: String, default: ""
  field :encrypted_password,     type: String, default: ""
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time
  field :remember_created_at,    type: Time
  field :sign_in_count,          type: Integer, default: 0
  field :current_sign_in_at,     type: Time
  field :last_sign_in_at,        type: Time
  field :current_sign_in_ip,     type: String
  field :last_sign_in_ip,        type: String
 
  def to_s
    name
  end
     
  # HACK for devise
  class << self
    def serialize_from_session(key, salt)
      record = to_adapter.get(key[0]["$oid"])
      record if record && record.authenticatable_salt == salt
    end
  end   
         
end
