-- Question 1
-- How many actors are there with the last name ‘Wahlberg’?
select count(actor_id) from actor a where a.last_name = 'Wahlberg'

-- Question 2
-- How many payments were made between $3.99 and $5.99?
select count(amount) as "Payments between $3.99 and $5.99" from payment where amount between 3.99 and 5.99

-- Question 3
-- What film does the store have the most of? (search in inventory)
select count(inventory.film_id), film.title from inventory
join film on inventory.film_id = film.film_id
group by film.title order by count(inventory.film_id) desc limit 72

-- Question 4
-- How many customers have the last name ‘William’?
select count(customer_id) from customer c where c.last_name = 'William'

-- Question 5
-- What store employee (get the id) sold the most rentals?
select p.staff_id, s.first_name, sum(p.amount) from payment p 
join staff s on s.staff_id = p.staff_id
group by p.staff_id, s.first_name order by sum(p.amount) desc limit 1

-- Question 6
-- How many different district names are there?
select distinct district from address order by district

-- Question 7
-- What film has the most actors in it? (use film_actor table and get film_id)
select f.title, fa.film_id, count(fa.actor_id) from film f
join film_actor fa on f.film_id = fa.film_id
group by fa.film_id, f.title order by count(f.film_id) desc limit 1

-- Question 8
-- From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
select count(customer_id) from customer c where c.last_name like '%es' and c.store_id = 1

-- Question 9
-- How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers 
-- with ids between 380 and 430? (use group by and having > 250)
select amount,count(amount) from payment
where customer_id between 380 and 430
group by amount having count(amount) > 250
order by count(amount) desc

-- Question 10
-- Within the film table, how many rating categories are there?
select f.rating from film f group by f.rating
-- And what rating has the most movies total?
select f.rating as "Movie Rating", count(f.film_id) as "# of movies" from film f group by f.rating order by count(f.film_id) desc limit 1
