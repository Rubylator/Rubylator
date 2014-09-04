class Language < ActiveRecord::Base
  validates :locale, length: {in: 2..8}
  validates :name, presence: true
end
