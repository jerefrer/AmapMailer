class Subscriber < ActiveRecord::Base
  attr_accessible :auth_token, :email, :name, :category_ids

  has_and_belongs_to_many :categories

  validates_presence_of :name
  validates :email, :presence => true, :uniqueness => true, :format => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/

  before_create :generate_auth_token

private

  def generate_auth_token
    loop do
      self.auth_token = Subscriber.random_token
      break unless Subscriber.exists?(:auth_token => self.auth_token)
    end    
  end

  def self.random_token
    SecureRandom.base64(15).tr('+/=lIO0', 'pqrsxyz')
  end

end
