class Word < ActiveRecord::Base
  has_ancestry

  belongs_to :project
  belongs_to :language
end
