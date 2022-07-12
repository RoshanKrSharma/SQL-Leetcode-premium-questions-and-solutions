Table: SurveyLog
| Column Name | Type |
|   id        | int  |
|  action     | ENUM |
| question_id | int  |
| answer_id   | int  |
|  q_num      | int  |
| timestamp   | int  |
----------------------


There is no primary key for this table. It may contain duplicates. action is an ENUM of the type: "show", "answer", or "skip".
Each row of this table indicates the user with ID = id has taken an action with the question question_id at time timestamp.
If the action taken by the user is "answer", answer_id will contain the id of that answer, otherwise, it will be null.
a_num is the numeral order of the question in the current session.

The answer rate for a question is the number of times a user answered the question by the number of times a user showed the question.
Write an SQL query to report the question that has the highest answer rate. If multiple questions have the same maximum answer
rate, report the question with the smallest question_id.

The query result format is in the following
example:

-- Input:
-- +------+-----------+--------------+------------+-----------+------------+
-- | id   | action    | question_id  | answer_id  | q_num     | timestamp  |
-- +------+-----------+--------------+------------+-----------+------------+
-- | 5    | show      | 285          | null       | 1         | 123        |
-- | 5    | answer    | 285          | 124124     | 1         | 124        |
-- | 5    | show      | 369          | null       | 2         | 125        |
-- | 5    | skip      | 369          | null       | 2         | 126        |
-- +------+-----------+--------------+------------+-----------+------------+
-- Output:
-- +-------------+
-- | survey_log  |
-- +-------------+
-- |    285      |
-- +-------------+
-- Explanation:
-- question 285 has answer rate 1/1, while question 369 has 0/1 answer rate, so output 285.
 

-- Note: The highest answer rate meaning is: answer number's ratio in show number in the same question.

-- Solution
with t1 as(
select a.question_id, coalesce(b.answer/a.show_1,0) as rate
from 
(select question_id, coalesce(count(*),0) as show_1
from survey_log
where action != 'answer'
group by question_id) a
left join
(select question_id, coalesce(count(*),0) as answer
from survey_log
where action = 'answer'
group by question_id) b
on a.question_id = b.question_id)

select a.question_id as survey_log
from 
( select t1.question_id,
rank() over(order by rate desc) as rk
from t1) a
where a.rk = 1

alternateValte soltuion:

select
question_id as survey_log
from
SurveyLog
group by
question_id
order by
count answer_id) / sum if(action =
limit 1
