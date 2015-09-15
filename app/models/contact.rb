class Contact < ActiveRecord::Base
  belongs_to :user
  
  validates :email, uniqueness: true
  validates :first_name, :last_name, :email, :address, presence: true
  
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: ":id_identicon.png"
     validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  
  after_save :create_identicon 
  
  def name
    "#{self.first_name} #{self.last_name}"
  end
  
  def create_identicon 
    RubyIdenticon.create_and_save("#{self.name}", "app/assets/images/#{self.id}_identicon.png")
  end
  
end
