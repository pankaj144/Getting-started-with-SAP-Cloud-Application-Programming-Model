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
        books              : Association to many Books
                             on books.author = $self;
        name               : String(20);
        epoch              : Association to Epochs;
        dateOfBirth        : Date;
        dateofDeath        : Date;
}


entity Books : cuid, managed {
    title       : localized String(255);
    author      : Association to Authors;
    genre       : Genre;
    publCountry : Country;
    stock       : NoOfBooks;
    price       : Price;
    isHardcover : Boolean;
}






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







