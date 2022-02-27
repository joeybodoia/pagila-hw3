/*
 * Compute the country with the most customers in it. 
 */



select country.country from country
join city using (country_id)
join address using (city_id)
join customer using (address_id)
group by country.country
having count(customer_id) = (
    select max(mycount) from (
        select country.country, count(customer_id) mycount from customer
        join address using (address_id)
        join city using (city_id)
        join country using (country_id)
        group by country.country
) t );
