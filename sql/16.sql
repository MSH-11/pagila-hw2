/*
 * Compute the total revenue for each film.
 * The output should include a new column "rank" that shows the numerical rank
 *
 * HINT:
 * You should use the `rank` window function to complete this task.
 * Window functions are conceptually simple,
 * but have an unfortunately clunky syntax.
 * You can find examples of how to use the `rank` function at
 * <https://www.postgresqltutorial.com/postgresql-window-function/postgresql-rank-function/>.
 */

select 
    RANK () OVER ( 
		ORDER BY COALESCE(SUM(p.amount), 0.00) DESC
	) as rank,
    f.title, 
    COALESCE(SUM(p.amount), 0.00) as revenue
from 
    film f
left join inventory i on f.film_id = i.film_id
left join rental r on i.inventory_id = r.inventory_id
left join payment p on r.rental_id = p.rental_id
group by f.title
order by revenue DESC;
