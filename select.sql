/*
Сидоренко Никита Олегович

Вариант 2

1) Выберите всех гонщиков (или их идентификатор, если другой информации нет в таблице), которые заняли первое место, но заработали меньше 26 очков, отсортировав данные по убыванию кругов лидирования.

2) Выберите имена и фамилии всех гонщиков и общее количество их очков, набранных по результатам гонок, и расставьте их в порядке убывания.
*/


-- 1)
SELECT racers.id, name, surname, birth_date, country, count_wins, results.points ,results.laps_lead
FROM racers
JOIN results ON racers.id = results.racer_id
WHERE position = 1 AND points < 26
ORDER BY laps_lead DESC

-- 2)
SELECT racers.name, racers.surname, COALESCE(SUM(results.points), 0) as sum_points
FROM racers
LEFT JOIN results ON racers.id = results.racer_id
GROUP BY racers.id
ORDER BY sum_points DESC
