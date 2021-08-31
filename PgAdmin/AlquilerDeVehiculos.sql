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
   constraint PK_ALQUILER primary key (ID_ALQUILER)
);

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
   constraint PK_CLIENTE primary key (ID_CLIENTES)
);

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
   constraint PK_EMPLEADO primary key (ID_EMPLEADO)
);

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
   constraint PK_EMPRESA primary key (ID)
);

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
   HORA_FACTURA         char(10)             not null,
   DANOS_FACTURA        char(30)             not null,
   constraint PK_FACTURA primary key (ID_FACTURA)
);

/*==============================================================*/
/* Table: FACTURA_SERVICIO                                      */
/*==============================================================*/
create table FACTURA_SERVICIO (
   ID_FACTURA           int                  not null,
   ID_SERVICIO          int                  not null,
   constraint PK_FACTURA_SERVICIO primary key (ID_FACTURA, ID_SERVICIO)
);

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
   constraint PK_MANTENIMIENTO primary key (ID_MANTENIMIENTO)
);

/*==============================================================*/
/* Table: OBSERVACION                                           */
/*==============================================================*/
create table OBSERVACION (
   ID_OBSERVACION       int                  not null,
   ID_CLIENTES          int                  null,
   CALIFICACIÓN         char(20)              not null,
   PUNTACION            Char(10)              not null,
   constraint PK_OBSERVACION primary key (ID_OBSERVACION)
);

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
   constraint PK_RESERVAR primary key (ID_RESERVAR)
);

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
   constraint PK_SERVICIO primary key (ID_SERVICIO)
);

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
   constraint PK_VEHICULO primary key (ID_VEHICULO)
);

/*==============================================================*/
/* Table: VEHICULO_SERVICIO                                     */
/*==============================================================*/
create table VEHICULO_SERVICIO (
   ID_SERVICIO          int                  not null,
   ID_VEHICULO          int                  not null,
   constraint PK_VEHICULO_SERVICIO primary key (ID_SERVICIO, ID_VEHICULO)
);

alter table ALQUILER
   add constraint FK_ALQUILER_CLIENTE_A_CLIENTE foreign key (ID_CLIENTES)
      references CLIENTE (ID_CLIENTES);

alter table EMPLEADO
   add constraint FK_EMPLEADO_EMPRESA_E_EMPRESA foreign key (ID)
      references EMPRESA (ID);

alter table FACTURA_SERVICIO
   add constraint FK_FACTURA__FACTURA_S_FACTURA foreign key (ID_FACTURA)
      references FACTURA (ID_FACTURA);

alter table FACTURA_SERVICIO
   add constraint FK_FACTURA__FACTURA_S_SERVICIO foreign key (ID_SERVICIO)
      references SERVICIO (ID_SERVICIO);

alter table MANTENIMIENTO
   add constraint FK_MANTENIM_VEHICULO__VEHICULO foreign key (ID_VEHICULO)
      references VEHICULO (ID_VEHICULO);

alter table OBSERVACION
   add constraint FK_OBSERVAC_CLIENTE_T_CLIENTE foreign key (ID_CLIENTES)
      references CLIENTE (ID_CLIENTES);

alter table RESERVAR
   add constraint FK_RESERVAR_CLIENTE_R_CLIENTE foreign key (ID_CLIENTES)
      references CLIENTE (ID_CLIENTES);

alter table RESERVAR
   add constraint FK_RESERVAR_VEHICULO__VEHICULO foreign key (ID_VEHICULO)
      references VEHICULO (ID_VEHICULO);

alter table SERVICIO
   add constraint FK_SERVICIO_ALQUILER__ALQUILER foreign key (ID_ALQUILER)
      references ALQUILER (ID_ALQUILER);

alter table SERVICIO
   add constraint FK_SERVICIO_CLIENTE_S_CLIENTE foreign key (ID_CLIENTES)
      references CLIENTE (ID_CLIENTES);

alter table SERVICIO
   add constraint FK_SERVICIO_EMPLEADO__EMPLEADO foreign key (ID_EMPLEADO)
      references EMPLEADO (ID_EMPLEADO);

alter table VEHICULO_SERVICIO
   add constraint FK_VEHICULO_VEHICULO__SERVICIO foreign key (ID_SERVICIO)
      references SERVICIO (ID_SERVICIO);

alter table VEHICULO_SERVICIO
   add constraint FK_VEHICULO_VEHICULO__VEHICULO foreign key (ID_VEHICULO)
      references VEHICULO (ID_VEHICULO);

