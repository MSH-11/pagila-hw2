/*
 * List the name of all actors who have appeared in a movie that has the 'Behind the Scenes' special_feature
 */

select distinct a.first_name || ' ' || a.last_name as "Actor Name"
from actor a
join film_actor fa using(actor_id)
where fa.film_id in (
    select film_id 
    from (
        select film_id, unnest(special_features) as special_feature
        from film) as feature
    where special_feature = 'Behind the Scenes'
    )
order by "Actor Name";
