# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

# 创建部门
puts "Starting create initial Departments......"
%W(客服部 业务部 财务部 系统管理员 翻译 站点配置 统计).each do |dept|
  Department.find_or_create_by_name(dept)
  puts "*** Create Department：#{dept}"
end
puts "Done!"

# 创建管理员
puts "Starting create initial Admins......"
%W(service business finance root translate config statistic).each_with_index do |admin, index|
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

# 创建系统模块
puts "Starting create initial System Modules......"
%W(客户 交易 站内信 物流 库存 退货 财务 积分 合同 进货 运营 拍品 结算 编辑网站侧栏 客户资金查询 资金流转确认 退货处理 汇率编辑 财务统计 账户流水 站点配置 商务配置 商城配置 站点统计 短信工具 权限管理 翻译 用户统计).each do |system_module|
  SystemModule.find_or_create_by_name(system_module)
  puts "*** Create System Module：#{system_module}"
end
puts "Done!"

# 创建权限
puts "Starting create initial Permissions......"
%W(客户管理 交易管理 站内信 物流管理 库存管理 退货管理 财务管理 积分管理 合同管理 进货管理 运营管理 拍品管理 结算管理 编辑网站侧栏 客户资金查询 资金流转确认 退货处理 汇率编辑 财务统计 账户流水 站点配置 商务配置 商城配置 站点统计 短信工具 权限管理 翻译 用户统计).each do |name|

end
puts "Done!"

## 创建权限
#puts "Starting create initial Permissions......"
#{ 'name' => '订单', 'controllers' => 'orders', 'actions' => %W(查询 创建 查看 编辑 删除) }.each do |controller, actions|
#  unless Permission.find_by_name(name)
#    permission = Permission.create!(:name => name)
#    puts "*** Create Permission：#{name}"
#    [ ['orders', 'index', 'get'], ['orders', 'show', 'get'], ['orders', 'new', 'get'], ['orders', 'create', 'post'], ['orders', 'edit', 'get'], ['orders', 'update', 'put'], ['orders', 'destroy', 'delete'] ].each do |line|
#      permission.permission_lines.create!(:controller => line[0], :action => line[1], :method => line[2])
#    end
#  end
#end
#puts "Done!"

