class Language < ActiveRecord::Base
  validates :locale, length: {in: 2..8}
  validates :name, presence: true

  has_one :project
  has_and_belongs_to_many :projects
end
