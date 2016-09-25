class Theme < ApplicationRecord
  has_many :images

  # todo: validations
  # t.integer  "user_id"
  # t.integer  "image_id"
  # t.integer  "value"
  # validates :name, presence: true, uniqueness: true, length: { maximum: 50 }

  # get theme_id by theme name
  scope :find_theme_id, -> (theme) { find_by_name(theme).id }

end
