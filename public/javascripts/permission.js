$(function() {
	$('div.list li').live('click', function() {
		$(this).parent().find('li').removeClass('on');
		$(this).addClass('on');
	});

	$('div.list li a.cancel').live('click', function() {
    $(this).parent().remove();
  });

	$('#system_modules li span').live('click',function() {
		$.ajax({
			url:"/operations/system_functions?system_module_id=" + $(this).parent().attr('rel'),
			dataType: 'json',
			success: function(data) {
				var system_functions_html = "";
				$(data).each( function() {
					system_functions_html += "<li rel='"+this.system_function.id+"'><span class='edit'>"+
					this.system_function.name+"("+this.system_function.id+")</span><a href='#' class='del'>删除</a>"+"</li>";
				});
				$('#system_functions').html(system_functions_html);
				$('#permissions, #permission_lines').html("");
			}
		});
	});
	
	$('#system_functions li span').live('click',function() {
		var page_id = $(this).parent().attr('id');
		$.ajax({
			url:"/operations/permissions?system_function_id=" + $(this).parent().attr('rel'),
			dataType: 'json',
			success: function(data) {
				var permissions_html = "";
				$(data).each(function(){
					permissions_html += "<li rel='"+this.permission.id+"'><span class='edit'>"+
					this.permission.name+"("+this.permission.id+")</span><a href='#' class='del'>删除</a>"+"</li>";
				});
				$('#permissions').html(permissions_html);
				$('#permission_lines').html("");
			}
		});
	});
	
	$('#permissions li span').live('click',function() {
		$.ajax({
			url:"/operations/permission_lines?permission_id=" + $(this).parent().attr('rel'),
			dataType: 'json',
			success: function(data) {
				var permission_lines_html = "";
				$(data).each(function(){
					permission_lines_html += "<li rel='"+this.permission_line.id+"'><span class='edit'>"+
					this.permission_line.controller+"-"+this.permission_line.action+"-"+this.permission_line.method+"</span><a href='#' class='del'>删除</a>"+"</li>";
				});
				$('#permission_lines').html(permission_lines_html);
			}
		});
	});
	
	$('div.box a.new').click(function(){
		var list = $(this).closest('.box').find('ul');

		if(list.attr('id') == 'system_modules') {
			list.append("<li><input type='text' size='10'/><a href='#' class='create'>确定</a>&nbsp;&nbsp;<a href='#' class='cancel'>取消</a></li>");
		} else if (list.attr('id') == 'system_functions') {
			if( $('#system_modules li.on').length ) {
				list.append("<li><input type='text' size='10'/><a href='#' class='create'>确定</a>&nbsp;&nbsp;<a href='#' class='cancel'>取消</a></li>");
			}
		} else if (list.attr('id') == 'permissions') {
			if($('#system_modules li.on').length && $('#system_functions li.on').length) {
				list.append("<li><input type='text' size='10'/><a href='#' class='create'>确定</a>&nbsp;&nbsp;<a href='#' class='cancel'>取消</a></li>");
			}
		} else if (list.attr('id') == 'permission_lines') {
			if ($('#system_modules li.on').length && $('#system_functions li.on').length && $('#permissions li.on').length) {
				list.append("<li><input type='text' size='8' class='controller'/><input type='text' size='8' class='action'/><input type='text' size='8' class='method'/><a href='#' class='create'>确定</a>&nbsp;&nbsp;<a href='#' class='cancel'>取消</a></li>");
			}
		}
	});
	
	$('#system_modules a.create').live('click',function() {
		var module_item = $(this).parent();
		$.ajax({
			url:'/operations/system_modules',
			type:'post',
			dataType:"json",
			contentType: "application/json",
			data: $.toJSON({ 'system_module': { 'name': module_item.find('input').val() } }),
			success: function (data) {
				module_item.replaceWith("<li rel='"+data.system_module.id + "'><span class='edit'>"+data.system_module.name + "</span><a href='#' class='del'>删除</a></li>");
			},
			error: function() {
			  alert('操作出错');
			}
		});
	});
	
	$('#system_modules a.del').live('click', function() {
		if(confirm("你确定要删除这个模块吗？")) {
			var module_item = $(this).parent();
			$.ajax({
				url: '/operations/system_modules',
				type: "delete",
				dataType : "json",
				data: { 'system_module_id': module_item.attr('rel') },
				success : function (data) {
					if( data.status == 'ok' ) {
						$('#system_functions, #permissions, #permission_lines').html('');
						module_item.remove();
					}
				},
        error: function() {
          alert('操作出错');
        }
			});
		}
	});
	
	$('#system_functions a.create').live('click',function(){
		var system_function_item = $(this).parent();
		var data = { 'system_function': {'name': system_function_item.find('input').val(), 'system_module_id': $('#system_modules li.on').attr('rel') } };
		$.ajax({
			url: '/operations/system_functions',
			type: 'post',
			dataType: "json",
			contentType: "application/json",
			data: $.toJSON(data),
			success: function (data){
				system_function_item.replaceWith("<li rel='" + data.system_function.id + "'><span class='edit'>" + data.system_function.name + "</span><a href='#' class='del'>删除</a></li>");
			},
			error: function() {
			  alert('操作出错');
			}
		});
	});
	
	$('#system_functions a.del').live('click', function() {
		if( confirm("你确定要删除这个页面吗？") ) {
			var system_function_item = $(this).parent();
			
			$.ajax({
				url: '/operations/system_functions',
				type: "delete",
				dataType : "json",
				data: { 'system_function_id': system_function_item.attr('rel') },
				success : function (data){
					if( data.status == 'ok') {
						$('#permissions, #permission_lines').html('');
						system_function_item.remove();
					}
				},
        error: function() {
          alert('操作出错');
        }
			});
		}
	});
	
	$('#permissions a.create').live('click', function() {
		var permission_item = $(this).parent();
		var data = { 'permission': { 'name': permission_item.find('input').val(), 'system_function_id': $('#system_functions li.on').attr('rel') } };
		$.ajax({
			url: '/operations/permissions',
			type: 'post',
			dataType: "json",
			contentType: "application/json",
			data: $.toJSON(data),
			success: function (data) {
				permission_item.replaceWith("<li rel='" + data.permission.id + "'><span class='edit'>"+ data.permission.name + "</span><a href='#' class='del'>删除</a></li>");
			},
			error: function() {
			  alert('操作出错');
			}
		});
	});
	
	$('#permissions a.del').live('click', function() {
		if(confirm("你确定要删除这个权限操作吗？")){
			var permission_item = $(this).parent();
			$.ajax({
        url: '/operations/permissions',
				type: "delete",
				dataType : "json",
				data: { 'permission_id': permission_item.attr('rel') },
				success : function (data) {
					if( data.status == 'ok' ) {
						$('#permission_lines').html('');
						permission_item.remove();
					}
				},
        error: function() {
          alert('操作出错');
        }
			});
		}
	});
	
	$('#permission_lines a.create').live('click', function() {
		var permission_line_item = $(this).parent();
		var controller = permission_line_item.find('input.controller').val();
		var action = permission_line_item.find('input.action').val();
		var method = permission_line_item.find('input.method').val();
		var permission_id = $('#permissions li.on').attr('rel');
		var data = { 'permission_line': {'controller': controller, 'action': action, 'method': method, 'permission_id': permission_id } };
		$.ajax({
			url: '/operations/permission_lines',
			type: 'post',
			dataType: "json",
			contentType: "application/json",
			data: $.toJSON(data),
			success: function (data){
				permission_line_item.replaceWith("<li rel='" + data.permission_line.id + "'><span class='edit'>" + data.permission_line.controller + "-" + data.permission_line.action + "-" + data.permission_line.method + "</span><a href='#' class='del'>删除</a></li>");
			},
			error: function() {
			  alert('操作出错');
			}
		});
	});
	
	$('#permission_lines a.del').live('click', function() {
		if(confirm("你确定要删除这个操作请求吗？")){
			var permission_line_item = $(this).parent();
			$.ajax({
				url: '/operations/permission_lines',
				type: "delete",
				dataType: "json",
				data: { 'permission_line_id': permission_line_item.attr('rel') },
				success: function (data) {
					if( data.status == 'ok' ) {
						permission_line_item.remove();
					}
				},
        error: function() {
          alert('操作出错');
        }
			});
		}
	});
	
});
