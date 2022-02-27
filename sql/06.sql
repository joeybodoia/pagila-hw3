/*
 * This question and the next one are inspired by the Bacon Number:
 * https://en.wikipedia.org/wiki/Six_Degrees_of_Kevin_Bacon#Bacon_numbers
 *
 * List all actors with Bacall Number 1.
 * That is, list all actors that have appeared in a film with 'RUSSELL BACALL'.
 * Do not list 'RUSSELL BACALL', since he has a Bacall Number of 0.
 */

select first_name || ' ' || last_name as "Actor Name"
from actor
join film_actor using (actor_id)
where film_id in (
    select film_id from film_actor
    join actor a using (actor_id)
    where a.first_name || ' ' || a.last_name  = 'RUSSELL BACALL'
)
and first_name || ' ' || last_name != 'RUSSELL BACALL' 
group by "Actor Name"
order by "Actor Name";


-- or (self join solution -> joining same table on left and right hand side of join operator):
-- note: with a self join, you cannot use the USING clause
/*
select DISTINCT a1.first_name || ' ' || a1.last_name as "Actor Name"
from actor a1
join film_actor fa1 on (a1.actor_id=fa1.actor_id)
join film_actor fa2 on (fa1.film_id=fa2.film_id)
join actor a2 on (fa2.actor_id = a2.actor_id)
where a2.first_name || ' ' || a2.last_name = 'RUSSELL BACALL'
and a1.first_name || ' ' || a1.last_name != 'RUSSELL BACALL'
order by "Actor Name";
*/



--films russel bacall has been in
/*
select first_name || ' ' || last_name as "Actor Name", film_id from film_actor
join actor a using (actor_id)
where a.first_name || ' ' || a.last_name  = 'RUSSELL BACALL';
*/

