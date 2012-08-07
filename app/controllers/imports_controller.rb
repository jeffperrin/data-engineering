class ImportsController < ApplicationController
  def index
    @import = Import.new
  end

  def create
    @import = Import.new
    @import.load_file params
    if @import.save
      redirect_to imports_path, notice: 'The data file was successfully imported'
    else
      render :index, notice: "There were errors importing the data file at #{@import.file_name}"
    end
  end
end
