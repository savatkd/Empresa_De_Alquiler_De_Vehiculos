/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     29/06/2021 9:40:05                           */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ALQUILER') and o.name = 'FK_ALQUILER_VEHICULO__VEHICULO')
alter table ALQUILER
   drop constraint FK_ALQUILER_VEHICULO__VEHICULO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CLIENTE') and o.name = 'FK_CLIENTE_EMPLEADOS_EMPLEADO')
alter table CLIENTE
   drop constraint FK_CLIENTE_EMPLEADOS_EMPLEADO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('DETALLE_FACTURA') and o.name = 'FK_DETALLE__ALQUILER__ALQUILER')
alter table DETALLE_FACTURA
   drop constraint FK_DETALLE__ALQUILER__ALQUILER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('DETALLE_FACTURA') and o.name = 'FK_DETALLE__SERVICIO__SERVICIO')
alter table DETALLE_FACTURA
   drop constraint FK_DETALLE__SERVICIO__SERVICIO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('EMPLEADOS') and o.name = 'FK_EMPLEADO_EMPRESA_T_EMPRESA')
alter table EMPLEADOS
   drop constraint FK_EMPLEADO_EMPRESA_T_EMPRESA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('FACTURA') and o.name = 'FK_FACTURA_CLIENTE_F_CLIENTE')
alter table FACTURA
   drop constraint FK_FACTURA_CLIENTE_F_CLIENTE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('FACTURA') and o.name = 'FK_FACTURA_DETALLE_F_DETALLE_')
alter table FACTURA
   drop constraint FK_FACTURA_DETALLE_F_DETALLE_
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('MANTENIMIENTO') and o.name = 'FK_MANTENIM_VEHICULO__VEHICULO')
alter table MANTENIMIENTO
   drop constraint FK_MANTENIM_VEHICULO__VEHICULO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('OBSERVACION') and o.name = 'FK_OBSERVAC_CLIENTE_T_CLIENTE')
alter table OBSERVACION
   drop constraint FK_OBSERVAC_CLIENTE_T_CLIENTE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('RESERVAR') and o.name = 'FK_RESERVAR_CLIENTE_R_CLIENTE')
alter table RESERVAR
   drop constraint FK_RESERVAR_CLIENTE_R_CLIENTE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('RESERVAR') and o.name = 'FK_RESERVAR_VEHICULO__VEHICULO')
alter table RESERVAR
   drop constraint FK_RESERVAR_VEHICULO__VEHICULO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SERVICIO') and o.name = 'FK_SERVICIO_VEHICULO__VEHICULO')
alter table SERVICIO
   drop constraint FK_SERVICIO_VEHICULO__VEHICULO
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('ALQUILER')
            and   name  = 'VEHICULO_ALQUILER_FK'
            and   indid > 0
            and   indid < 255)
   drop index ALQUILER.VEHICULO_ALQUILER_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ALQUILER')
            and   type = 'U')
   drop table ALQUILER
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CLIENTE')
            and   name  = 'EMPLEADOS_TIENE_FK'
            and   indid > 0
            and   indid < 255)
   drop index CLIENTE.EMPLEADOS_TIENE_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CLIENTE')
            and   type = 'U')
   drop table CLIENTE
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('DETALLE_FACTURA')
            and   name  = 'SERVICIO_DETALLE_FACTURA_FK'
            and   indid > 0
            and   indid < 255)
   drop index DETALLE_FACTURA.SERVICIO_DETALLE_FACTURA_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('DETALLE_FACTURA')
            and   name  = 'ALQUILER_DETALLE_FACTURA_FK'
            and   indid > 0
            and   indid < 255)
   drop index DETALLE_FACTURA.ALQUILER_DETALLE_FACTURA_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('DETALLE_FACTURA')
            and   type = 'U')
   drop table DETALLE_FACTURA
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('EMPLEADOS')
            and   name  = 'EMPRESA_TIENE_FK'
            and   indid > 0
            and   indid < 255)
   drop index EMPLEADOS.EMPRESA_TIENE_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('EMPLEADOS')
            and   type = 'U')
   drop table EMPLEADOS
go

if exists (select 1
            from  sysobjects
           where  id = object_id('EMPRESA')
            and   type = 'U')
   drop table EMPRESA
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('FACTURA')
            and   name  = 'DETALLE_FACTURA_FK'
            and   indid > 0
            and   indid < 255)
   drop index FACTURA.DETALLE_FACTURA_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('FACTURA')
            and   name  = 'CLIENTE_FACTURA_FK'
            and   indid > 0
            and   indid < 255)
   drop index FACTURA.CLIENTE_FACTURA_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('FACTURA')
            and   type = 'U')
   drop table FACTURA
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('MANTENIMIENTO')
            and   name  = 'VEHICULO_MANTENIIMIENTO_FK'
            and   indid > 0
            and   indid < 255)
   drop index MANTENIMIENTO.VEHICULO_MANTENIIMIENTO_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('MANTENIMIENTO')
            and   type = 'U')
   drop table MANTENIMIENTO
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('OBSERVACION')
            and   name  = 'CLIENTE_TIENE_FK'
            and   indid > 0
            and   indid < 255)
   drop index OBSERVACION.CLIENTE_TIENE_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('OBSERVACION')
            and   type = 'U')
   drop table OBSERVACION
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('RESERVAR')
            and   name  = 'VEHICULO_RESERVAR_FK'
            and   indid > 0
            and   indid < 255)
   drop index RESERVAR.VEHICULO_RESERVAR_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('RESERVAR')
            and   name  = 'CLIENTE_RESERVA_FK'
            and   indid > 0
            and   indid < 255)
   drop index RESERVAR.CLIENTE_RESERVA_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('RESERVAR')
            and   type = 'U')
   drop table RESERVAR
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SERVICIO')
            and   name  = 'VEHICULO_SERVICIO_FK'
            and   indid > 0
            and   indid < 255)
   drop index SERVICIO.VEHICULO_SERVICIO_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SERVICIO')
            and   type = 'U')
   drop table SERVICIO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('VEHICULOS')
            and   type = 'U')
   drop table VEHICULOS
go

/*==============================================================*/
/* Table: ALQUILER                                              */
/*==============================================================*/
create table ALQUILER (
   ID_ALQUILER          int                  not null,
   ID_VEHICULO          int                  null,
   TIPO_ALQUILER        char(20)             not null,
   TIEMPO_ALQUILER      char(20)				 not null,
   COSTO_ALQUILER       money              not null,
   FECHA_DE_INICIO      date                 not null,
   FECHA_DE_FIN         date                 not null,
   constraint PK_ALQUILER primary key nonclustered (ID_ALQUILER)
)
go

/*==============================================================*/
/* Index: VEHICULO_ALQUILER_FK                                  */
/*==============================================================*/
create index VEHICULO_ALQUILER_FK on ALQUILER (
ID_VEHICULO ASC
)
go

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   ID_CLIENTES          int                  not null,
   ID_EMPLEADOS         int                  null,
   CEDULA_CLIENTES      char(10)             not null,
   NOMBRES_CLIENTES     char(40)             not null,
   APELLIDO_CLIENTES    char(40)             not null,
   CELULAR_CLIENTES     char(10)             not null,
   CIUDAD_CLIENTE       char(25)             not null,
   DIRECCION_CLIENTE    char(30)             not null,
   TIPO_LICENCIA_CLIENTES char(20)             not null,
   CORREO_CLIENTES      char(35)             not null,
   constraint PK_CLIENTE primary key nonclustered (ID_CLIENTES)
)
go

/*==============================================================*/
/* Index: EMPLEADOS_TIENE_FK                                    */
/*==============================================================*/
create index EMPLEADOS_TIENE_FK on CLIENTE (
ID_EMPLEADOS ASC
)
go

/*==============================================================*/
/* Table: DETALLE_FACTURA                                       */
/*==============================================================*/
create table DETALLE_FACTURA (
   ID_DETALLE_FACTURA   int					 not null,
   ID_ALQUILER          int                  not null,
   ID_SERVICIO          int                  not null,
   IVA                  numeric              not null,
   VALOR                money              not null,
   TOTAL                money              not null,
   constraint PK_DETALLE_FACTURA primary key nonclustered (ID_DETALLE_FACTURA)
)
go

/*==============================================================*/
/* Index: ALQUILER_DETALLE_FACTURA_FK                           */
/*==============================================================*/
create index ALQUILER_DETALLE_FACTURA_FK on DETALLE_FACTURA (
ID_ALQUILER ASC
)
go

/*==============================================================*/
/* Index: SERVICIO_DETALLE_FACTURA_FK                           */
/*==============================================================*/
create index SERVICIO_DETALLE_FACTURA_FK on DETALLE_FACTURA (
ID_SERVICIO ASC
)
go

/*==============================================================*/
/* Table: EMPLEADOS                                             */
/*==============================================================*/
create table EMPLEADOS (
   ID_EMPLEADOS         int                  not null,
   ID                   int                  not null,
   CEDULA_EMPLEADOS     char(10)             not null,
   NOMBRE_EMPLEADOS     char(25)             not null,
   APELLIDO_EMPLEADOS   char(25)             not null,
   CELULAR_EMPLEADOS    char(10)             not null,
   CARGO_EMPLEADOS      char(20)             not null,
   ANO_EMPLEADOS        char(10)             not null,
   constraint PK_EMPLEADOS primary key nonclustered (ID_EMPLEADOS)
)
go

/*==============================================================*/
/* Index: EMPRESA_TIENE_FK                                      */
/*==============================================================*/
create index EMPRESA_TIENE_FK on EMPLEADOS (
ID ASC
)
go

/*==============================================================*/
/* Table: EMPRESA                                               */
/*==============================================================*/
create table EMPRESA (
   ID                   int                  not null,
   NOMBRE_EMPRESA       char(30)             not null,
   CIUDAD_EMPRESA       char(10)             not null,
   DIRECCION_EMPRESA    char(30)             not null,
   CORREO_EMPRESA       char(25)             not null,
   CELULAR_EMPRESA      char(10)             not null,
   constraint PK_EMPRESA primary key nonclustered (ID)
)
go

/*==============================================================*/
/* Table: FACTURA                                               */
/*==============================================================*/
create table FACTURA (
   ID_FACTURA           int                  not null,
   ID_CLIENTES          int                  null,
   ID_DETALLE_FACTURA   char(10)             null,
   TOTAL_FACTURA        money              not null,
   IVA_FACTURA          numeric              not null,
   DESCUENTO_FACTURA    numeric              not null,
   NUMERO_FACTURA       char(10)             not null,
   FECHA_FACTURA        date            not null,
   HORA_FACTURA         time             not null,
   DANOS_FACTURA        char(30)             not null,
   constraint PK_FACTURA primary key nonclustered (ID_FACTURA)
)
go

/*==============================================================*/
/* Index: CLIENTE_FACTURA_FK                                    */
/*==============================================================*/
create index CLIENTE_FACTURA_FK on FACTURA (
ID_CLIENTES ASC
)
go

/*==============================================================*/
/* Index: DETALLE_FACTURA_FK                                    */
/*==============================================================*/
create index DETALLE_FACTURA_FK on FACTURA (
ID_DETALLE_FACTURA ASC
)
go

/*==============================================================*/
/* Table: MANTENIMIENTO                                         */
/*==============================================================*/
create table MANTENIMIENTO (
   ID_MANTENIMIENTO     int                  not null,
   ID_VEHICULO          int                  null,
   TIPO_MANTENIMIENTO   char(20)             not null,
   HORA_MANTENIMIENTO   time             not null,
   DIA_MANTENIMIENTO    char(5)             not null,
   GASTO_MANTENIMIENTO  money                not null,
   RESPUESTO_MANTENIMIENTO char(28)             not null,
   constraint PK_MANTENIMIENTO primary key nonclustered (ID_MANTENIMIENTO)
)
go

/*==============================================================*/
/* Index: VEHICULO_MANTENIIMIENTO_FK                            */
/*==============================================================*/
create index VEHICULO_MANTENIIMIENTO_FK on MANTENIMIENTO (
ID_VEHICULO ASC
)
go

/*==============================================================*/
/* Table: OBSERVACION                                           */
/*==============================================================*/
create table OBSERVACION (
   ID_OBSERVACION       int                  not null,
   ID_CLIENTES          int                  null,
   BUENO                char(2)              not null,
   REGULAR              char(2)              not null,
   EXCELENTE            char(2)              not null,
   constraint PK_OBSERVACION primary key nonclustered (ID_OBSERVACION)
)
go

/*==============================================================*/
/* Index: CLIENTE_TIENE_FK                                      */
/*==============================================================*/
create index CLIENTE_TIENE_FK on OBSERVACION (
ID_CLIENTES ASC
)
go

/*==============================================================*/
/* Table: RESERVAR                                              */
/*==============================================================*/
create table RESERVAR (
   ID_RESERVAR          int                  not null,
   ID_CLIENTES          int                  null,
   ID_VEHICULO          int                  null,
   TIPO_RESERVA         char(25)             not null,
   HORA_RESERVA         datetime             not null,
   FECHA_RESERVA        datetime             not null,
   MEDIO_DE_RESERVA     char(25)             not null,
   constraint PK_RESERVAR primary key nonclustered (ID_RESERVAR)
)
go

/*==============================================================*/
/* Index: CLIENTE_RESERVA_FK                                    */
/*==============================================================*/
create index CLIENTE_RESERVA_FK on RESERVAR (
ID_CLIENTES ASC
)
go

/*==============================================================*/
/* Index: VEHICULO_RESERVAR_FK                                  */
/*==============================================================*/
create index VEHICULO_RESERVAR_FK on RESERVAR (
ID_VEHICULO ASC
)
go

/*==============================================================*/
/* Table: SERVICIO                                              */
/*==============================================================*/
create table SERVICIO (
   ID_SERVICIO          int                  not null,
   ID_VEHICULO          int                  null,
   TIPO_SERVICIO        char(30)             not null,
   HORA_SERVICIO        time             not null,
   FECHA_SERVICIO       date             not null,
   constraint PK_SERVICIO primary key nonclustered (ID_SERVICIO)
)
go

/*==============================================================*/
/* Index: VEHICULO_SERVICIO_FK                                  */
/*==============================================================*/
create index VEHICULO_SERVICIO_FK on SERVICIO (
ID_VEHICULO ASC
)
go

/*==============================================================*/
/* Table: VEHICULOS                                             */
/*==============================================================*/
create table VEHICULOS (
   ID_VEHICULO          int                  not null,
   MARCA_VEHICULO       char(20)             null,
   TIPO_VEHICULO        char(20)             null,
   PLACA_VEHICULO       char(7)              null,
   COLOR_VEHICULO       char(10)             null,
   ANO_VEHICULO         char(4)              null,
   CAPACIDAD_MAXIMA_VEHICULO char(2)              null,
   constraint PK_VEHICULOS primary key nonclustered (ID_VEHICULO)
)
go

alter table ALQUILER
   add constraint FK_ALQUILER_VEHICULO__VEHICULO foreign key (ID_VEHICULO)
      references VEHICULOS (ID_VEHICULO)
go

alter table CLIENTE
   add constraint FK_CLIENTE_EMPLEADOS_EMPLEADO foreign key (ID_EMPLEADOS)
      references EMPLEADOS (ID_EMPLEADOS)
go

alter table DETALLE_FACTURA
   add constraint FK_DETALLE__ALQUILER__ALQUILER foreign key (ID_ALQUILER)
      references ALQUILER (ID_ALQUILER)
go

alter table DETALLE_FACTURA
   add constraint FK_DETALLE__SERVICIO__SERVICIO foreign key (ID_SERVICIO)
      references SERVICIO (ID_SERVICIO)
go

alter table EMPLEADOS
   add constraint FK_EMPLEADO_EMPRESA_T_EMPRESA foreign key (ID)
      references EMPRESA (ID)
go

alter table FACTURA
   add constraint FK_FACTURA_CLIENTE_F_CLIENTE foreign key (ID_CLIENTES)
      references CLIENTE (ID_CLIENTES)
go

alter table FACTURA
   add constraint FK_FACTURA_DETALLE_F_DETALLE_ foreign key (ID_DETALLE_FACTURA)
      references DETALLE_FACTURA (ID_DETALLE_FACTURA)
go

alter table MANTENIMIENTO
   add constraint FK_MANTENIM_VEHICULO__VEHICULO foreign key (ID_VEHICULO)
      references VEHICULOS (ID_VEHICULO)
go

alter table OBSERVACION
   add constraint FK_OBSERVAC_CLIENTE_T_CLIENTE foreign key (ID_CLIENTES)
      references CLIENTE (ID_CLIENTES)
go

alter table RESERVAR
   add constraint FK_RESERVAR_CLIENTE_R_CLIENTE foreign key (ID_CLIENTES)
      references CLIENTE (ID_CLIENTES)
go

alter table RESERVAR
   add constraint FK_RESERVAR_VEHICULO__VEHICULO foreign key (ID_VEHICULO)
      references VEHICULOS (ID_VEHICULO)
go

alter table SERVICIO
   add constraint FK_SERVICIO_VEHICULO__VEHICULO foreign key (ID_VEHICULO)
      references VEHICULOS (ID_VEHICULO)
go

