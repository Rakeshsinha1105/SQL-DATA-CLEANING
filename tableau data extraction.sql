select * from PortfolioProject..CovidDeaths order by 3,4

select * from PortfolioProject..CovidVaccinations order by 3,4

select location, date, total_cases, new_cases, total_deaths, population
from PortfolioProject..CovidDeaths order by 3,4

--Total deaths vs Total cases 
Select location, date, total_cases, total_deaths, (total_cases/total_deaths)*100 as Death_Percentage
from PortfolioProject..CovidDeaths
order by 1,2

--Total deaths vs Total cases in India
Select location, date, total_cases, total_deaths, (total_cases/total_deaths)*100 as Death_Percentage
from PortfolioProject..CovidDeaths
where location like 'India'
order by 1,2

--Total cases vs population in India
--Showing what percentage of population contracted covid
Select location, date,population,total_cases, (total_cases/total_deaths)*100 
as Percent_Population_infected
from PortfolioProject..CovidDeaths
where location like 'India'
order by 1,2

--Countries with highest infection Rate compared to Population 
Select Location, Population, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as Percent_Population_infected
From PortfolioProject..CovidDeaths
Group by Location, Population
order by Percent_Population_infected desc

-- Countries with Highest Death Count per Population
Select Location, MAX(cast(Total_deaths as int)) as TotalDeathCount
From PortfolioProject..CovidDeaths
Where continent is not null 
Group by Location
order by TotalDeathCount desc

--Total death counts in india
Select Location, MAX(cast(Total_deaths as int)) as TotalDeathCount
From PortfolioProject..CovidDeaths
Where location like 'India'
Group by Location
order by TotalDeathCount desc

-- Seeing which continent has the highest death Count 
Select continent, MAX(cast(Total_deaths as int)) as TotalDeathCount
From PortfolioProject..CovidDeaths
--Where location like '%states%'
Where continent is not null 
Group by continent
order by TotalDeathCount desc

-- Sum of total cases, total deaths and the death percentage
Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths,
SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
From PortfolioProject..CovidDeaths
where continent is not null 
order by 1,2

