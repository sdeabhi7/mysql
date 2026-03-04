'''Query to Fetch the 2nd Highest Transaction Amount per User'''

select userid, amount from 
(
    select userid, amount, 
    row_number() over (partition by userid order by amount desc) as rn
    from transactions 
) t
where rn = 2;