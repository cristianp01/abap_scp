@AbapCatalog.sqlViewName: 'ZVLIBROS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Libros'
@Metadata.allowExtensions: true

define view zcds_libros
  as select from    ztb_libros_7883  as libros

    join            ztb_catego_7883  as _categ   on libros.bi_categ = _categ.bi_categ
    left outer join ztb_clt_lib_7883 as _Clt_Lbo on libros.id_libros = _Clt_Lbo.id_libros
  association [0..*] to zcds_clientes       as _Clientes  on $projection.id_cliente = _Clientes.id_cliente
  association [1]    to zcds_calculo_ventas as _calc_vtas on libros.id_libros = _calc_vtas.id_libros
{
  key libros.id_libros as IdLibro,
      libros.bi_categ  as Categoria,
      _categ.descripcion,
      titulo           as Titulo,
      autor            as Autor,
      editorial        as Editorial,
      idioma           as Idioma,
      paginas          as CantPag,
      @Semantics.amount.currencyCode: 'moneda'
      precio           as Precio,
      @Semantics.currencyCode: true
      moneda           as Moneda,
      formato          as Formato,
      url              as Imagen,
      _Clt_Lbo.id_cliente,
      //      @UI.hidden: true
      //      _Clt_Lbo.id_libros,

      case
        when _calc_vtas.cantidad_vendida = 0
            then 0
        when _calc_vtas.cantidad_vendida between 1 and 5
            then 1
         when _calc_vtas.cantidad_vendida between 6 and 15
            then 2
         when _calc_vtas.cantidad_vendida > 15
            then 3
       end             as nivel_ventas,
      ''               as Estado,
      _Clientes
}
