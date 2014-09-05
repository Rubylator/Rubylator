class Language < ActiveRecord::Base
  validates :locale, presence: true
  validates :name, presence: true
end
