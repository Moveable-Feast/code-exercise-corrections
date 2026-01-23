-- 解答
select round(sum(a1.player_id is not null) / count(*), 2) fraction from
(select player_id, event_date from activity) a1
right join
(select player_id, (min(event_date) + interval 1 day) second_logging from activity group by player_id) a2
on a1.event_date = a2.second_logging and a1.player_id = a2.player_id;

-- 答案
select IFNULL(round(count(distinct(Result.player_id)) / count(distinct(Activity.player_id)), 2), 0) as fraction
from (
  select Activity.player_id as player_id
  from (
    select player_id, DATE_ADD(MIN(event_date), INTERVAL 1 DAY) as second_date
    from Activity
    group by player_id
  ) as Expected, Activity
  where Activity.event_date = Expected.second_date and Activity.player_id = Expected.player_id
) as Result, Activity;