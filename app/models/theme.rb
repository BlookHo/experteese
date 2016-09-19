class Theme < ApplicationRecord
  has_many :images

  # get theme_id by theme name
  scope :find_theme_id, -> (theme) { find_by_name(theme).id }


end
