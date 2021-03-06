class Person < ActiveRecord::Base
  has_many :wall_posts, uniq: true
  has_and_belongs_to_many :groups, uniq: true

  validates_presence_of :uid
  validates_uniqueness_of :uid
  validates_numericality_of :uid, greater_than: 0

  scope :alive,   where(state: 'alive')
  scope :unknown, where(state: 'unknown')
  scope :bots,    where(state: 'bot')
  scope :pending, where(state: 'pending')

  #field :uid, type:String
  #field :domain, type:String
  #field :first_name, type:String
  #field :last_name, type:String
  ##TODO make validation, for only :bot, :alive and :unknown state avaible
  #field :state, type:Symbol,  default: :pending
  #field :bdate, type: DateTime
  #field :friends_count, type:Integer
  #field :photo, type:String

  ##has_many :wall_posts, as: :posted
  #has_many :wall_posts
  ##validates_presence_of :uid
  #validates_presence_of :state
  ##validates :state, in: [:pending,:bot,:alive,:unknown]
  #scope :by_state,->(state) { where(state:limit) }
  #attr_accessible :uid, :domain, :first_name, :last_mame, :state, :friends_count, :photo, :wall_posts
end
