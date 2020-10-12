@AbapCatalog.sqlViewName: 'ZMVCLIENTES'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Clientes'
@Metadata.allowExtensions: true
//@AbapCatalog.dataMaintenance: #DISPLAY_ONLY
define view zcds_clientes
  as select from ztb_cliente_7883 clientes
  association [1] to ztb_clt_lib_7883 as clnts on clnts.id_cliente = clientes.id_cliente
{
  key clnts.id_libros,
  key clientes.id_cliente,
  key tipo_acceso                               as Acceso,
      nombre,
      apellidos,
      email,
      url,
      concat_with_space( nombre, apellidos, 1 ) as nombrecompleto
}
