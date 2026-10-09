/*
Сидоренко Никита Олегович

Вариант 2

Заполните таблицы, созданные в рамках домашнего задания к практическому занятию 1, не менее, чем 5-ю осмысленными записями. 
Данные возьмите из аналогичных систем в реальной жизни. 
Заполнение оформите в виде SQL-запросов. 
*/




-- Гран-при
INSERT INTO events (id, season_year, round_number, name, event_date, country, place) VALUES
(1, 2024, 1, 'Bahrain Grand Prix', '2024-03-02', 'Bahrain', 'Bahrain International Circuit'),
(2, 2024, 2, 'Saudi Arabian Grand Prix', '2024-03-09', 'Saudi Arabia', 'Jeddah Corniche Circuit'),
(3, 2024, 3, 'Australian Grand Prix', '2024-03-24', 'Australia', 'Albert Park Circuit'),
(4, 2024, 4, 'Japanese Grand Prix', '2024-04-07', 'Japan', 'Suzuka International Racing Course'),
(5, 2024, 5, 'Chinese Grand Prix', '2024-04-21', 'China', 'Shanghai International Circuit');


-- Гонщики
INSERT INTO racers (id, name, surname, birth_date, country, count_wins) VALUES
(1, 'Max', 'Verstappen', '1997-09-30', 'Netherlands', 54),
(2, 'Sergio', 'Perez', '1990-01-26', 'Mexico', 6),
(3, 'Carlos', 'Sainz','1994-09-01', 'Spain',3),
(4, 'Charles', 'Leclerc', '1997-10-16', 'Monaco',5),
(5, 'George', 'Russell', '1998-02-15', 'United Kingdom', 1),
(6, 'Liam', 'Lawson', '2002-02-11', 'New Zealand', 0),
(7, 'Oliver', 'Bearman','2005-05-08', 'United Kingdom', 0),
(8, 'Mick', 'Schumacher', '1999-03-22', 'Germany', 0),
(9, 'Stoffel', 'Vandoorne','1992-03-26', 'Belgium', 0),
(10, 'Felipe', 'Drugovich','2000-05-23', 'Brazil', 0),
(11, 'Lewis', 'Hamilton', '1985-01-07', 'United Kingdom', 103),
(12, 'Lando', 'Norris', '1999-11-13', 'United Kingdom', 0),
(13, 'Oscar', 'Piastri', '2001-04-06', 'Australia', 0),
(14, 'Fernando', 'Alonso', '1981-07-29', 'Spain', 32),
(15, 'Lance', 'Stroll', '1998-10-29', 'Canada', 0);


-- Команды
INSERT INTO teams (id, season_year, name, engine_dev_name, country) VALUES
(1, 2024, 'Oracle Red Bull Racing', 'Honda RBPT', 'Austria'),
(2, 2024, 'Scuderia Ferrari', 'Ferrari', 'Italy'),
(3, 2024, 'Mercedes-AMG Petronas F1 Team', 'Mercedes', 'Germany'),
(4, 2024, 'McLaren Formula 1 Team', 'Mercedes', 'United Kingdom'),
(5, 2024, 'Aston Martin Aramco F1 Team', 'Mercedes', 'United Kingdom');


-- Состав команды
INSERT INTO team_racers (id, team_id, season_year, racer_id, role, car_number) VALUES
-- Red Bull 
(1, 1, 2024, 1, 'main', 1),
(2, 1, 2024, 2, 'main', 11),
(3, 1, 2024, 6, 'reserve', NULL),
-- Ferrari
(4,  2, 2024, 3, 'main', 55),
(5,  2, 2024, 4, 'main', 16),
(6,  2, 2024, 7, 'reserve', NULL),
-- Mercedes
(7, 3, 2024, 5, 'main', 63),
(8,  3, 2024, 11, 'main', 44),
(9,  3, 2024, 8, 'reserve', NULL),
-- McLaren
(10, 4, 2024, 12, 'main', 4),
(11, 4, 2024, 13, 'main', 81),
(12, 4, 2024, 9, 'reserve', NULL),
-- Aston Martin
(13, 5, 2024, 14, 'main', 14),
(14, 5, 2024, 15, 'main', 18),
(15, 5, 2024, 10, 'reserve', NULL);

-- Итоги
INSERT INTO results (id, event_id, racer_id, position, points, finish_time, leave_reason, laps_lead) VALUES
(1, 1, 1, 1, 26, INTERVAL '1 hour 31 minutes 44.742 seconds', NULL, 39),
(2, 1, 2, 2, 18, INTERVAL '22.457 seconds', NULL, 0),
(3, 1, 3, 3, 15, INTERVAL '25.110 seconds', NULL, 0),
(4, 1, 4, 4, 12, INTERVAL '39.669 seconds', NULL, 0),
(5, 1, 5, 5, 10, INTERVAL '46.788 seconds', NULL, 0),
(6,  2, 1,  1, 25, INTERVAL '1 hour 20 minutes 43.273 seconds', NULL, 55),
(7,  2, 2,  2, 18, INTERVAL '13.643 seconds', NULL, 0),
(8,  2, 4,  3, 15, INTERVAL '18.639 seconds', NULL, 0),
(9,  2, 13, 4, 12, INTERVAL '32.007 seconds', NULL, 0),
(10, 2, 14, 5, 10, INTERVAL '35.759 seconds', NULL, 0),
(11, 3, 3,  1, 25, INTERVAL '1 hour 20 minutes 26.843 seconds', NULL, 3),
(12, 3, 4,  2, 18, INTERVAL '2.366 seconds', NULL, 0),
(13, 3, 12, 3, 15, INTERVAL '5.904 seconds', NULL, 0),
(14, 3, 13, 4, 12, INTERVAL '35.770 seconds',NULL, 0),
(15, 3, 2,  5, 10, INTERVAL '45.265 seconds', NULL, 0),
(16, 3, 1,  NULL, 0, NULL, 'Brake failure', 0),
(17, 3, 5,  NULL, 0, NULL, 'Accident', 0);