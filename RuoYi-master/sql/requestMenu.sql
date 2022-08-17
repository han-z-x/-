-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('购买申请管理', '2000', '1', '/lab/request', 'C', '0', 'lab:request:view', '#', 'admin', sysdate(), '', null, '购买申请管理菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('购买申请管理查询', @parentId, '1',  '#',  'F', '0', 'lab:request:list',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('购买申请管理新增', @parentId, '2',  '#',  'F', '0', 'lab:request:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('购买申请管理修改', @parentId, '3',  '#',  'F', '0', 'lab:request:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('购买申请管理删除', @parentId, '4',  '#',  'F', '0', 'lab:request:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('购买申请管理导出', @parentId, '5',  '#',  'F', '0', 'lab:request:export',       '#', 'admin', sysdate(), '', null, '');
