/* Q1: Some of the facilities charge a fee to members, but some do not.
Please list the names of the facilities that do. */

select facid, name, membercost from hr.facilities where membercost > 0;

/* Q2: How many facilities do not charge a fee to members? */

select count(facid) from hr.facilities where membercost=0;


/* Q3: How can you produce a list of facilities that charge a fee to members,
where the fee is less than 20% of the facility's monthly maintenance cost?
Return the facid, facility name, member cost, and monthly maintenance of the
facilities in question. */

select facid, name, membercost, monthlymaintenance 
from hr.facilities
where membercost >0
and membercost < (monthlymaintenance * 0.2);


/* Q4: How can you retrieve the details of facilities with ID 1 and 5?
Write the query without using the OR operator. */

select * from hr.facilities where facid in (1, 5);


/* Q5: How can you produce a list of facilities, with each labelled as
'cheap' or 'expensive', depending on if their monthly maintenance cost is
more than $100? Return the name and monthly maintenance of the facilities
in question. */

select 
name as facilityname, monthlymaintenance,
(CASE WHEN monthlymaintenance > 100 THEN 'expensive' ELSE 'cheap' END) as cost
from hr.facilities;


/* Q6: You'd like to get the first and last name of the last member(s)
who signed up. Do not use the LIMIT clause for your solution. */

SELECT b.starttime,  m.firstname, m.surname 
FROM hr.bookings b
inner join hr.members m on b.memid = m.memid
WHERE b.starttime = (select max(starttime) from hr.bookings);



/* Q7: How can you produce a list of all members who have used a tennis court?
Include in your output the name of the court, and the name of the member
formatted as a single column. Ensure no duplicate data, and order by
the member name. */


select distinct f.name, m.firstname || ' ' || m.surname as membername from hr.bookings b inner join hr.facilities f
on b.facid = f.facid
inner join hr.members m on b.memid = m.memid 
where f.name like ('Tennis Court%')
and m.memid != 0
order by m.firstname || ' ' || m.surname



/* Q8: How can you produce a list of bookings on the day of 2012-09-14 which
will cost the member (or guest) more than $30? Remember that guests have
different costs to members (the listed costs are per half-hour 'slot'), and
the guest user's ID is always 0. Include in your output the name of the
facility, the name of the member formatted as a single column, and the cost.
Order by descending cost, and do not use any subqueries. */

select f.name as facilityname, m.firstname || ' ' || m.surname as membername,
(CASE WHEN m.memid =0 THEN (b.slots * f.guestcost) ELSE (b.slots * f.membercost) END) as cost
from hr.bookings b inner join hr.facilities f
on b.facid = f.facid
inner join hr.members m on b.memid = m.memid 
where TRUNC(TO_DATE(starttime,'YYYY/MM/DD HH24:MI:SS')) = TO_DATE('2012-09-14', 'YYYY-MM-DD')
and (CASE WHEN m.memid =0 THEN (b.slots * f.guestcost) ELSE (b.slots * f.membercost) END) > 30
order by (CASE WHEN m.memid =0 THEN (b.slots * f.guestcost) ELSE (b.slots * f.membercost) END) desc;


/* Q9: This time, produce the same result as in Q8, but using a subquery. */


select f.name as facilityname, m.firstname || ' ' || m.surname as membername,
(CASE WHEN m.memid =0 THEN (b.slots * f.guestcost) ELSE (b.slots * f.membercost) END) as cost
from hr.bookings b inner join hr.facilities f 
on b.facid = f.facid
inner join hr.members m 
on b.memid = m.memid 
inner join 
(select * from hr.bookings b where TRUNC(TO_DATE(starttime,'YYYY/MM/DD HH24:MI:SS')) = TO_DATE('2012-09-14', 'YYYY-MM-DD')) sept14book
on b.bookid = sept14book.bookid
inner join (
select b.*
from hr.bookings b inner join hr.facilities f
on b.facid = f.facid
inner join hr.members m on b.memid = m.memid  
and (CASE WHEN m.memid =0 THEN (b.slots * f.guestcost) ELSE (b.slots * f.membercost) END) > 30
) more_then_30
on b.bookid = more_then_30.bookid
order by (CASE WHEN m.memid =0 THEN (b.slots * f.guestcost) ELSE (b.slots * f.membercost) END) desc;


/* Q10: Produce a list of facilities with a total revenue less than 1000.
The output of facility name and total revenue, sorted by revenue. Remember
that there's a different cost for guests and members! */

select f.name as facilityname, sum((CASE WHEN m.memid =0 THEN (b.slots * f.guestcost) ELSE (b.slots * f.membercost) END)) as totalrevenue
from hr.bookings b inner join hr.facilities f
on b.facid = f.facid
inner join hr.members m on b.memid = m.memid 
group by f.name
HAVING sum((CASE WHEN m.memid =0 THEN (b.slots * f.guestcost) ELSE (b.slots * f.membercost) END)) < 1000
order by sum((CASE WHEN m.memid =0 THEN (b.slots * f.guestcost) ELSE (b.slots * f.membercost) END)) desc;

