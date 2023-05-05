-- Aqui você deve colocar os códigos SQL referentes às
-- Simulações de um CRUD

-- Criação

-- 1)
INSERT INTO clientes
          (nome, lealdade)
        VALUES
          ('Georgia', 0);


-- 2)
INSERT INTO pedidos 
            (status, cliente_id)
        VALUES
          ('Recebido', 6);


-- 3)
INSERT INTO produtos_pedidos
          (pedido_id, produto_id)
        VALUES
          (6, 1),
          (6, 2),
          (6, 6),
          (6, 8),
          (6, 8);


-- Leitura

-- 1)
SELECT 
  pe.id,
  cl.nome,
  cl.lealdade,
  pe.status,
  pe.cliente_id,
  pr.id,
  pr.nome,
  pr.tipo,
  pr."preço",
  pr.pts_de_lealdade
  
FROM
 produtos_pedidos AS pp
LEFT JOIN( pedidos AS pe
  LEFT JOIN 
 clientes AS cl on cl.id = pe.id ) ON pe.id = pp.pedido_id

LEFT JOIN
  produtos AS pr ON pr.id = pp.produto_id
WHERE
  cl.nome = 'Georgia';


-- Atualização

-- 1)

UPDATE 
	clientes
SET
	lealdade = (SELECT SUM(tabeleGeorgia.pts_de_lealdade)
                FROM  (SELECT 
  pe.id,
  cl.nome,
  cl.lealdade,
  pe.status,
  pe.cliente_id,
  pr.id,
  pr.nome,
  pr.tipo,
  pr."preço",
  pr.pts_de_lealdade
  
FROM
 produtos_pedidos AS pp
LEFT JOIN( pedidos AS pe
  LEFT JOIN 
 clientes AS cl on cl.id = pe.id ) ON pe.id = pp.pedido_id

LEFT JOIN
  produtos AS pr ON pr.id = pp.produto_id
WHERE
  cl.nome = 'Georgia'
               ) AS tabeleGeorgia)
WHERE
 clientes.id = 6;

-- Deleção

-- 1)
DELETE FROM
  clientes AS cl
  WHERE
	cl.nome = 'Marcelo';  




