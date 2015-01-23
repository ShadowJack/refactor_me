class User < ActiveRecord::Base
  has_many :messages, class_name: 'Message', foreign_key: :user_id
  # User can have many favourite tags
  has_and_belongs_to_many :tags
  # User can have many favourite topics
  has_and_belongs_to_many :favourite_topics, class_name: 'Topic', association_foreign_key: :topic_id, join_table: :user_favourite_topics
  # Topics that user started
  has_many :started_topics, class_name: 'Topic'

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, omniauth_providers: [:github]

  # Virtual attribute for authenticating by either username or email
  attr_accessor :login

  # override devise method to use both email and username as possible authentication methods
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["username = :value OR lower(email) = lower(:value)", { :value => login }]).first
    else
      where(conditions).first
    end
  end

  # when authorizing throught github
  def self.from_omniauth(auth)
    puts auth.pretty_print_inspect
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.username = auth.info.nickname
      user.first_name = auth.info.first_name if auth.info.first_name
      user.last_name = auth.info.last_name if auth.info.last_name
    end
  end

end
