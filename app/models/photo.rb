class Photo
  include Mongoid::Document
  include Mongoid::Paperclip
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated
  include Mongoid::MultiParameterAttributes

  field :name, :type => String
  field :description, :type => String
  field :dt, :type => Date

  has_mongoid_attached_file :image
  embedded_in :user
end
