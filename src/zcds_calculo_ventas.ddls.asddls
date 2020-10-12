@AbapCatalog.sqlViewName: 'ZVCALC_VTAS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Cálculo Ventas'
define view zcds_calculo_ventas
  as select from ztb_clt_lib_7883
{
  id_libros,
  count( * ) as cantidad_vendida
}
group by
  id_libros
