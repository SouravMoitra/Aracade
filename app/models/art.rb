class Art < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  before_save :update_image_attributes

  private

  def update_image_attributes
    if image.present?
      self.size = image.file.size
      self.width, self.height = `identify -format "%wx%h" #{image.file.path}`.split(/x/)
    end
  end
end
