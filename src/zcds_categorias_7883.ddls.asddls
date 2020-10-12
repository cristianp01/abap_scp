@AbapCatalog.sqlViewName: 'ZVCATEG7883'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Categorías'
define view ZCDS_CATEGORIAS_7883 
as select from ztb_catego_7883 
{

    key bi_categ,
    descripcion
}
