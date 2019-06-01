class WorkContentsController < ApplicationController
  def new
    @skillsheet = Skillsheet.find(params[:skillsheet_id])
    @work_content = WorkContent.new
  end

  def create
    @work_content = WorkContent.new(work_content_params)
    @skillsheet = Skillsheet.find(params[:work_content][:skillsheet_id])
    if @work_content.save
      redirect_to @skillsheet
    else
      render :new
    end
  end

  def edit
  end

  def update
    @work_content = WorkContent.find(params[:id])
    if @work_content.update(work_content_params)
      redirect_to skillsheet_path(params[:skillsheet_id])
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def work_content_params
    params.permit(WorkContent::PERMITTED_ATTRIBUTES)
  end
end
