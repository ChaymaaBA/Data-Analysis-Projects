select * 
from layoffs_staging2;

select max(total_laid_off), max(percentage_laid_off)
from layoffs_staging2;

select * 
from layoffs_staging2
where percentage_laid_off = 1 
order by funds_raised_millions DESC;

select company, SUM(total_laid_off)
from layoffs_staging2
group by company
order by 2 desc; 

select min(`date`), max(`date`)
from layoffs_staging2;

select country, SUM(total_laid_off)
from layoffs_staging2
group by country
order by 2 desc; 

select YEAR(`date`), SUM(total_laid_off)
from layoffs_staging2
group by YEAR(`date`)
order by 1 desc; 

select stage, SUM(total_laid_off)
from layoffs_staging2
group by stage
order by 2 desc; 

select *,
dense_rank () over (partition by YEAR(`date`) order by total_laid_off desc) as ranking
from layoffs_staging2
where YEAR(`date`) is not null
order by ranking asc; 