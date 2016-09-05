class User < ApplicationRecord

  validates :login, :email, presence: true

  before_validation :ensure_login_has_a_value

  before_validation :normalize_name, on: :create



  before_create do
    self.name = login.capitalize if name.blank?
  end

  after_validation :set_location, on: [ :create, :update ]



  protected

  def ensure_login_has_a_value
    if login.nil?
      self.login = email unless email.blank?
    end
  end

  def set_location
    self.location = LocationService.query( self )
  end

end
