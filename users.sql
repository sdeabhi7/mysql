'''
Identify Returning Users in the Last 5 Months
'''

select distinct userid from login_logs where login_date >= current_date - interval '5 months'
and userid in (select userid from login_logs where login_date < current_date - interval '5 months');

select userid from login_logs group by userid having min(login_date) < current_date - interval '5 months'
and max(login_date) >= current_date - interval '5 months';