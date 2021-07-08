/* por cada mes cuanto es el total de facturas que se han generado y el dinero que se ha ingresado */


select top (5) NOMBRE_EMPRESA, TIPO_SERVICIO, FECHA_FACTURA ,  sum (TOTAL_FACTURA*IVA_FACTURA) as Ingreso_Mes  
from  EMPRESA, SERVICIO  inner join FACTURA on SERVICIO.ID_SERVICIO=FACTURA.ID_FACTURA 
where SERVICIO.ID_SERVICIO=FACTURA.ID_FACTURA
group by NOMBRE_EMPRESA, TIPO_SERVICIO, FECHA_FACTURA
order by Ingreso_Mes;
