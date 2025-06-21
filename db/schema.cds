namespace com.sap.learning;

using { 
    cuid,
    managed,
    sap.common.CodeList,
    Country,
    Currency
 } from '@sap/cds/common';

entity Epochs : CodeList {
    key ID: Integer;
}

entity Authors : cuid, managed {
    name        : String(100)           @mandatory;
    dateOfBirth : Date;
    dateOfDeath : Date;
    epoch       : Association to Epochs @assert.target;
    books       : Association to many Books
                      on books.author = $self;
}

annotate Authors with {
    modifiedAt @odata.etag  //Optimistic Locking
};


entity Books : cuid, managed {
    title       : localized String(255) @mandatory;
    author      : Association to Authors @mandatory @assert.target;
    genre       : Genre @assert: true;
    publCountry : Country;
    stock       : NoOfBooks default 0;
    price       : Price;
    isHardcover : Boolean;
}

annotate Books with {
    modifiedAt @odata.etag; //Optimistic Locking
};






define type NoOfBooks : Integer;

// define type Price{
//     amount   : Decimal;
//     currency : String(3);
// }

type Price {
    amount: Decimal;
    currency: Currency;
}

define type Genre : Integer enum{
    fiction     = 1;
    non_fiction = 2;
}







