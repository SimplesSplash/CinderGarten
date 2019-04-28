insert into usr (id, username, password, active) values (1, 'admin', '1', true);

insert into user_role (user_id, roles) values (1,'ADMIN');


insert into usr (id, username, password, active) values (2, 'teacher1', '1', true);

insert into user_role (user_id, roles) values (2,'TEACHER');

insert into teachers (first_name, last_name, patronymic, teacher_id, position_id, group_id) values ('Анна', 'Иванова', 'Петровна', 2, 1, 1);

update groups set tutor_id=2 where id=1;
 

insert into usr (id, username, password, active) values (3, 'teacher2', '1', true);

insert into user_role (user_id, roles) values (3,'TEACHER');

insert into teachers (first_name, last_name, patronymic, teacher_id, position_id, group_id) values ('Ирина', 'Петрова', 'Ивановна', 3, 2, null);


insert into usr (id, username, password, active) values (4, 'child1', '1', true);

insert into user_role (user_id, roles) values (4,'CHILD');

insert into children (first_name, last_name, patronymic, child_id, group_id) values ('Иван', 'Иванов', 'Иванович', 4, 1);
