class Import < ActiveRecord::Base
  attr_accessible :file_name, :content
  validates :file_name, presence: :true

  before_save :parse_file

  def parse_file

  end

  def load_file(params)
    file = params[:import].blank? ? nil : params[:import][:import_file]

    if file.nil?
      errors.add(:file_name, "wasn't chosen")
      return
    end

    self.file_name = file.original_filename
    self.content = file.read
  end
end
