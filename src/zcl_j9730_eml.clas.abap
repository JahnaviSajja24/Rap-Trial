CLASS zcl_j9730_eml DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .

    CONSTANTS c_agency_id TYPE /dmo/agency_id VALUE '070050'.
    CONSTANTS c_travel_id TYPE /dmo/travel_id VALUE '00009553'.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_J9730_EML IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
   READ ENTITIES OF ZJ9730_R_TRAVEL
    ENTITY Travel
    ALL FIELDS WITH VALUE #( ( AgencyID = c_agency_id TravelID = c_travel_id ) )
    RESULT DATA(travels)
    FAILED DATA(failed).

    If failed IS NOT INITIAL.
    out->write( `Error retrieving the travel` ).
    ELSE.
     MODIFY ENTITIES OF ZJ9730_R_TRAVEL
     ENTITY Travel
     UPDATE FIELDS ( Description )
     with VALUE #( ( AgencyID = c_agency_id TravelID = c_travel_id  Description = 'My new Description' ) )
     FAILED failed.
     ENDIF.
     IF failed is INITIAL.
      COMMIT ENTITIES.
     out->write( 'Description updated successfully' ).
     ELSE.
     ROLLBACK ENTITIES.
     out->write( '`Error updating the description' ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
