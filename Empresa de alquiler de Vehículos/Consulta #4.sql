/*todos lo vechiculos cuantos años lleva en la institución y ordenarlo de mayor a menor */


select  NOMBRE_EMPRESA, MARCA_VEHICULO, PLACA_VEHICULO, ANO_VEHICULO, ANO_INSTITUCION_V
from EMPRESA, CLIENTE inner join VEHICULO
on CLIENTE.ID_CLIENTES= VEHICULO.ID_VEHICULO
where VEHICULO.MARCA_VEHICULO=MARCA_VEHICULO
order by  ANO_INSTITUCION_V desc;


