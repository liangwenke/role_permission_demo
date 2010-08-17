class AuditsController < ApplicationController
  def index
    @audits = Audit.paginate :page => params[:page]
  end

  def show
    @audit = Audit.find(params[:id])
  end
end
