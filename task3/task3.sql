SELECT ks,
	   kss.avg_dur - tariff.avg_dur AS diff_between_tariff
FROM 
(
	SELECT s.kt, AVG(dur) AS avg_dur
	FROM public.f
	INNER JOIN public.s
	ON (f.ks = s.ks)
	GROUP BY s.kt
) AS tariff
INNER JOIN 
(
	SELECT s.kt, s.ks, AVG(dur) AS avg_dur
	FROM public.f
	LEFT JOIN public.s
	ON (f.ks = s.ks)
	GROUP BY s.ks, s.kt
) AS kss
ON (kss.kt = tariff.kt);

SELECT DISTINCT s.ks, 
				AVG(dur) OVER(PARTITION BY s.ks) - AVG(dur) OVER(PARTITION BY s.kt) AS diff_between_tariff
				FROM public.f
INNER JOIN public.s
ON (f.ks = s.ks)