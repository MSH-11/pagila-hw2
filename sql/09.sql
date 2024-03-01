/*
 * Count the number of movies that contain each type of special feature.
 * Order the results alphabetically be the special_feature.
 */

select unnest(film.special_features) as special_features, count(*) as count
from film
group by unnest(film.special_features)
order by unnest(film.special_features);

