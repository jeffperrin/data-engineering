class ImportsController < ApplicationController
  def index
    @import = Import.new
    @recent_imports = Import.recent
  end

  def create
    @import = Import.new(params[:import])
    if @import.parse_file
      redirect_to imports_path,
        notice: "Purchases totalling #{number_to_currency @import.gross_revenue} of gross revenue were successfully imported"
    else
      @recent_imports = Import.recent
      render :index, notice: "There were errors importing the data file at #{@import.file_name}"
    end
  end
end
