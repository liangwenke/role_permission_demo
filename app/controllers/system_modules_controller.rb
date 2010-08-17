class SystemModulesController < ApplicationController
  # GET /system_modules
  # GET /system_modules.xml
  def index
    @system_modules = SystemModule.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @system_modules }
    end
  end

  # GET /system_modules/1
  # GET /system_modules/1.xml
  def show
    @system_module = SystemModule.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @system_module }
    end
  end

  # GET /system_modules/new
  # GET /system_modules/new.xml
  def new
    @system_module = SystemModule.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @system_module }
    end
  end

  # GET /system_modules/1/edit
  def edit
    @system_module = SystemModule.find(params[:id])
  end

  # POST /system_modules
  # POST /system_modules.xml
  def create
    @system_module = SystemModule.new(params[:system_module])

    respond_to do |format|
      if @system_module.save
        format.html { redirect_to(@system_module, :notice => 'SystemModule was successfully created.') }
        format.xml  { render :xml => @system_module, :status => :created, :location => @system_module }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @system_module.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /system_modules/1
  # PUT /system_modules/1.xml
  def update
    @system_module = SystemModule.find(params[:id])

    respond_to do |format|
      if @system_module.update_attributes(params[:system_module])
        format.html { redirect_to(@system_module, :notice => 'SystemModule was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @system_module.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /system_modules/1
  # DELETE /system_modules/1.xml
  def destroy
    @system_module = SystemModule.find(params[:id])
    @system_module.destroy

    respond_to do |format|
      format.html { redirect_to(system_modules_url) }
      format.xml  { head :ok }
    end
  end
end
