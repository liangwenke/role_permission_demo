class PermissionLinesController < ApplicationController
  # GET /permission_lines
  # GET /permission_lines.xml
  def index
    if params[:permission_id]
      @permission_lines = Permission.find(params[:permission_id]).permission_lines.paginate :page => params[:page]
    else
      @permission_lines = PermissionLine.paginate :page => params[:page]
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @permission_lines }
    end
  end

  # GET /permission_lines/1
  # GET /permission_lines/1.xml
  def show
    @permission_line = PermissionLine.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @permission_line }
    end
  end

  # GET /permission_lines/new
  # GET /permission_lines/new.xml
  def new
    @permission_line = PermissionLine.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @permission_line }
    end
  end

  # GET /permission_lines/1/edit
  def edit
    @permission_line = PermissionLine.find(params[:id])
  end

  # POST /permission_lines
  # POST /permission_lines.xml
  def create
    @permission_line = PermissionLine.new(params[:permission_line])

    respond_to do |format|
      if @permission_line.save
        format.html { redirect_to(@permission_line, :notice => 'PermissionLine was successfully created.') }
        format.xml  { render :xml => @permission_line, :status => :created, :location => @permission_line }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @permission_line.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /permission_lines/1
  # PUT /permission_lines/1.xml
  def update
    @permission_line = PermissionLine.find(params[:id])

    respond_to do |format|
      if @permission_line.update_attributes(params[:permission_line])
        format.html { redirect_to(@permission_line, :notice => 'PermissionLine was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @permission_line.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /permission_lines/1
  # DELETE /permission_lines/1.xml
  def destroy
    @permission_line = PermissionLine.find(params[:id])
    @permission_line.destroy

    respond_to do |format|
      format.html { redirect_to(permission_lines_url) }
      format.xml  { head :ok }
    end
  end
end
