class Photo
  include Mongoid::Document
  field :name, :type => String
  field :description, :type => String
  field :dt, :type => Date
end
