/*==============================================================*/
/* DBMS name:      Sybase SQL Anywhere 12                       */
/* Created on:     2015/5/19 21:12:49                           */
/*==============================================================*/


if exists(select 1 from sys.sysforeignkey where role='FK_关注投票_关注者_投票') then
    alter table 关注投票
       delete foreign key FK_关注投票_关注者_投票
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_关注投票_被关注投票_用户') then
    alter table 关注投票
       delete foreign key FK_关注投票_被关注投票_用户
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_投票_发布投票_用户') then
    alter table 投票
       delete foreign key FK_投票_发布投票_用户
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_投票参与记录_参与_用户') then
    alter table 投票参与记录
       delete foreign key FK_投票参与记录_参与_用户
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_投票参与记录_支持_投票选项') then
    alter table 投票参与记录
       delete foreign key FK_投票参与记录_支持_投票选项
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_投票选项_拥有_投票') then
    alter table 投票选项
       delete foreign key FK_投票选项_拥有_投票
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_用户_INHERITAN_账户') then
    alter table 用户
       delete foreign key FK_用户_INHERITAN_账户
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_管理员_INHERITAN_账户') then
    alter table 管理员
       delete foreign key FK_管理员_INHERITAN_账户
end if;

drop index if exists 关注投票.关注者_FK;

drop index if exists 关注投票.被关注投票_FK;

drop index if exists 关注投票.关注投票_PK;

drop table if exists 关注投票;

drop index if exists 投票.发布投票_FK;

drop index if exists 投票.投票_PK;

drop table if exists 投票;

drop index if exists 投票参与记录.参与_FK;

drop index if exists 投票参与记录.支持_FK;

drop index if exists 投票参与记录.投票参与记录_PK;

drop table if exists 投票参与记录;

drop index if exists 投票选项.拥有_FK;

drop index if exists 投票选项.投票选项_PK;

drop table if exists 投票选项;

drop index if exists 用户.用户_PK;

drop table if exists 用户;

drop index if exists 管理员.管理员_PK;

drop table if exists 管理员;

/*==============================================================*/
/* Table: 关注投票                                                  */
/*==============================================================*/
create table 关注投票 
(
   账户ID                 integer                        not null,
   投票ID                 integer                        not null,
   constraint PK_关注投票 primary key clustered (账户ID, 投票ID)
);

/*==============================================================*/
/* Index: 关注投票_PK                                               */
/*==============================================================*/
create unique clustered index 关注投票_PK on 关注投票 (
账户ID ASC,
投票ID ASC
);

/*==============================================================*/
/* Index: 被关注投票_FK                                              */
/*==============================================================*/
create index 被关注投票_FK on 关注投票 (
账户ID ASC
);

/*==============================================================*/
/* Index: 关注者_FK                                                */
/*==============================================================*/
create index 关注者_FK on 关注投票 (
投票ID ASC
);

/*==============================================================*/
/* Table: 投票                                                    */
/*==============================================================*/
create table 投票 
(
   投票ID                 integer                        not null,
   账户ID                 integer                        not null,
   创建时间                 timestamp                      null,
   截止时间                 timestamp                      null,
   状态                   integer                        null,
   选项描述                 long varchar                   null,
   constraint PK_投票 primary key (投票ID)
);

/*==============================================================*/
/* Index: 投票_PK                                                 */
/*==============================================================*/
create unique index 投票_PK on 投票 (
投票ID ASC
);

/*==============================================================*/
/* Index: 发布投票_FK                                               */
/*==============================================================*/
create index 发布投票_FK on 投票 (
账户ID ASC
);

/*==============================================================*/
/* Table: 投票参与记录                                                */
/*==============================================================*/
create table 投票参与记录 
(
   记录ID                 integer                        not null,
   选项ID                 integer                        not null,
   账户ID                 integer                        not null,
   创建时间                 timestamp                      not null,
   评论                   long varchar                   null,
   constraint PK_投票参与记录 primary key (记录ID)
);

/*==============================================================*/
/* Index: 投票参与记录_PK                                             */
/*==============================================================*/
create unique index 投票参与记录_PK on 投票参与记录 (
记录ID ASC
);

/*==============================================================*/
/* Index: 支持_FK                                                 */
/*==============================================================*/
create index 支持_FK on 投票参与记录 (
选项ID ASC
);

/*==============================================================*/
/* Index: 参与_FK                                                 */
/*==============================================================*/
create index 参与_FK on 投票参与记录 (
账户ID ASC
);

/*==============================================================*/
/* Table: 投票选项                                                  */
/*==============================================================*/
create table 投票选项 
(
   选项ID                 integer                        not null,
   投票ID                 integer                        not null,
   选项图片                 long binary                    null,
   选项描述                 long varchar                   null,
   当前投票人数               integer                        null,
   constraint PK_投票选项 primary key (选项ID)
);

/*==============================================================*/
/* Index: 投票选项_PK                                               */
/*==============================================================*/
create unique index 投票选项_PK on 投票选项 (
选项ID ASC
);

/*==============================================================*/
/* Index: 拥有_FK                                                 */
/*==============================================================*/
create index 拥有_FK on 投票选项 (
投票ID ASC
);

/*==============================================================*/
/* Table: 用户                                                    */
/*==============================================================*/
create table 用户 
(
   账户ID                 integer                        not null,
   账户名                  char(32)                       not null,
   密码                   char(64)                       not null,
   头像                   long binary                    null,
   个人信息                 varchar(1024)                  null,
   constraint PK_用户 primary key clustered (账户ID)
);

/*==============================================================*/
/* Index: 用户_PK                                                 */
/*==============================================================*/
create unique clustered index 用户_PK on 用户 (
账户ID ASC
);

/*==============================================================*/
/* Table: 管理员                                                   */
/*==============================================================*/
create table 管理员 
(
   账户ID                 integer                        not null,
   账户名                  char(32)                       not null,
   密码                   char(64)                       not null,
   管理员ID                integer                        not null,
   constraint PK_管理员 primary key clustered (账户ID)
);

/*==============================================================*/
/* Index: 管理员_PK                                                */
/*==============================================================*/
create unique clustered index 管理员_PK on 管理员 (
账户ID ASC
);

alter table 关注投票
   add constraint FK_关注投票_关注者_投票 foreign key (投票ID)
      references 投票 (投票ID)
      on update restrict
      on delete restrict;

alter table 关注投票
   add constraint FK_关注投票_被关注投票_用户 foreign key (账户ID)
      references 用户 (账户ID)
      on update restrict
      on delete restrict;

alter table 投票
   add constraint FK_投票_发布投票_用户 foreign key (账户ID)
      references 用户 (账户ID)
      on update restrict
      on delete restrict;

alter table 投票参与记录
   add constraint FK_投票参与记录_参与_用户 foreign key (账户ID)
      references 用户 (账户ID)
      on update restrict
      on delete restrict;

alter table 投票参与记录
   add constraint FK_投票参与记录_支持_投票选项 foreign key (选项ID)
      references 投票选项 (选项ID)
      on update restrict
      on delete restrict;

alter table 投票选项
   add constraint FK_投票选项_拥有_投票 foreign key (投票ID)
      references 投票 (投票ID)
      on update restrict
      on delete restrict;

alter table 用户
   add constraint FK_用户_INHERITAN_账户 foreign key (账户ID)
      references 账户 (账户ID)
      on update restrict
      on delete restrict;

alter table 管理员
   add constraint FK_管理员_INHERITAN_账户 foreign key (账户ID)
      references 账户 (账户ID)
      on update restrict
      on delete restrict;

