--GEMINI VS CHATGPT SQL ANALYSIS
--Table name
Models
Capabilities
Benchmarks

select * from models;
select * from capabilities;
select * from benchmarks;

--Questions
1)What are the average scores for each capability on both the Gemini Ultra and GPT-4 models?
2)What are the highest scores achieved by Gemini Ultra and GPT-4 for each benchmark in the Image capability?
3)Classify benchmarks into performance categories based on score ranges?
4) Retrieve the rankings for each capability based on Gemini Ultra scores?
5)Convert the Capability and Benchmark names to uppercase?
6) Can you provide the benchmarks along with their descriptions in a concatenated format?


1)What are the average scores for each capability on both the Gemini Ultra and GPT-4 models?

select m.ModelID, m.ModelName,
round(avg(b.ScoreGemini),2) as gemini_avg_score,
round(avg(b.ScoreGPT4),2) as GPT4_avg_score
from models m 
left join benchmarks b 
on m.ModelID = b.ModelID
group by 1, 2;

2)What are the highest scores achieved by Gemini Ultra and GPT-4 for each benchmark in the Image capability?

select b.BenchmarkName,
max(b.ScoreGemini) as gemini,
max(b.ScoreGPT4) GPT4
from benchmarks b
left join capabilities c 
on b.CapabilityID = c.CapabilityID
where c.CapabilityName = 'Image'
group by 1

3)Classify benchmarks into performance categories based on score ranges?

select BenchmarkName as performance_categories,
dense_rank() over(partition by BenchmarkName order by ScoreGemini, ScoreGPT4 desc) as Performance_rank
from benchmarks;

4) Retrieve the rankings for each capability based on Gemini Ultra scores?

select c.CapabilityName,
dense_rank() over(partition by c.CapabilityName order by b.ScoreGemini) as capability_rank
from capabilities c 
left join benchmarks b
on c.CapabilityID = b.CapabilityID

5) Can you provide the benchmarks along with their descriptions in a concatenated format?

select distinct bechmarckName_description from (
select concat(BenchmarkName, ' ',Description) as bechmarckName_description
from benchmarks) t

6)Convert the Capability and Benchmark names to uppercase?

select upper(CapabilityName) as CapabilityName from capabilities
select upper(BenchmarkName) as BenchmarkName from benchmarks
