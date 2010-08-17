class SystemFunctionsController < ApplicationController
  # GET /system_functions
  # GET /system_functions.xml
  def index
    @system_functions = SystemFunction.paginate :page => params[:page]

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @system_functions }
    end
  end

  # GET /system_functions/1
  # GET /system_functions/1.xml
  def show
    @system_function = SystemFunction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @system_function }
    end
  end

  # GET /system_functions/new
  # GET /system_functions/new.xml
  def new
    @system_function = SystemFunction.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @system_function }
    end
  end

  # GET /system_functions/1/edit
  def edit
    @system_function = SystemFunction.find(params[:id])
  end

  # POST /system_functions
  # POST /system_functions.xml
  def create
    @system_function = SystemFunction.new(params[:system_function])

    respond_to do |format|
      if @system_function.save
        format.html { redirect_to(@system_function, :notice => 'SystemFunction was successfully created.') }
        format.xml  { render :xml => @system_function, :status => :created, :location => @system_function }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @system_function.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /system_functions/1
  # PUT /system_functions/1.xml
  def update
    @system_function = SystemFunction.find(params[:id])

    respond_to do |format|
      if @system_function.update_attributes(params[:system_function])
        format.html { redirect_to(@system_function, :notice => 'SystemFunction was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @system_function.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /system_functions/1
  # DELETE /system_functions/1.xml
  def destroy
    @system_function = SystemFunction.find(params[:id])
    @system_function.destroy

    respond_to do |format|
      format.html { redirect_to(system_functions_url) }
      format.xml  { head :ok }
    end
  end
end
