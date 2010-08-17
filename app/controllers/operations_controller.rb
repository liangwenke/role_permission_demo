class OperationsController < ApplicationController
  def index
    @system_modules = SystemModule.all
  end

  def system_modules
    if request.post?
      system_module = SystemModule.create!(params[:system_module])
      respond_to do |format|
        format.json { render :text => system_module.to_json }
      end
    elsif request.put?
      system_module = SystemModule.find(params[:system_module_id])
      system_module.update_attributes!(params[:system_module])
      respond_to do |format|
        format.json { render :text => system_module.to_json }
      end
    elsif request.delete?
      system_module = SystemModule.find(params[:system_module_id])
      system_module.destroy
      respond_to do |format|
        format.json { render :text => {:status => 'ok'}.to_json }
      end
    end
  end

  def system_functions
    if request.get?
      system_module = SystemModule.find(params[:system_module_id])
      respond_to do |format|
        format.json { render :text => system_module.system_functions.to_json }
      end
    elsif request.post?
      system_function = SystemFunction.create!(params[:system_function])
      respond_to do |format|
        format.json { render :text => system_function.to_json}
      end
    elsif request.put?
      system_function = SystemFunction.find(params[:system_function_id])
      system_function.update_attributes!(params[:system_function])
      respond_to do |format|
        format.json { render :text => { :status => 'ok' }.to_json }
      end
    elsif request.delete?
      system_function = SystemFunction.find(params[:system_function_id])
      system_function.destroy
      respond_to do |format|
        format.json { render :text => { :status => 'ok' }.to_json }
      end
    end
  end

  def permissions
    if request.get?
      system_function = SystemFunction.find(params[:system_function_id])
      respond_to do |format|
        format.json { render :text => system_function.permissions.to_json }
      end
    elsif request.post?
      permission = Permission.create!(params[:permission])
      respond_to do |format|
        format.json { render :text => permission.to_json }
      end
    elsif request.put?
      permission = Permission.find(params[:permission_id])
      permission.update_attributes!(params[:permission])
      respond_to do |format|
        format.json { render :text => permission.to_json }
      end
    elsif request.delete?
      permission = Permission.find(params[:permission_id])
      permission.destroy
      respond_to do |format|
        format.json { render :text => {:status => 'ok'}.to_json }
      end
    end
  end

  def permission_lines
    if request.get?
      permission = Permission.find(params[:permission_id])
      respond_to do |format|
        format.json { render :text => permission.permission_lines.to_json }
      end
    elsif request.post?
      permission_line = PermissionLine.create!(params[:permission_line])
      respond_to do |format|
        format.json { render :text => permission_line.to_json }
      end
    elsif request.put?
      permission_line = PermissionLine.find(params[:permission_line_id])
      permission_line.update_attributes!(params[:permission_line])
      respond_to do |format|
        format.json { render :text => permission_line.to_json }
      end
    elsif request.delete?
      permission_line = PermissionLine.find(params[:permission_line_id])
      permission_line.destroy
      respond_to do |format|
        format.json { render :text => {:status => 'ok'}.to_json }
      end
    end
  end
end
