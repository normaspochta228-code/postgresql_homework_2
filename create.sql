-- Гран-при
CREATE TABLE events (
    id SERIAL PRIMARY KEY,
    season_year INTEGER NOT NULL,
    round_number INTEGER NOT NULL,
    name VARCHAR(64) NOT NULL,
    event_date DATE NOT NULL,
    country VARCHAR(64) NOT NULL,
    place VARCHAR(64) NOT NULL,
    UNIQUE (season_year, round_number)
);

-- Гонщики
CREATE TABLE racers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(64) NOT NULL,
    surname VARCHAR(64) NOT NULL,
    birth_date DATE NOT NULL,
    country VARCHAR(64),
    count_wins INTEGER NOT NULL DEFAULT 0,
    CHECK (count_wins >= 0)
);

-- Команды
CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    season_year INTEGER NOT NULL,
    name VARCHAR(64) NOT NULL,
    engine_dev_name VARCHAR(64) NOT NULL,
    country VARCHAR(64) NOT NULL,
    UNIQUE (season_year, name),
    UNIQUE (id, season_year)
);

-- Состав команды
CREATE TABLE team_racers (
    id SERIAL PRIMARY KEY,
    team_id INTEGER NOT NULL,
    season_year INTEGER NOT NULL,
    racer_id INTEGER NOT NULL REFERENCES racers(id),
    role VARCHAR(8) NOT NULL CHECK (role IN ('main','reserve')),
    car_number INTEGER,

    FOREIGN KEY (team_id, season_year) REFERENCES teams(id, season_year),

    CHECK (
        (role = 'main'    AND car_number IS NOT NULL) OR
        (role = 'reserve' AND car_number IS NULL)
    ),

    UNIQUE (team_id, racer_id),
    UNIQUE (team_id, car_number),
    UNIQUE (season_year, racer_id)
);

-- Результаты
CREATE TABLE results (
    id SERIAL PRIMARY KEY,
    event_id INTEGER NOT NULL REFERENCES events(id),
    racer_id INTEGER NOT NULL REFERENCES racers(id),
    position INTEGER,
    points INTEGER NOT NULL DEFAULT 0,
    finish_time INTERVAL,
    leave_reason VARCHAR(128),
    laps_lead INTEGER NOT NULL DEFAULT 0,

    UNIQUE (event_id, racer_id),

    CHECK (
        (finish_time IS NOT NULL AND leave_reason IS NULL) OR
        (finish_time IS NULL AND leave_reason IS NOT NULL)
    ),

    CHECK (points >= 0),
    CHECK (laps_lead >= 0),
    CHECK (finish_time IS NULL OR finish_time > INTERVAL '0'),
    CHECK (position IS NULL OR position > 0)
);
