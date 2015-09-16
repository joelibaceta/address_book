load 'lib/validators.rb' # Custom validator

class Contact < ActiveRecord::Base
  include Validators # Include a custom lib to validate email format
  
  belongs_to :user
  
  # Validate uniqueness of email for a new contact
  validates_uniqueness_of :email, :scope => :user_id
  
  # Validate presence of last_name and first_name in a new contact registration
  validates :first_name, :last_name, presence: true 
  
  # Validate presence and format of email field for a new contact registration
  validates :email, :email => true, presence: true
             
  # Avatar file handler
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: ":id_identicon.png"
     validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  
  # After save contact callback
  after_save :create_identicon
  
  # Define a scope to get contacts for only one user
  scope :filter_by_user, -> (user) {where("user_id = ?", user.id)}
  
  # Preformat name for to_s calls
  def name
    "#{self.first_name} #{self.last_name}"
  end
  alias to_s name
  
  # Crate an identicon for each contact created
  def create_identicon 
    RubyIdenticon.create_and_save("#{self.name}", "app/assets/images/#{self.id}_identicon.png")
  end
  
end
