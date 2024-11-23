-- Active: 1731773376416@@127.0.0.1@5432@universe
CREATE DATABASE universe;
\c universe;
CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE,
    type VARCHAR(50),
    distance_light_years FLOAT,
    num_stars INT NOT NULL,
    discovery_by VARCHAR(100) NOT NULL,
    discovery_date DATE
);
CREATE TABLE star(
    star_id SERIAL PRIMARY KEY,
    galaxy_id INT,
    name VARCHAR(150) UNIQUE NOT NULL,
    type VARCHAR(50),
    mass_solar FLOAT,
    radius_km FLOAT NOT NULL,
    temperature_k INT,
    FOREIGN KEY(galaxy_id) REFERENCES galaxy(galaxy_id)
);

CREATE TABLE planet(
    planet_id SERIAL PRIMARY KEY,
    star_id INT,
    name VARCHAR(100) UNIQUE NOT NULL,
    type VARCHAR(50),
    mass_earth FLOAT,
    radius_km NUMERIC(10, 3),
    has_life BOOLEAN,
    discovery_date DATE,
    distance_star_au FLOAT NOT NULL,
    super_heros TEXT,
    FOREIGN KEY(star_id) REFERENCES star(star_id)
);
CREATE TABLE moon(
    moon_id SERIAL PRIMARY KEY,
    planet_id INT,
    name VARCHAR(100) UNIQUE NOT NULL,
    radius_km INT NOT NULL,
    orbital_period_days INT,
    has_atmosphere BOOLEAN,
    discovery_date DATE,
    FOREIGN KEY(planet_id) REFERENCES planet(planet_id)
);

CREATE TABLE asteriod(
    asteroid_id SERIAL PRIMARY KEY,
    star_id INT,
    planet_id INT,
    name VARCHAR(100) UNIQUE NOT NULL,
    discovered_by VARCHAR(100)NOT NULL,
    discovery_date DATE,
    mass_kg FLOAT,
    FOREIGN KEY (star_id) REFERENCES star(star_id),
    FOREIGN KEY (planet_id) REFERENCES planet(planet_id)
);

INSERT INTO galaxy(name, type, distance_light_years, num_stars, discovery_by, discovery_date)
VALUES('Andromeda', 'Spiral', 2.537, 1000000000, 'Hubble', '1785-06-05'),
('Milky Way', 'Spiral', 0, 2000000000, 'Ancient Astronomers', '1785-01-01'),
('Triangulum', 'Spiral', 3.0, 400000000, 'Hubble', '1900-01-01'),
('Whirlpool', 'Spiral', 23.2, 300000000, 'Vesto Melvin Slipher', '1900-02-25'),
('Sombrero', 'Spiral', 28.9, 800000000, 'Ernest Öpik', '1930-04-10'),
('Pinwheel', 'Spiral', 21.7, 50000000, 'Hubble', '1940-07-16'),
('Messier 87', 'Elliptical', 53.5, 2000000000, 'Theodor Von Oppolzer', '1781-04-12'),
('Centaurus A', 'Elliptical', 12.5, 1000000000, 'James Dunlop', '1826-05-29'),
('NGC253', 'Spiral', 10.3, 600000000, 'John Herschel', '1826-10-09'),
('Black Eye', 'Spiral', 17.0, 200000000, 'William Herschel', '1785-03-16'),
('Tadpole', 'Irregular', 420.0, 1000000000, 'Hubble', '1990-06-19'),
('Bode Galaxy', 'Spiral', 11.6, 800000000, 'Johann Bode', '1774-12-31');

INSERT INTO star(galaxy_id, name, type, mass_solar, radius_km, temperature_k)
VALUES(1, 'Alpha Centauri A', 'Main Sequence', 1.1, 695700, 5790),
(2, 'Betelgeuse', 'Red Supergiant', 18.0, 95000, 3500),
(3, 'Sirius A', 'Main Sequence', 2.0, 1180000, 9940),
(4, 'Proxima Centauri', 'Red Dwarf', 0.12, 192000, 3050),
(5, 'Rigel', 'Blue Supergiant', 21.0, 944000, 12000),
(6, 'Arcturus', 'Red Giant', 1.5, 253000, 4300),
(7, 'Alpha Centauri B', 'Main Sequence', 0.9, 696000, 5790),
(8, 'Antares', 'Red Supergiant', 12.0, 800000, 3500),
(9, 'Vega', 'Main Sequence', 2.1, 1800000, 9600),
(10, 'Altair', 'Main Sequence', 1.8, 1500000, 7500),
(11, 'Capella', 'Giant', 2.0, 1040000, 5200),
(12, 'Spica', 'Binary', 10.3, 1700000, 22000),
(2, 'Fomalhaut', 'Main Sequence', 1.92, 1290000, 8600),
(6, 'Aldebaran', 'Red Giant', 1.5, 600000, 4300),
(12, 'Sirius B', 'White Dwarf', 1.0, 5300, 25000);

INSERT INTO planet(star_id, name, type, mass_earth, radius_km, has_life, discovery_date, distance_star_au, super_heros)
VALUES(1, 'Earth', 'Terrestrial', 1.0, 6371.00, TRUE, '2000-01-01', 1.0, 'Superma, Wonderwoman'),
(2, 'Mars', 'Terrestrial', 0.107, 3389.00, FALSE, '1659-12-06', 1.52, 'Green Lantern'),
(3, 'Venus', 'Terrestrial', 0.815, 6051.800, FALSE, '1610-01-01', 0.72, NULL),
(4, 'Jupiter', 'Gas Giant', 317.8, 69911.00, FALSE, '1610-01-07', 5.2, 'Thor'),
(5, 'Saturn', 'Gas Giant', 95.2, 58232.00, FALSE, '1610-01-01', 9.58, NULL),
(6, 'Uranus', 'Ice Giant', 14.5, 25362.00, FALSE, '1781-03-13', 19.18, NULL),
(7, 'Neptune', 'Ice Giant', 17.1, 24622.00, FALSE, '1846-09-23', 30.07, 'Aquaman'),
(8, 'Titan', 'Moon', 0.0225, 2575.500, FALSE, '1655-03-25', 1.2, NULL),
(9, 'Europa', 'Titan', 0.008, 1560.800, TRUE, '1610-01-08', 0.41, NULL),
(9, 'Mars II', 'Terrestrial', 0.2, 4000.000, FALSE, '2025-05-14', 1.8, NULL),
(8, 'Kepler-22b', 'Exoplanet', 2.4, 5900.00, TRUE, '2011-12-05', 620, NULL),
(7, 'Glise 581g', 'Exoplanet', 3.1, 5000.00, FALSE, '2007-04-24', 20.3, NULL),
(6, 'Proxima b', 'Exoplanet', 1.3, 6000.00, FALSE, '2016-08-24', 4.24, NULL),
(5, 'Pandora', 'Exoplanet', 4.5, 7845.014, TRUE, '1445-02-14', 5.8, 'Sully'),
(4, 'Gliese 667 Cc', 'Exoplanet', 4.5, 7000.00, FALSE, '2009-12-20', 23.6, NULL),
(2, 'Kepler-62f', 'Exoplanet', 2.8, 7800.000, FALSE, '2013-04-18', 1200, NULL);

INSERT INTO moon(planet_id, name, radius_km, orbital_period_days, has_atmosphere, discovery_date)
VALUES(17, 'Europa', 1560, 3.5, TRUE, '1610-01-08'),
(22, 'Ganymede', 2634, 7.2, TRUE, '1610-01-07'),
(23, 'Callisto', 2410, 16.7, FALSE, '1610-01-09'),
(24, 'lo', 1821, 1.8, TRUE, '1610-01-07'),
(25, 'Titan', 2575, 15.9, TRUE, '1655-03-25'),
(26, 'Enceladus', 252, 1.4, TRUE, '1789-08-28'),
(27, 'Triton', 1353, 5.9, TRUE, '1846-10-10'),
(28, 'Charon', 606, 6.4, FALSE, '1978-06-22'),
(28, 'Deimos', 6, 1.3, FALSE, '1877-08-18'),
(29, 'Phobos', 11, 0.3, FALSE, '1877-08-12'),
(20, 'Mimas', 199, 0.9, FALSE, '1789-09-17'),
(21, 'Rhea', 764, 4.5, TRUE, '1672-12-23'),
(21, 'Lapetus', 735, 79.3, FALSE, '1671-10-25'),
(24, 'Dione', 561, 2.7, TRUE, '1684-03-21'),
(23, 'Tethys', 531, 1.9, FALSE, '1684-03-21'),
(26, 'Miranda', 235, 1.4, TRUE, '1948-02-16'),
(24, 'Ariel', 578, 2.5, TRUE, '1851-10-24'),
(22, 'Umbriel', 584, 4.1, FALSE, '1851-10-24'),
(25, 'Oberon', 761, 13.5, FALSE, '1787-01-11'),
(23, 'Hyperion', 133, 21.3, FALSE, '1848-09-16');


INSERT INTO asteroid(star_id, planet_id, name, discovered_by, discovery_date, mass_kg)
VALUES(5, 26,'Ceres', 'Giusepe Piazzi', '1801-01-01', 9.39),
(1, 17,  'Pallas', 'Heinrich Olbers', '1802-03-28', 2.11),
(2, 18, 'Juno', 'Karl Harding', '1804-09-01', 2.67),
(3, 17, 'Vesta', 'Heinrich Olbers', '1807-03-29', 2.59),
(4, 20, 'Eros', 'Gustav Witt', '1898-09-13', 6.69),
(5, 24, 'Iris', 'John Russel', '1847-08-13', 1.20),
(6, 18, 'Psyche', 'Annibale de Gasparis', '1852-03-17', 2.73),
(3, 29, 'Hygeia', 'Annibale de Gasparis', '1849-04-12', 8.32);