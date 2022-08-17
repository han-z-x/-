-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('设备管理', '2000', '1', '/lab/device', 'C', '0', 'lab:device:view', '#', 'admin', sysdate(), '', null, '设备管理菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('设备管理查询', @parentId, '1',  '#',  'F', '0', 'lab:device:list',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('设备管理新增', @parentId, '2',  '#',  'F', '0', 'lab:device:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('设备管理修改', @parentId, '3',  '#',  'F', '0', 'lab:device:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('设备管理删除', @parentId, '4',  '#',  'F', '0', 'lab:device:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('设备管理导出', @parentId, '5',  '#',  'F', '0', 'lab:device:export',       '#', 'admin', sysdate(), '', null, '');
