class User < ActiveRecord::Base
	# has_many: authentications 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:linkedin] 

  def self.new_with_session(params, session)
  	super.tap do |user|
  		if data = session["devise.linkedin_data"] && session["devise.linkedin_data"]["extra"]["raw_info"]
  			user.email = data["email"] if user.email.blank?
  		end
  	end
  end

  def self.find_for_linkedin_oauth(auth, signed_in_resource=nil)
  	User.where(:provider => auth.provider, :uid => auth.uid).
  	first_or_initialize.tap  do |u|
  		u.name =  auth.extra.raw_info.name
  		u.provider = auth.provider
  		u.uid =  auth.uid
  		u.email = auth.info.email
  		u.password = Devise.friendly_token[0,20]
  		u.li_token = auth.credentials.token
  		u.li_secret = auth.credentials.secret
  		u.save
  	end    
  end

  def linkedin
  	@linkedin ||= begin
  		client = LinkedIn::Client.new
  		client.authorize_from_access(li_token, li_secret)
  		client
  	end
  end

  def connections
  	@connections ||= linkedin.connections(:fields => ["id", "first_name", "last_name", "headline", "industry", "picture_url"])
  end
end