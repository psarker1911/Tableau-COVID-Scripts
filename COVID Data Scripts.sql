-- 1.

SELECT SUM(new_cases) AS total_cases, SUM(new_deaths) AS total_deaths, SUM(new_deaths)/SUM(new_cases)*100 AS DeathPercentage
FROM `SQLProject`.`COVIDDeaths`
WHERE continent IS NOT NULL
ORDER BY 1,2

-- 2.

SELECT location, SUM(new_deaths) AS TotalDeathCount
FROM `SQLProject`.`COVIDDeaths`
-- WHERE Location LIKE 'Australia'--
WHERE continent IS NOT NULL
AND location NOT IN ('World', 'European Union', 'International')
GROUP BY location
ORDER BY TotalDeathCount DESC


-- 3.

SELECT Location, Population, MAX(total_cases) AS HighestInfectionCount, Max((total_cases/population)) * 100 AS PercentPopulationInfected
FROM `SQLProject`.`COVIDDeaths`
-- Where location like 'Australia' --
GROUP BY Location, Population
ORDER BY PercentPopulationInfected DESC

-- 4.

SELECT Location, Population, date, MAX(total_cases) AS HighestInfectionCount, MAX((total_cases/population)) * 100 AS PercentPopulationInfected
FROM `SQLProject`.`COVIDDeaths`
-- Where location like 'Australia' --
GROUP BY Location, Population, date
ORDER BY PercentPopulationInfected DESC


-- Total Death Count by Continent - replacement for -- 2.

SELECT location, SUM(new_deaths) AS TotalDeathCount
FROM `SQLProject`.`COVIDDeaths`
-- WHERE Location LIKE 'Australia'--
WHERE continent IS NOT NULL 
AND location IN ('Europe','North America','South America','Asia','Africa','Oceania')
GROUP BY location
ORDER BY TotalDeathCount DESC