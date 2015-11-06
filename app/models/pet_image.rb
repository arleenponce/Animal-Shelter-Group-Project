class PetImage < ActiveRecord::Base
  belongs_to :pet

  has_attached_file :photo, styles: { small: "150x150#", medium: "275x275#", large: "400x400#", thumb: "90x90#" }
  validates_attachment :photo, presence: true,
    content_type: { content_type: ["image/jpg"] },
      size: { in: 0..5.megabytes }

end
