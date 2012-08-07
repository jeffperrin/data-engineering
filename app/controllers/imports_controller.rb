class ImportsController < ApplicationController
  def index

  end

  def create
    redirect_to imports_path, notice: 'The data file was successfully imported'
  end
end