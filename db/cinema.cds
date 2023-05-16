//core data service

// using {cuid} from '@sap/cds/common';

namespace cinema;

entity Rooms { 
    key ID: Integer @cds.auto;
    NAME: String(64); 
    CAPACITY : Integer; 
};


entity Movies {
    key ID : Integer @cds.auto;
    NAME : String(64);
    PRICE : Price;
    GENRE : Genre;
};

type Price : Decimal(5, 2);

type Genre : String enum {
    action;
    comedy;
    drama;
    fantasy;
    horror;
    mystery;
    romance;
    thriller;
};
entity Actors { 
    key  ID: Integer @cds.auto;
    NAME  : String(64); 
};


entity Movie_to_room_mappings {
    key DAY: Date @odata.Type:'Edm.String';
    key START_TIME: Timestamp @odata.Type:'Edm.String';
    key MOVIE_ID: Association to one Movies;
    key ROOM_ID: Association to one Rooms;
};
