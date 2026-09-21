@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection for root entity'
@Metadata.ignorePropagatedAnnotations: true
@Search.searchable: true
@Metadata.allowExtensions: true
define root view entity ZJ9730_C_TRAVEL
  provider contract transactional_query as projection on ZJ9730_R_TRAVEL
{
    key AgencyId,
    key TravelId,
    @Search.defaultSearchElement: true
    Description,
    @Search.defaultSearchElement: true
    CustomerId,
    BeginDate,
    EndDate,
    Status,
    ChangedAt,
    ChangedBy
}
