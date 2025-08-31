using AdminService as service from '../../srv/admin-service';
using from '@sap/cds/common';
using from '../../db/schema';


annotate service.Books with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Title}',
                Value : title,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Genre}',
                Value : genre,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>PublishingCountry}',
                Value : publCountry_code,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Stock}',
                Value : stock,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Price}',
                Value : price_amount,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>CurrencyCode}',
                Value : price_currency_code,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Hardcover}',
                Value : isHardcover,
            },
            {
                $Type : 'UI.DataField',
                Value : author.ID,
                Label : 'Author',
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.CollectionFacet',
            Label : '{i18n>Overview}',
            ID : 'i18nOverview',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    ID : 'GeneratedFacet1',
                    Label : '{i18n>GeneralInformation}',
                    Target : '@UI.FieldGroup#GeneratedGroup',
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : '{i18n>Details}',
                    ID : 'i18nDetails',
                    Target : '@UI.FieldGroup#i18nDetails',
                },
            ],
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>TestToEdit}',
            ID : 'i18nTestToEdit',
            Target : 'texts/@UI.LineItem#i18nTestToEdit',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Title}',
            Value : title,
        },
        {
            $Type : 'UI.DataField',
            Value : stock,
            Label : '{i18n>Stock}',
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Genre}',
            Value : genre,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Price}',
            Value : price_amount,
        },
        {
            $Type : 'UI.DataField',
            Value : author.name,
        },
    ],
    UI.SelectionFields : [
        author.name,
        isHardcover,
        genre,
    ],
    UI.HeaderInfo : {
        Title : {
            $Type : 'UI.DataField',
            Value : title,
        },
        TypeName : '',
        TypeNamePlural : '',
        Description : {
            $Type : 'UI.DataField',
            Value : author.name,
        },
        TypeImageUrl : 'sap-icon:\\alert',
    },
    UI.FieldGroup #i18nDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : createdAt,
            },
            {
                $Type : 'UI.DataField',
                Value : createdBy,
            },
            {
                $Type : 'UI.DataField',
                Value : modifiedAt,
            },
            {
                $Type : 'UI.DataField',
                Value : modifiedBy,
            },
            {
                $Type : 'UI.DataField',
                Value : publCountry.name,
            },
        ],
    },
);

annotate service.Books with {
    author @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Authors',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : author_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'dateOfBirth',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'dateOfDeath',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'epoch_ID',
            },
        ],
    }
};

annotate service.Authors with {
    name @(
        Common.Label : '{i18n>Writer}',
        )
};

annotate service.Books with {
    isHardcover @Common.Label : '{i18n>CoverType}'
};

annotate service.Books with {
    genre @Common.Label : '{i18n>Genre}'
};

annotate service.Authors with {
    ID @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Authors',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : ID,
                    ValueListProperty : 'ID',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'name',
                },
            ],
            Label : '{i18n>Author}',
        },
        Common.ValueListWithFixedValues : true,
    )
};

annotate service.Countries with {
    name @(
        Common.Text : descr,
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Countries',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : name,
                    ValueListProperty : 'code',
                },
            ],
        },
        Common.ValueListWithFixedValues : true,
    )
};

annotate service.Countries with {
    code @Common.Text : descr
};

annotate service.Books.texts with @(
    UI.LineItem #i18nTestToEdit : [
        {
            $Type : 'UI.DataField',
            Value : title,
            Label : 'title',
        },
        {
            $Type : 'UI.DataField',
            Value : ID,
            Label : 'ID',
        },
        {
            $Type : 'UI.DataField',
            Value : locale,
            Label : 'locale',
        },
    ]
);

