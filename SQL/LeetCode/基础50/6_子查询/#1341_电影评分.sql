-- 解答
select min(t1.name) results from
  (select u.name, count(mr.user_id) count_users from users u left join movierating mr on u.user_id = mr.user_id group by u.user_id) t1
  where
  t1.count_users = (select max(t1.count_users) from (select u.name, count(mr.user_id) count_users from users u left join movierating mr on u.user_id = mr.user_id group by u.user_id) t1)
union all
select min(t2.title) results from
  (select m.title, avg(mr.rating) avg_rating from movies m left join movierating mr on m.movie_id = mr.movie_id where created_at like '2020-02%' group by m.movie_id) t2
  where
  t2.avg_rating = (select max(avg_rating) from (select m.title, avg(mr.rating) avg_rating from movies m left join movierating mr on m.movie_id = mr.movie_id where created_at like '2020-02%' group by m.movie_id) t2);
-- 答案
# Write your MySQL query statement below
(SELECT u.name AS results
FROM Users u
LEFT JOIN MovieRating mr ON u.user_id = mr.user_id
GROUP BY u.user_id
ORDER BY COUNT(*) DESC, name ASC
LIMIT 1)

UNION ALL

(SELECT title AS results
FROM Movies m
LEFT JOIN MovieRating mr ON m.movie_id = mr.movie_id AND YEAR(mr.created_at) = 2020 AND MONTH(mr.created_at) = 2
GROUP BY mr.movie_id
ORDER BY AVG(mr.rating) DESC, title
LIMIT 1);