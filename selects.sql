-- Aqui você deve colocar os códigos SQL referentes às
-- Seleções de dados

-- 1)
SELECT 
  pe.id,
  pe.status,
  pe.cliente_id,
  pr.id,
  pr.nome,
  pr.tipo,
  pr."preço",
  pr.pts_de_lealdade
  
FROM
 produtos_pedidos AS pp
LEFT JOIN
  pedidos AS pe ON pe.id = pp.pedido_id
LEFT JOIN
  produtos AS pr ON pr.id = pp.produto_id;
-- 2)
SELECT 
  pe.id
FROM
 produtos_pedidos AS pp
LEFT JOIN
  pedidos AS pe ON pe.id = pp.pedido_id
LEFT JOIN
  produtos AS pr ON pr.id = pp.produto_id
WHERE
	pr.nome = 'Fritas';
-- 3)
SELECT 
  cl.nome AS Gostam_de_Fritas
  
  
FROM
 produtos_pedidos AS pp
LEFT JOIN
  clientes AS cl ON cl.id = pp.pedido_id
LEFT JOIN
  produtos AS pr ON pr.id = pp.produto_id
WHERE
	pr.nome = 'Fritas';

-- 4)
SELECT 

  SUM(pr."preço") AS SUM
  
FROM
 produtos_pedidos AS pp
LEFT JOIN
  clientes AS cl ON cl.id = pp.pedido_id

LEFT JOIN
  produtos AS pr ON pr.id = pp.produto_id
WHERE
 cl.nome = 'Laura';

-- 5)
SELECT 
  pr.nome,
  COUNT( pp.pedido_id)
  
FROM
 produtos_pedidos AS pp
LEFT JOIN
  pedidos AS pe ON pe.id = pp.pedido_id

LEFT JOIN
  produtos AS pr ON pr.id = pp.produto_id
GROUP BY
  pr.nome;