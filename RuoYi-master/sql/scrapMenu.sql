-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('报废记录管理', '2000', '1', '/lab/scrap', 'C', '0', 'lab:scrap:view', '#', 'admin', sysdate(), '', null, '报废记录管理菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('报废记录管理查询', @parentId, '1',  '#',  'F', '0', 'lab:scrap:list',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('报废记录管理新增', @parentId, '2',  '#',  'F', '0', 'lab:scrap:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('报废记录管理修改', @parentId, '3',  '#',  'F', '0', 'lab:scrap:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('报废记录管理删除', @parentId, '4',  '#',  'F', '0', 'lab:scrap:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('报废记录管理导出', @parentId, '5',  '#',  'F', '0', 'lab:scrap:export',       '#', 'admin', sysdate(), '', null, '');
