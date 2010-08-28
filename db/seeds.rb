# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

# 创建部门
puts "Starting create initial Departments......"
%W(客服部 业务部 财务部 市场部 技术部 翻译 统计 系统管理员).each do |dept|
  Department.find_or_create_by_name(dept)
  puts "*** Create Department：#{dept}"
end
puts "Done!"

# 创建管理员
puts "Starting create initial Admins......"
%W(service business finance market technology translate statistic system).each_with_index do |admin, index|
  next if Admin.find_by_name(admin)
  Admin.create!(:name => admin, :password => "123456", :department_id => index + 1)
  puts "*** Create Admin：#{admin}"
end
puts "Done!"

# 创建角色
puts "Starting create initial Roles......"
%W(董事长 CEO 总经理 客服经理 业务经理 财务经理 技术经理 系统管理员 客服人员 业务人员 财务人员 技术人员).each do |role|
  Role.find_or_create_by_name(role)
  puts "*** Create Role：#{role}"
end
puts "Done!"

def create_system_function_and_permissions(mod_name, system_functions = [], options = {})
  system_module = SystemModule.find_or_create_by_name(mod_name)
  puts "*** Create System Module：#{mod_name}"

  system_functions.each do |sys_fun|
    system_function = system_module.system_functions.find_or_create_by_name(sys_fun[:system_function])
    puts "*** Create System Function：#{system_function}"

    prmission_prefix = sys_fun[:permission_prefix]

    permissions = {
      "#{prmission_prefix}查询" => { 'index' => 'get' },
      "查看#{prmission_prefix}" => { 'show' => 'get' },
      "创建#{prmission_prefix}" => { 'new' => 'get', 'create' => 'post' },
      "编辑#{prmission_prefix}" => { 'edit' => 'get', 'update' => 'put' },
      "删除#{prmission_prefix}" => { 'destroy' => 'delete' }
    }

    permissions.each do |per, lines|
      permission = system_function.permissions.find_or_create_by_name(per)
      puts "*** Create Permission：#{per}"
    
      lines.each do |action, method|
        per_line = permission.permission_lines.find_or_create_by_controller_and_action_and_method(sys_fun[:controller], action, method)
        puts "*** Create Permission Line：#{per_line.controller}-#{per_line.action}-#{per_line.method}"
      end
    end
  end
end

# 创建系统模块
# 模块: 客户 交易 站内信 物流 库存 退货 财务 积分 合同 进货 运营 拍品 结算 编辑网站侧栏 客户资金查询 资金流转确认 退货处理 汇率编辑 财务统计 账户流水 站点配置 商务配置 商城配置 站点统计 短信工具 权限管理 翻译 用户统计

# 创建系统模块
#puts "Starting create initial System Modules......"
#
#create_system_function_and_permissions(
#  '客户',
#  [
#    { :system_function => '客户管理', :permission_prefix => '客户', :controller => 'users' }
#  ]
#)
#create_system_function_and_permissions(
#  '合同',
#  [
#    { :system_function => '合同管理', :permission_prefix => '合同', :controller => 'contracts' }
#  ]
#)
#create_system_function_and_permissions(
#  '拍品',
#  [
#    { :system_function => '拍品管理', :permission_prefix => '拍品', :controller => 'auctions' }
#  ]
#)
#create_system_function_and_permissions(
#  '订单',
#  [ { :system_function => '竞拍订单', :permission_prefix => '竞拍订单', :controller => 'orders' },
#    { :system_function => '商城订单', :permission_prefix => '商城订单', :controller => 'ec_orders' }
#  ]
#)
#create_system_function_and_permissions(
#  '库存',
#  [
#    { :system_function => '竞拍库存', :permission_prefix => '竞拍库存', :controller => 'storages' },
#    { :system_function => '商城库存', :permission_prefix => '商城库存', :controller => 'ec_storages' }
#  ]
#)
#create_system_function_and_permissions(
#  '物流',
#  [
#    { :system_function => '物流管理', :permission_prefix => '物流', :controller => 'transports' }
#  ]
#)
#create_system_function_and_permissions(
#  '退货',
#  [
#    { :system_function => '竞拍退货', :permission_prefix => '竞拍退货', :controller => 'comeback_goods' },
#    { :system_function => '商城退货', :permission_prefix => '商城退货', :controller => 'ec_comeback_goods' }
#  ]
#)
#create_system_function_and_permissions(
#  '财务',
#  [
#    { :system_function => '竞拍结算', :permission_prefix => '竞拍结算', :controller => 'settelments' },
#    { :system_function => '商城结算', :permission_prefix => '商城结算', :controller => 'ec_settelments' }
#  ]
#)
#create_system_function_and_permissions(
#  '积分',
#  [
#    { :system_function => '积分管理', :permission_prefix => '积分', :controller => 'user_scores' }
#  ]
#)
#create_system_function_and_permissions(
#  '站内信',
#  [
#    { :system_function => '竞拍咨询', :permission_prefix => '竞拍咨询', :controller => 'messages' },
#    { :system_function => '商城咨询', :permission_prefix => '商城咨询', :controller => 'ec_feedbacks' },
#    { :system_function => '手机短信', :permission_prefix => '短信', :controller => 'msn' }
#  ]
#)
#create_system_function_and_permissions(
#  '竞拍配置',
#  [
#    { :system_function => '竞拍配置', :permission_prefix => '竞拍配置', :controller => 'site_config' }
#  ]
#)
#create_system_function_and_permissions(
#  '商城配置',
#  [
#    { :system_function => '商城配置', :permission_prefix => '商城配置', :controller => 'mall_config' }
#  ]
#)
#create_system_function_and_permissions(
#  '翻译',
#  [
#    { :system_function => '翻译管理', :permission_prefix => '翻译', :controller => 'translates' }
#  ]
#)
#create_system_function_and_permissions(
#  '系统',
#  [
#    { :system_function => '用户管理', :permission_prefix => '用户', :controller => 'admins' },
#    { :system_function => '角色管理', :permission_prefix => '角色', :controller => 'roles' },
#    { :system_function => '权限管理', :permission_prefix => '权限', :controller => 'permissions' },
#    { :system_function => '操作记录', :permission_prefix => '操作记录', :controller => 'audits' },
#    { :system_function => '网站访问', :permission_prefix => '网站访问', :controller => 'pv' },
#    { :system_function => '客户统计', :permission_prefix => '客户统计', :controller => 'statistics' }
#  ]
#)
#puts "Done!"


create_system_function_and_permissions(
  '用户',
  [
    { :system_function => '用户管理', :permission_prefix => '用户', :controller => 'admins' }
  ]
)
create_system_function_and_permissions(
  '角色',
  [
    { :system_function => '角色管理', :permission_prefix => '角色', :controller => 'roles' }
  ]
)
create_system_function_and_permissions(
  '权限',
  [
    { :system_function => '权限管理', :permission_prefix => '权限', :controller => 'permissions' }
  ]
)
create_system_function_and_permissions(
  '权限请求',
  [
    { :system_function => '权限请求管理', :permission_prefix => '权限请求', :controller => 'permission_lines' }
  ]
)
create_system_function_and_permissions(
  '模块',
  [
    { :system_function => '模块管理', :permission_prefix => '模块', :controller => 'system_modules' }
  ]
)
create_system_function_and_permissions(
  '功能',
  [
    { :system_function => '功能管理', :permission_prefix => '功能', :controller => 'system_functions' }
  ]
)
create_system_function_and_permissions(
  '部门',
  [
    { :system_function => '部门管理', :permission_prefix => '部门', :controller => 'departments' }
  ]
)
create_system_function_and_permissions(
  '权限操作',
  [
    { :system_function => '权限操作管理', :permission_prefix => '权限操作', :controller => 'operations' }
  ]
)
create_system_function_and_permissions(
  '操作记录',
  [
    { :system_function => '操作记录管理', :permission_prefix => '操作记录', :controller => 'audits' }
  ]
)

puts 'Add all permission for admin: technology'

admin = Admin.find_by_name('technology')
role = Role.find_by_name('技术人员')

role.update_attributes!(:permission_ids => Permission.all.map(&:id))
admin.update_attributes!(:role_ids => [role.id])

puts "Done!"
