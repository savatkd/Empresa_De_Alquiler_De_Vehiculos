/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     29/08/2021 2:05:30                           */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ALQUILER') and o.name = 'FK_ALQUILER_CLIENTE_A_CLIENTE')
alter table ALQUILER
   drop constraint FK_ALQUILER_CLIENTE_A_CLIENTE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('EMPLEADO') and o.name = 'FK_EMPLEADO_EMPRESA_E_EMPRESA')
alter table EMPLEADO
   drop constraint FK_EMPLEADO_EMPRESA_E_EMPRESA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('FACTURA_SERVICIO') and o.name = 'FK_FACTURA__FACTURA_S_FACTURA')
alter table FACTURA_SERVICIO
   drop constraint FK_FACTURA__FACTURA_S_FACTURA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('FACTURA_SERVICIO') and o.name = 'FK_FACTURA__FACTURA_S_SERVICIO')
alter table FACTURA_SERVICIO
   drop constraint FK_FACTURA__FACTURA_S_SERVICIO
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
   where r.fkeyid = object_id('SERVICIO') and o.name = 'FK_SERVICIO_ALQUILER__ALQUILER')
alter table SERVICIO
   drop constraint FK_SERVICIO_ALQUILER__ALQUILER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SERVICIO') and o.name = 'FK_SERVICIO_CLIENTE_S_CLIENTE')
alter table SERVICIO
   drop constraint FK_SERVICIO_CLIENTE_S_CLIENTE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SERVICIO') and o.name = 'FK_SERVICIO_EMPLEADO__EMPLEADO')
alter table SERVICIO
   drop constraint FK_SERVICIO_EMPLEADO__EMPLEADO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('VEHICULO_SERVICIO') and o.name = 'FK_VEHICULO_VEHICULO__SERVICIO')
alter table VEHICULO_SERVICIO
   drop constraint FK_VEHICULO_VEHICULO__SERVICIO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('VEHICULO_SERVICIO') and o.name = 'FK_VEHICULO_VEHICULO__VEHICULO')
alter table VEHICULO_SERVICIO
   drop constraint FK_VEHICULO_VEHICULO__VEHICULO
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('ALQUILER')
            and   name  = 'CLIENTE_ALQUILER_FK'
            and   indid > 0
            and   indid < 255)
   drop index ALQUILER.CLIENTE_ALQUILER_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ALQUILER')
            and   type = 'U')
   drop table ALQUILER
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CLIENTE')
            and   type = 'U')
   drop table CLIENTE
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('EMPLEADO')
            and   name  = 'EMPRESA_EMPLEADO_FK'
            and   indid > 0
            and   indid < 255)
   drop index EMPLEADO.EMPRESA_EMPLEADO_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('EMPLEADO')
            and   type = 'U')
   drop table EMPLEADO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('EMPRESA')
            and   type = 'U')
   drop table EMPRESA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('FACTURA')
            and   type = 'U')
   drop table FACTURA
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('FACTURA_SERVICIO')
            and   name  = 'FACTURA_SERVICIO_FK'
            and   indid > 0
            and   indid < 255)
   drop index FACTURA_SERVICIO.FACTURA_SERVICIO_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('FACTURA_SERVICIO')
            and   name  = 'FACTURA_SERVICIO2_FK'
            and   indid > 0
            and   indid < 255)
   drop index FACTURA_SERVICIO.FACTURA_SERVICIO2_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('FACTURA_SERVICIO')
            and   type = 'U')
   drop table FACTURA_SERVICIO
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
            and   name  = 'ALQUILER_SERVICIO_FK'
            and   indid > 0
            and   indid < 255)
   drop index SERVICIO.ALQUILER_SERVICIO_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SERVICIO')
            and   name  = 'CLIENTE_SERVICIO_FK'
            and   indid > 0
            and   indid < 255)
   drop index SERVICIO.CLIENTE_SERVICIO_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SERVICIO')
            and   name  = 'EMPLEADO_SERVICIO_FK'
            and   indid > 0
            and   indid < 255)
   drop index SERVICIO.EMPLEADO_SERVICIO_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SERVICIO')
            and   type = 'U')
   drop table SERVICIO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('VEHICULO')
            and   type = 'U')
   drop table VEHICULO
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('VEHICULO_SERVICIO')
            and   name  = 'VEHICULO_SERVICIO_FK'
            and   indid > 0
            and   indid < 255)
   drop index VEHICULO_SERVICIO.VEHICULO_SERVICIO_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('VEHICULO_SERVICIO')
            and   name  = 'VEHICULO_SERVICIO2_FK'
            and   indid > 0
            and   indid < 255)
   drop index VEHICULO_SERVICIO.VEHICULO_SERVICIO2_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('VEHICULO_SERVICIO')
            and   type = 'U')
   drop table VEHICULO_SERVICIO
go

/*==============================================================*/
/* Table: ALQUILER                                              */
/*==============================================================*/
create table ALQUILER (
   ID_ALQUILER          int                  not null,
   ID_CLIENTES          int                  null,
   TIPO_ALQUILER        varchar(20)          not null,
   TIEMPO_ALQUILER      varchar(30)             not null,
   COSTO_ALQUILER       numeric              not null,
   FECHA_DE_INICIO      date             not null,
   FECHA_DE_FIN         date            not null,
   CANTIDA_ALQUILER     varchar(10)          not null,
   constraint PK_ALQUILER primary key nonclustered (ID_ALQUILER)
)
go

/*==============================================================*/
/* Index: CLIENTE_ALQUILER_FK                                   */
/*==============================================================*/
create index CLIENTE_ALQUILER_FK on ALQUILER (
ID_CLIENTES ASC
)
go

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   ID_CLIENTES          int                  not null,
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
/* Table: EMPLEADO                                              */
/*==============================================================*/
create table EMPLEADO (
   ID_EMPLEADO          int                  not null,
   ID                   int                  not null,
   CEDULA_EMPLEADO      char(10)             not null,
   NOMBRE_EMPLEADOS     char(25)             not null,
   APELLIDO_EMPLEADOS   char(25)             not null,
   CELULAR_EMPLEADOS    char(10)             not null,
   CARGO_EMPLEADOS      char(20)             not null,
   ANO_EMPLEADOS        char(10)             not null,
   constraint PK_EMPLEADO primary key nonclustered (ID_EMPLEADO)
)
go


/*==============================================================*/
/* Index: EMPRESA_EMPLEADO_FK                                   */
/*==============================================================*/
create index EMPRESA_EMPLEADO_FK on EMPLEADO (
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
   TOTAL_FACTURA        numeric              not null,
   IVA_FACTURA          numeric              not null,
   DESCUENTO_FACTURA    numeric              not null,
   NUMERO_FACTURA       char(10)             not null,
   FECHA_FACTURA        date             not null,
   HORA_FACTURA         date             not null,
   DANOS_FACTURA        char(30)             not null,
   constraint PK_FACTURA primary key nonclustered (ID_FACTURA)
)
go

/*==============================================================*/
/* Table: FACTURA_SERVICIO                                      */
/*==============================================================*/
create table FACTURA_SERVICIO (
   ID_FACTURA           int                  not null,
   ID_SERVICIO          int                  not null,
   constraint PK_FACTURA_SERVICIO primary key nonclustered (ID_FACTURA, ID_SERVICIO)
)
go

/*==============================================================*/
/* Index: FACTURA_SERVICIO2_FK                                  */
/*==============================================================*/
create index FACTURA_SERVICIO2_FK on FACTURA_SERVICIO (
ID_SERVICIO ASC
)
go

/*==============================================================*/
/* Index: FACTURA_SERVICIO_FK                                   */
/*==============================================================*/
create index FACTURA_SERVICIO_FK on FACTURA_SERVICIO (
ID_FACTURA ASC
)
go

/*==============================================================*/
/* Table: MANTENIMIENTO                                         */
/*==============================================================*/
create table MANTENIMIENTO (
   ID_MANTENIMIENTO     int                  not null,
   ID_VEHICULO          int                  null,
   TIPO_MANTENIMIENTO   char(20)             not null,
   NUMERO_MANTENIMIENTO varchar(10)          not null,
   HORA_MANTENIMIENTO   time             not null,
   DIA_MANTENIMIENTO    varchar(10)             not null,
   GASTO_MANTENIMIENTO  numeric  (6,2)              not null,
   RESPUESTO_MANTENIMIENTO varchar(28)             not null,
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
   CALIFICACIÓN         char(20)              not null,
   PUNTACION            Char(10)              not null,
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
   HORA_RESERVA         time             not null,
   FECHA_RESERVA        date            not null,
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
   ID_EMPLEADO          int                  null,
   ID_CLIENTES          int                  null,
   ID_ALQUILER          int                  null,
   TIPO_SERVICIO        char(30)             not null,
   HORA_SERVICIO        time             not null,
   FECHA_SERVICIO       date             not null,
   constraint PK_SERVICIO primary key nonclustered (ID_SERVICIO)
)
go


/*==============================================================*/
/* Index: EMPLEADO_SERVICIO_FK                                  */
/*==============================================================*/
create index EMPLEADO_SERVICIO_FK on SERVICIO (
ID_EMPLEADO ASC
)
go

/*==============================================================*/
/* Index: CLIENTE_SERVICIO_FK                                   */
/*==============================================================*/
create index CLIENTE_SERVICIO_FK on SERVICIO (
ID_CLIENTES ASC
)
go

/*==============================================================*/
/* Index: ALQUILER_SERVICIO_FK                                  */
/*==============================================================*/
create index ALQUILER_SERVICIO_FK on SERVICIO (
ID_ALQUILER ASC
)
go

/*==============================================================*/
/* Table: VEHICULO                                              */
/*==============================================================*/
create table VEHICULO (
   ID_VEHICULO          int                  not null,
   MARCA_VEHICULO       char(20)             not null,
   TIPO_VEHICULO        char(20)             not null,
   PLACA_VEHICULO       char(7)              not null,
   COLOR_VEHICULO       char(10)             not null,
   ANO_VEHICULO         char(4)              not null,
   ANO_INSTITUCION_V    char(4)             not null,
   CAPACIDAD_MAXIMA_VEHICULO char(2)              not null,
   constraint PK_VEHICULO primary key nonclustered (ID_VEHICULO)
)
go



/*==============================================================*/
/* Table: VEHICULO_SERVICIO                                     */
/*==============================================================*/
create table VEHICULO_SERVICIO (
   ID_SERVICIO          int                  not null,
   ID_VEHICULO          int                  not null,
   constraint PK_VEHICULO_SERVICIO primary key nonclustered (ID_SERVICIO, ID_VEHICULO)
)
go


/*==============================================================*/
/* Index: VEHICULO_SERVICIO2_FK                                 */
/*==============================================================*/
create index VEHICULO_SERVICIO2_FK on VEHICULO_SERVICIO (
ID_VEHICULO ASC
)
go

/*==============================================================*/
/* Index: VEHICULO_SERVICIO_FK                                  */
/*==============================================================*/
create index VEHICULO_SERVICIO_FK on VEHICULO_SERVICIO (
ID_SERVICIO ASC
)
go

alter table ALQUILER
   add constraint FK_ALQUILER_CLIENTE_A_CLIENTE foreign key (ID_CLIENTES)
      references CLIENTE (ID_CLIENTES)
go

alter table EMPLEADO
   add constraint FK_EMPLEADO_EMPRESA_E_EMPRESA foreign key (ID)
      references EMPRESA (ID)
go

alter table FACTURA_SERVICIO
   add constraint FK_FACTURA__FACTURA_S_FACTURA foreign key (ID_FACTURA)
      references FACTURA (ID_FACTURA)
go

alter table FACTURA_SERVICIO
   add constraint FK_FACTURA__FACTURA_S_SERVICIO foreign key (ID_SERVICIO)
      references SERVICIO (ID_SERVICIO)
go

alter table MANTENIMIENTO
   add constraint FK_MANTENIM_VEHICULO__VEHICULO foreign key (ID_VEHICULO)
      references VEHICULO (ID_VEHICULO)
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
      references VEHICULO (ID_VEHICULO)
go

alter table SERVICIO
   add constraint FK_SERVICIO_ALQUILER__ALQUILER foreign key (ID_ALQUILER)
      references ALQUILER (ID_ALQUILER)
go

alter table SERVICIO
   add constraint FK_SERVICIO_CLIENTE_S_CLIENTE foreign key (ID_CLIENTES)
      references CLIENTE (ID_CLIENTES)
go

alter table SERVICIO
   add constraint FK_SERVICIO_EMPLEADO__EMPLEADO foreign key (ID_EMPLEADO)
      references EMPLEADO (ID_EMPLEADO)
go

alter table VEHICULO_SERVICIO
   add constraint FK_VEHICULO_VEHICULO__SERVICIO foreign key (ID_SERVICIO)
      references SERVICIO (ID_SERVICIO)
go

alter table VEHICULO_SERVICIO
   add constraint FK_VEHICULO_VEHICULO__VEHICULO foreign key (ID_VEHICULO)
      references VEHICULO (ID_VEHICULO)
go

