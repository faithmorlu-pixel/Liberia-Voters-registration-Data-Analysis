# Liberia Voter Registration Analysis (2017–2023)

## Project Overview
This project analyzes voter registration data across Liberia's electoral districts, exploring regional distribution, gender participation, registration growth, voting center accessibility, and unregistered population gaps.

The data was cleaned, loaded into a PostgreSQL database, and analyzed using SQL to surface insights relevant to electoral planning and civic inclusion.

---

## Dataset
- **Source:** National Elections Commission Liberia (necliberia.org)
- **Coverage:** 73 electoral districts across 15 counties
- **Key fields:** registered voters (male/female), voting centers, unregistered population, total voting population (2017 & 2023)

---

## Tools Used
- **PostgreSQL** — data storage and querying
- **Excel / CSV** — raw data format
- **GitHub** — version control and project sharing

---

## Project Files

| File | Description |
|---|---|
| `voter_registration_inserts_v2.sql` | Cleaned INSERT statements to load data into PostgreSQL |
| `queries.sql` | All 9 SQL analysis queries |
| `results/` | CSV exports of each query result |

---

## SQL Analyses

| # | Analysis | Key Question |
|---|---|---|
| 1 | Total voters by county | Which counties have the most registered voters? |
| 2 | Male vs Female distribution | How does gender break down by county? |
| 3 | Female participation % | Which counties have the highest/lowest female inclusion? |
| 4 | Registration growth 2017→2023 | Where did voter registration grow the most? |
| 5 | Growth percentage by county | Which counties grew fastest in relative terms? |
| 6 | Voters by electoral district | How are voters distributed at the district level? |
| 7 | Avg voters per center | Which counties face the most overcrowded voting centers? |
| 8 | Unregistered voter analysis | Where are the largest gaps in voter registration? |
| 9 | County ranking | Full ranking of counties by registered voters |

---

## Key Findings
- **Montserrado** county has the highest number of registered voters, reflecting its status as the most populated county
- **Female participation** averages approximately 48% nationally, with variation across counties
- Several counties show strong **registration growth** between 2017 and 2023, indicating improved civic engagement
- High **voters-per-center** ratios in some districts point to potential overcrowding and accessibility challenges on election day
- Counties with large **unregistered populations** represent priority targets for future voter registration drives

---

## How to Reproduce
1. Create the table in PostgreSQL using the schema below
2. Run `voter_registration_inserts_v2.sql` to load the data
3. Run any query from `queries.sql` to reproduce the analysis

```sql
CREATE TABLE voter_registration (
    electoral_district VARCHAR(50),
    county VARCHAR(50),
    num_voting_centers INT,
    registered_female INT,
    registered_male INT,
    total_regis_voters_2023 INT,
    voters_per_center FLOAT,
    total_voting_population_2023 INT,
    unregistered_voters INT,
    percent_regis_voters_2023 FLOAT,
    total_regis_voters_2017 INT
);
```

---

## Author
Connect with me on [faithmorlu@gmail.com](+1319-826-8076) | [GitHub](https://github.com/faithmorlu-pixel/Liberia-Voters-registration-Data-Analysis)
