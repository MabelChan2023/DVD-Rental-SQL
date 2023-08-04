/*
Objective:
Retrieve the number of payment that reach a specific range of amount using function
*/

create function count_payment(lowerBoundary int, higherBoundary int)
returns int
language plpgsql
as
$$
declare
	payment_count integer;	
begin
	select count(*)
	into payment_count
	from payment
	where amount between lowerBoundary and higherBoundary;
	
	return payment_count;
end;
$$;

select count_payment(5,10);

