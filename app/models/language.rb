class Language < ActiveRecord::Base
  validates :locale, presence: true
  validates :name, presence: true

  has_many :projects
  has_and_belongs_to_many :projects
end
