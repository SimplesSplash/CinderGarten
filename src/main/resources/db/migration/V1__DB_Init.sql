 create sequence hibernate_sequence start 1 increment 1;
 create table children (
child_id int8 not null,
 first_name varchar(255),
 last_name varchar(255),
 patronymic varchar(255),
 group_id int8,
 primary key (child_id)
);

 create table criterions (
id int8 not null,
 criteria varchar(255),
 description varchar(255),
 position_id int8, 
primary key (id)
);

 create table groups (
id  bigserial not null,
 name varchar(255),
 tutor_id int8,
 primary key (id)
);

 create table messages (
id int8 not null,
 sending_date timestamp,
 text varchar(255),
 recipient_id int8,
 sender_id int8,
 primary key (id)
);

 create table positions (
id int8 not null,
 position varchar(255),
 primary key (id)
);

 create table results (
id int8 not null, 
result varchar(255),
 child_id int8,
 criteria_id int8, 
primary key (id)
);
 create table system_accounting (
id int8 not null,
 actual_number int8,
 primary key (id)
);

 create table teachers (
teacher_id int8 not null,
 first_name varchar(255),
 last_name varchar(255), 
patronymic varchar(255), 
group_id int8, 
position_id int8,
 primary key (teacher_id)
);
 create table teachers_groups (
teacher_id int8 not null,
 group_id int8 not null,
 primary key (teacher_id, group_id)
);

 create table user_role 
(user_id int8 not null,
 roles varchar(255)
);

 create table usr (
id int8 not null,
 active boolean not null,
 password varchar(255), 
username varchar(255),
 primary key (id)
);

 alter table if exists children add constraint FKdlxsmarty8u35toa53ay4euup foreign key (group_id) references groups;
 alter table if exists criterions add constraint FK43wrmk726lwwwx8xwgyd5xwl foreign key (position_id) references positions;
 alter table if exists groups add constraint FKn52vui256wukqq8ejrkhb1i9v foreign key (tutor_id) references teachers;
 alter table if exists messages add constraint FKjucty50oq2ijjbb99tle2nh9o foreign key (recipient_id) references usr;
 alter table if exists messages add constraint FK9olf67vk7n8r8o6x94lrb4wle foreign key (sender_id) references usr;
 alter table if exists results add constraint FKfkvydabpndb6r952r59ca539c foreign key (child_id) references children;
 alter table if exists results add constraint FKsnhwva48qdxitbe7h890jjb4 foreign key (criteria_id) references criterions;
 alter table if exists teachers add constraint FKe07lj7a72hpy2ekghovcuo2of foreign key (group_id) references groups;
 alter table if exists teachers add constraint FKbbmjefxn6520qfeva3p2em54j foreign key (position_id) references positions;
 alter table if exists teachers_groups add constraint FK1mgn9gy5j5seavxgnae54nggh foreign key (group_id) references groups;
 alter table if exists teachers_groups add constraint FKdofl7r91qv6ejtv7d4i8ewe13 foreign key (teacher_id) references teachers;
 alter table if exists user_role add constraint FKfpm8swft53ulq2hl11yplpr5 foreign key (user_id) references usr;
