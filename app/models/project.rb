class Project < ActiveRecord::Base
  belongs_to :language
  has_and_belongs_to_many :languages
end
