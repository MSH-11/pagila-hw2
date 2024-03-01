/*
 * List the title of all movies that have both the 'Behind the Scenes' and the 'Trailers' special_feature
 *
 * HINT:
 * Create a select statement that lists the titles of all tables with the 'Behind the Scenes' special_feature.
 * Create a select statement that lists the titles of all tables with the 'Trailers' special_feature.
 * Inner join the queries above.
 */

select distinct bts.title
from (
    select title, unnest(special_features) as special_feature
    from film 
     ) as bts

join (
    select title
    from (
        select title, unnest(special_features) as special_feature
        from film) as sub1
    where special_feature = 'Trailers') as trailers on bts.title = trailers.title

where bts.special_feature = 'Behind the Scenes';
