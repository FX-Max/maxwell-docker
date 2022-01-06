use mysql;
select host, user from user;

-- mysql 8
CREATE USER 'maxwell'@'%' IDENTIFIED BY 'max';

-- http://maxwells-daemon.io/quickstart/
GRANT ALL on maxwell.* to 'maxwell'@'%';
GRANT SELECT, REPLICATION CLIENT, REPLICATION SLAVE on *.* to 'maxwell'@'%';

flush privileges;

create database `maxwell` default character set utf8 collate utf8_general_ci;
create database `test` default character set utf8 collate utf8_general_ci;

use test;
create table test(id int not null, name varchar(100));
insert into test values(1, 'from master');
select * from test;

use maxwell;

create table if not exists `user` (
 `id` bigint(20) not null,
 `created_at` bigint(40) default null,
 `last_modified` bigint(40) default null,
 `email` varchar(255) default null,
 `first_name` varchar(255) default null,
 `last_name` varchar(255) default null,
 `username` varchar(255) default null,
 primary key (`id`)
);

insert into `user` (`id`, `created_at`, `last_modified`, `email`, `first_name`, `last_name`, `username`)
values
  (0,1,1,'maxfang@example.com','Max','Fang','maxfang');