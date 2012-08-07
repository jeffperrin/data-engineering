class Import < ActiveRecord::Base
  attr_accessible :file_name, :import_file
  attr_accessor :import_file

  before_save :parse_file

  def parse_file
    self.file_name = import_file.original_filename
  end
end
