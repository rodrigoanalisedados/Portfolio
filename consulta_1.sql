
SELECT PD.procodigo, PD.pronome, EL.locquantidade, PJ.pjnome, SUM(PDVI.venqtde) AS TotalQtdeVendas, LC.empcodigo
FROM

loja1.produto PD INNER JOIN loja1.profor PF 
ON PD.procodigo  = PF.procodigo

INNER JOIN loja1.pjuridica PJ 
ON PF.pjcodigo  = PJ.pjcodigo

INNER JOIN loja1.estoquelocal EL
ON EL.procodigo = PD.procodigo

INNER JOIN loja1.pdvitem PDVI
ON PDVI.procodigo = PD.procodigo 

INNER JOIN loja1.local LC
ON EL.empcodigo = LC.empcodigo AND PDVI.empcodigo = LC.empcodigo

INNER JOIN loja1.pdv PDV
ON PDVI.pdvcodigo = PDV.pdvcodigo

WHERE PD.procodigo = 5470
#WHERE PF.forpadrao = 1 
#AND PJ.pjnome = 'Tramontina Eletrik S/a'
AND PF.forpadrao = 1 
AND EL.loccodigo IN (1,2,3) 
AND LC.loccodigo IN (1,2,3)
AND vendatainclusao BETWEEN '2022-06-01' AND '2022-07-09'
AND opecodigo IN (3,27,4)
GROUP BY PD.procodigo, PD.pronome, EL.locquantidade, PJ.pjnome, LC.empcodigo
ORDER BY TotalQtdeVendas Desc; 






SELECT PD.procodigo, PD.pronome, 

if(LC.empcodigo = 1, EL.locquantidade, 0) AS 'EstoqueBZ',
if(LC.empcodigo = 2, EL.locquantidade, 0) AS 'EstoqueRB',
if(LC.empcodigo = 3, EL.locquantidade, 0) AS 'EstoqueAC',


sum( if(LC.empcodigo = 1, PDVI.venqtde, 0) ) AS 'QtdeVendasBZ',
sum( if(LC.empcodigo = 2, PDVI.venqtde, 0) ) AS 'QtdeVendasRB',
sum( if(LC.empcodigo = 3, PDVI.venqtde, 0) ) AS 'QtdeVendasAC',

PJ.pjnome

FROM

loja1.produto PD INNER JOIN loja1.profor PF 
ON PD.procodigo  = PF.procodigo

INNER JOIN loja1.pjuridica PJ 
ON PF.pjcodigo  = PJ.pjcodigo

INNER JOIN loja1.estoquelocal EL
ON EL.procodigo = PD.procodigo

INNER JOIN loja1.pdvitem PDVI
ON PDVI.procodigo = PD.procodigo

INNER JOIN loja1.local LC
ON EL.empcodigo = LC.empcodigo AND PDVI.empcodigo = LC.empcodigo

INNER JOIN loja1.pdv PDV
ON PDVI.pdvcodigo = PDV.pdvcodigo

WHERE PD.procodigo = 5470 
#WHERE PF.forpadrao = 1 
AND PF.forpadrao = 1 
AND EL.loccodigo IN (1,2,3) 
AND LC.loccodigo IN (1,2,3)
AND vendatainclusao BETWEEN '2022-06-01' AND '2022-07-09'
AND opecodigo IN (3,27,4);
#GROUP BY PD.procodigo, PD.pronome, EL.locquantidade, PJ.pjnome, LC.empcodigo
#ORDER BY PDVI.venqtde Desc; 




