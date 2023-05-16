using cinema as db from '../db/cinema';

service CinemaAdmin {
    entity Rooms as projection on db.Rooms;

    //select when clauza
    entity Movies as select from db.Movies;

    entity Actors as select from db.Actors;
    
    entity Movie_to_room_mappings as select from db.Movie_to_room_mappings;
}
