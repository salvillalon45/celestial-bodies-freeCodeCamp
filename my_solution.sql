-- psql --username=freecodecamp --dbname=postgres
-- \c universe

/* 
DROP TABLE IF EXISTS moon CASCADE;
DROP TABLE IF EXISTS planet CASCADE;
DROP TABLE IF EXISTS star CASCADE;
DROP TABLE IF EXISTS galaxy CASCADE;
*/

CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    type VARCHAR(255) NOT NULL,
    distance_from_earth FLOAT,
    number_of_stars INT,
    description TEXT,
);

CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    type VARCHAR(255) NOT NULL,
    age_in_millions_of_years FLOAT,
    mass FLOAT,
    galaxy_id INT REFERENCES galaxy(galaxy_id)
);

CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    has_life BOOLEAN,
    number_of_moons INT,
    mass NUMERIC,
    star_id INT REFERENCES star(star_id)
);

CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    distance_from_earth FLOAT,
    mass FLOAT,
    has_atmosphere BOOLEAN,
    planet_id INT REFERENCES planet(planet_id)
);

CREATE TABLE spacecraft (
    spacecraft_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT
)

-- INSERT COMMANDS FOR GALAXY TABLE
INSERT INTO galaxy (name, type, distance_from_earth, number_of_stars, description)
VALUES 
  ('Milky Way', 'Spiral', 0.0, 25, 'The galaxy that contains our Solar System.'),
  ('Andromeda', 'Spiral', 2537000.0, 10, 'The nearest spiral galaxy to the Milky Way, on a collision course with it.'),
  ('Triangulum', 'Spiral', 3000000.0, 40, 'The third-largest member of the Local Group of galaxies.'),
  ('Whirlpool', 'Spiral', 23000000.0, 10, 'Famous for its clearly defined spiral arms.'),
  ('Sombrero', 'Elliptical', 29000000.0, 80, 'Notable for its bright nucleus and large central bulge.'),
  ('Cartwheel', 'Lenticular', 500000000.0, 10, 'A ring galaxy created by a collision between two galaxies.');

--  INSERT COMMANDS FOR STAR TABLE
INSERT INTO star (name, type, age_in_millions_of_years, mass, galaxy_id)
VALUES 
  ('Sun', 'Yellow Dwarf', 4600.0, 1.0, 1),
  ('Sirius', 'White Dwarf', 242.0, 2.02, 1),
  ('Proxima Centauri', 'Red Dwarf', 4850.0, 0.122, 1),
  ('Betelgeuse', 'Red Supergiant', 8000.0, 20.0, 2),
  ('Rigel', 'Blue Supergiant', 8000.0, 21.0, 2),
  ('Vega', 'White Dwarf', 455.0, 2.1, 3);


-- INSERT COMMANDS FOR PLANET TABLE
INSERT INTO planet (name, has_life, number_of_moons, mass, star_id)
VALUES 
  ('Earth', TRUE, 1, 1.0, 1),
  ('Mars', FALSE, 2, 0.107, 1),
  ('Venus', FALSE, 0, 0.815, 1),
  ('Jupiter', FALSE, 79, 317.8, 1),
  ('Proxima b', FALSE, 0, 1.27, 3),
  ('Sirius b', FALSE, 0, 1.02, 2),
  ('Betelgeuse I', FALSE, 10, 320.5, 4),
  ('Betelgeuse II', FALSE, 8, 215.7, 4),
  ('Rigel I', FALSE, 4, 230.6, 5),
  ('Rigel II', FALSE, 5, 180.2, 5),
  ('Vega I', FALSE, 3, 1.5, 6),
  ('Vega II', FALSE, 0, 0.9, 6);


-- INSERT COMMANDS FOR MOON TABLE
INSERT INTO moon (name, distance_from_earth, mass, has_atmosphere, planet_id)
VALUES 
  ('Moon', 384400.0, 0.0123, FALSE, 1),
  ('Phobos', 9376.0, 0.00000001, FALSE, 2),
  ('Deimos', 23458.0, 0.00000002, FALSE, 2),
  ('Io', 628736.0, 0.015, TRUE, 4),
  ('Europa', 628876.0, 0.008, TRUE, 4),
  ('Ganymede', 1070400.0, 0.025, TRUE, 4),
  ('Callisto', 1882700.0, 0.018, FALSE, 4),
  ('Proxima Moon', 4048800.0, 0.0001, FALSE, 5),
  ('Sirius Moon', 5360000.0, 0.0003, FALSE, 6),
  ('Betelgeuse I Moon 1', 640000.0, 0.0005, FALSE, 7),
  ('Betelgeuse I Moon 2', 750000.0, 0.0002, FALSE, 7),
  ('Betelgeuse II Moon 1', 830000.0, 0.001, TRUE, 8),
  ('Betelgeuse II Moon 2', 910000.0, 0.0007, FALSE, 8),
  ('Rigel I Moon 1', 1200000.0, 0.002, TRUE, 9),
  ('Rigel I Moon 2', 1350000.0, 0.0015, FALSE, 9),
  ('Rigel II Moon 1', 1420000.0, 0.0025, TRUE, 10),
  ('Rigel II Moon 2', 1530000.0, 0.003, FALSE, 10),
  ('Vega I Moon 1', 800000.0, 0.001, FALSE, 11),
  ('Vega II Moon 1', 950000.0, 0.0009, TRUE, 12),
  ('Vega II Moon 2', 1050000.0, 0.0007, FALSE, 12);

-- INSERT COMMANDS FOR SPACECRAFT TABLE
INSERT INTO spacecraft (name, description)
VALUES 
  ('Apollo 11', 'The first crewed mission to land on the Moon in 1969.'),
  ('Voyager 1', 'The farthest human-made object from Earth, launched in 1977 to study the outer planets.'),
  ('Hubble Space Telescope', 'A space telescope launched in 1990, providing deep-space imagery.'),
  ('Mars Rover Curiosity', 'A car-sized rover designed to explore the Gale Crater on Mars, landed in 2012.'),
  ('International Space Station (ISS)', 'A habitable space station that serves as a microgravity research laboratory, launched in 1998.'),
  ('Space Shuttle Endeavour', 'One of NASA space shuttles, completed its first flight in 1992 and retired in 2011.');


SELECT * FROM planet FULL JOIN star ON planet.star_id = star.star_id;
-- FULL JOIN table_2 ON junction_table.foreign_key_column = table_2.primary_key_column;