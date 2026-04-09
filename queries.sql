-- ============================================================
-- Liberia Voter Registration Analysis (2017-2023)
-- PostgreSQL Queries
-- ============================================================


-- Query 1: Total Registered Voters Across Counties
SELECT 
    county,
    SUM(total_regis_voters_2023) AS total_voters
FROM voter_registration
GROUP BY county
ORDER BY total_voters DESC;


-- Query 2: Male vs Female Distribution
SELECT 
    county,
    SUM(registered_male) AS total_male,
    SUM(registered_female) AS total_female
FROM voter_registration
GROUP BY county;


-- Query 3: Female Participation Percentage
SELECT 
    county,
    ROUND(SUM(registered_female) * 100.0 / SUM(total_regis_voters_2023), 2) AS female_percentage
FROM voter_registration
GROUP BY county
ORDER BY female_percentage DESC;


-- Query 4: Registration Growth 2017 to 2023
SELECT 
    county,
    SUM(total_regis_voters_2017) AS voters_2017,
    SUM(total_regis_voters_2023) AS voters_2023,
    SUM(total_regis_voters_2023) - SUM(total_regis_voters_2017) AS growth
FROM voter_registration
GROUP BY county
ORDER BY growth DESC;


-- Query 5: Registration Growth Percentage by County
SELECT 
    county,
    ROUND(
        (SUM(total_regis_voters_2023) - SUM(total_regis_voters_2017)) * 100.0 
        / SUM(total_regis_voters_2017), 2
    ) AS growth_percentage
FROM voter_registration
GROUP BY county
ORDER BY growth_percentage DESC;


-- Query 6: Total Registered Voters Across Districts
SELECT 
    electoral_district,
    SUM(total_regis_voters_2023) AS total_voters
FROM voter_registration
GROUP BY electoral_district
ORDER BY total_voters DESC;


-- Query 7: Accessibility - Average Voters Per Center (fixed FLOAT cast)
SELECT 
    county,
    ROUND(AVG(voters_per_center)::numeric, 2) AS avg_voters_per_center
FROM voter_registration
GROUP BY county
ORDER BY avg_voters_per_center DESC;


-- Query 8: Unregistered Population Analysis
SELECT 
    county,
    SUM(unregistered_voters) AS total_unregistered,
    ROUND(SUM(unregistered_voters) * 100.0 / SUM(total_voting_population_2023), 2) AS unregistered_pct
FROM voter_registration
GROUP BY county
ORDER BY total_unregistered DESC;


-- Query 9: Ranking Counties by Registration
SELECT 
    county,
    SUM(total_regis_voters_2023) AS total_voters,
    RANK() OVER (ORDER BY SUM(total_regis_voters_2023) DESC) AS rank_position
FROM voter_registration
GROUP BY county;
