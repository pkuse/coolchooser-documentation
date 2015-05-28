/*==============================================================*/
/* DBMS name:      Sybase SQL Anywhere 12                       */
/* Created on:     2015/5/19 21:12:49                           */
/*==============================================================*/


if exists(select 1 from sys.sysforeignkey where role='FK_��עͶƱ_��ע��_ͶƱ') then
    alter table ��עͶƱ
       delete foreign key FK_��עͶƱ_��ע��_ͶƱ
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_��עͶƱ_����עͶƱ_�û�') then
    alter table ��עͶƱ
       delete foreign key FK_��עͶƱ_����עͶƱ_�û�
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_ͶƱ_����ͶƱ_�û�') then
    alter table ͶƱ
       delete foreign key FK_ͶƱ_����ͶƱ_�û�
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_ͶƱ�����¼_����_�û�') then
    alter table ͶƱ�����¼
       delete foreign key FK_ͶƱ�����¼_����_�û�
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_ͶƱ�����¼_֧��_ͶƱѡ��') then
    alter table ͶƱ�����¼
       delete foreign key FK_ͶƱ�����¼_֧��_ͶƱѡ��
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_ͶƱѡ��_ӵ��_ͶƱ') then
    alter table ͶƱѡ��
       delete foreign key FK_ͶƱѡ��_ӵ��_ͶƱ
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_�û�_INHERITAN_�˻�') then
    alter table �û�
       delete foreign key FK_�û�_INHERITAN_�˻�
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_����Ա_INHERITAN_�˻�') then
    alter table ����Ա
       delete foreign key FK_����Ա_INHERITAN_�˻�
end if;

drop index if exists ��עͶƱ.��ע��_FK;

drop index if exists ��עͶƱ.����עͶƱ_FK;

drop index if exists ��עͶƱ.��עͶƱ_PK;

drop table if exists ��עͶƱ;

drop index if exists ͶƱ.����ͶƱ_FK;

drop index if exists ͶƱ.ͶƱ_PK;

drop table if exists ͶƱ;

drop index if exists ͶƱ�����¼.����_FK;

drop index if exists ͶƱ�����¼.֧��_FK;

drop index if exists ͶƱ�����¼.ͶƱ�����¼_PK;

drop table if exists ͶƱ�����¼;

drop index if exists ͶƱѡ��.ӵ��_FK;

drop index if exists ͶƱѡ��.ͶƱѡ��_PK;

drop table if exists ͶƱѡ��;

drop index if exists �û�.�û�_PK;

drop table if exists �û�;

drop index if exists ����Ա.����Ա_PK;

drop table if exists ����Ա;

/*==============================================================*/
/* Table: ��עͶƱ                                                  */
/*==============================================================*/
create table ��עͶƱ 
(
   �˻�ID                 integer                        not null,
   ͶƱID                 integer                        not null,
   constraint PK_��עͶƱ primary key clustered (�˻�ID, ͶƱID)
);

/*==============================================================*/
/* Index: ��עͶƱ_PK                                               */
/*==============================================================*/
create unique clustered index ��עͶƱ_PK on ��עͶƱ (
�˻�ID ASC,
ͶƱID ASC
);

/*==============================================================*/
/* Index: ����עͶƱ_FK                                              */
/*==============================================================*/
create index ����עͶƱ_FK on ��עͶƱ (
�˻�ID ASC
);

/*==============================================================*/
/* Index: ��ע��_FK                                                */
/*==============================================================*/
create index ��ע��_FK on ��עͶƱ (
ͶƱID ASC
);

/*==============================================================*/
/* Table: ͶƱ                                                    */
/*==============================================================*/
create table ͶƱ 
(
   ͶƱID                 integer                        not null,
   �˻�ID                 integer                        not null,
   ����ʱ��                 timestamp                      null,
   ��ֹʱ��                 timestamp                      null,
   ״̬                   integer                        null,
   ѡ������                 long varchar                   null,
   constraint PK_ͶƱ primary key (ͶƱID)
);

/*==============================================================*/
/* Index: ͶƱ_PK                                                 */
/*==============================================================*/
create unique index ͶƱ_PK on ͶƱ (
ͶƱID ASC
);

/*==============================================================*/
/* Index: ����ͶƱ_FK                                               */
/*==============================================================*/
create index ����ͶƱ_FK on ͶƱ (
�˻�ID ASC
);

/*==============================================================*/
/* Table: ͶƱ�����¼                                                */
/*==============================================================*/
create table ͶƱ�����¼ 
(
   ��¼ID                 integer                        not null,
   ѡ��ID                 integer                        not null,
   �˻�ID                 integer                        not null,
   ����ʱ��                 timestamp                      not null,
   ����                   long varchar                   null,
   constraint PK_ͶƱ�����¼ primary key (��¼ID)
);

/*==============================================================*/
/* Index: ͶƱ�����¼_PK                                             */
/*==============================================================*/
create unique index ͶƱ�����¼_PK on ͶƱ�����¼ (
��¼ID ASC
);

/*==============================================================*/
/* Index: ֧��_FK                                                 */
/*==============================================================*/
create index ֧��_FK on ͶƱ�����¼ (
ѡ��ID ASC
);

/*==============================================================*/
/* Index: ����_FK                                                 */
/*==============================================================*/
create index ����_FK on ͶƱ�����¼ (
�˻�ID ASC
);

/*==============================================================*/
/* Table: ͶƱѡ��                                                  */
/*==============================================================*/
create table ͶƱѡ�� 
(
   ѡ��ID                 integer                        not null,
   ͶƱID                 integer                        not null,
   ѡ��ͼƬ                 long binary                    null,
   ѡ������                 long varchar                   null,
   ��ǰͶƱ����               integer                        null,
   constraint PK_ͶƱѡ�� primary key (ѡ��ID)
);

/*==============================================================*/
/* Index: ͶƱѡ��_PK                                               */
/*==============================================================*/
create unique index ͶƱѡ��_PK on ͶƱѡ�� (
ѡ��ID ASC
);

/*==============================================================*/
/* Index: ӵ��_FK                                                 */
/*==============================================================*/
create index ӵ��_FK on ͶƱѡ�� (
ͶƱID ASC
);

/*==============================================================*/
/* Table: �û�                                                    */
/*==============================================================*/
create table �û� 
(
   �˻�ID                 integer                        not null,
   �˻���                  char(32)                       not null,
   ����                   char(64)                       not null,
   ͷ��                   long binary                    null,
   ������Ϣ                 varchar(1024)                  null,
   constraint PK_�û� primary key clustered (�˻�ID)
);

/*==============================================================*/
/* Index: �û�_PK                                                 */
/*==============================================================*/
create unique clustered index �û�_PK on �û� (
�˻�ID ASC
);

/*==============================================================*/
/* Table: ����Ա                                                   */
/*==============================================================*/
create table ����Ա 
(
   �˻�ID                 integer                        not null,
   �˻���                  char(32)                       not null,
   ����                   char(64)                       not null,
   ����ԱID                integer                        not null,
   constraint PK_����Ա primary key clustered (�˻�ID)
);

/*==============================================================*/
/* Index: ����Ա_PK                                                */
/*==============================================================*/
create unique clustered index ����Ա_PK on ����Ա (
�˻�ID ASC
);

alter table ��עͶƱ
   add constraint FK_��עͶƱ_��ע��_ͶƱ foreign key (ͶƱID)
      references ͶƱ (ͶƱID)
      on update restrict
      on delete restrict;

alter table ��עͶƱ
   add constraint FK_��עͶƱ_����עͶƱ_�û� foreign key (�˻�ID)
      references �û� (�˻�ID)
      on update restrict
      on delete restrict;

alter table ͶƱ
   add constraint FK_ͶƱ_����ͶƱ_�û� foreign key (�˻�ID)
      references �û� (�˻�ID)
      on update restrict
      on delete restrict;

alter table ͶƱ�����¼
   add constraint FK_ͶƱ�����¼_����_�û� foreign key (�˻�ID)
      references �û� (�˻�ID)
      on update restrict
      on delete restrict;

alter table ͶƱ�����¼
   add constraint FK_ͶƱ�����¼_֧��_ͶƱѡ�� foreign key (ѡ��ID)
      references ͶƱѡ�� (ѡ��ID)
      on update restrict
      on delete restrict;

alter table ͶƱѡ��
   add constraint FK_ͶƱѡ��_ӵ��_ͶƱ foreign key (ͶƱID)
      references ͶƱ (ͶƱID)
      on update restrict
      on delete restrict;

alter table �û�
   add constraint FK_�û�_INHERITAN_�˻� foreign key (�˻�ID)
      references �˻� (�˻�ID)
      on update restrict
      on delete restrict;

alter table ����Ա
   add constraint FK_����Ա_INHERITAN_�˻� foreign key (�˻�ID)
      references �˻� (�˻�ID)
      on update restrict
      on delete restrict;

