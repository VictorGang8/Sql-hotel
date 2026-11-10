-- Banco do hotel
CREATE DATABASE hotel_left;
USE hotel_left;
 
-- Quartos do hotel
CREATE TABLE quarto (
  id INT AUTO_INCREMENT PRIMARY KEY,
  numero VARCHAR(5) NOT NULL UNIQUE,
  tipo VARCHAR(15) NOT NULL,
  diaria DECIMAL(7,2) NOT NULL
);
 
-- Reservas: quarto_id aponta para quarto(id)
CREATE TABLE reserva (
  id INT AUTO_INCREMENT PRIMARY KEY,
  hospede VARCHAR(60) NOT NULL,
  data_entrada DATE NOT NULL,
  noites INT NOT NULL,
  quarto_id INT NOT NULL,
  FOREIGN KEY (quarto_id) REFERENCES quarto(id)
);
 
INSERT INTO quarto (numero, tipo, diaria) VALUES
  ('101', 'Standard', 180.00),
  ('102', 'Standard', 180.00),
  ('201', 'Luxo', 320.00),
  ('202', 'Luxo', 320.00),
  ('301', 'Suíte', 550.00),
  ('302', 'Suíte', 550.00);
 
INSERT INTO reserva (hospede, data_entrada, noites, quarto_id) VALUES
  ('Carlos Souza', '2026-11-10', 2, 1),
  ('Beatriz Lima', '2026-11-12', 3, 1),
  ('Pedro Alves', '2026-11-10', 1, 3),
  ('Larissa Melo', '2026-11-14', 2, 3),
  ('Marcos Dias', '2026-11-11', 4, 3),
  ('Fernanda Rocha', '2026-11-13', 2, 5),
  ('João Pereira', '2026-11-15', 5, 5),
  ('Sofia Nunes', '2026-11-12', 1, 1);
  
  select * from reserva;
  select * from quarto;
  
-- 1 Mostre todos os quartos com os seus reservas, incluindo quem não tem nenhum. Comece o FROM pela tabela quarto. Quantas linhas saíram? (LEFT JOIN)

SELECT quarto.numero, reserva.hospede
FROM quarto
LEFT JOIN reserva
ON reserva.quarto_id = quarto.id;

-- 2 Rode a mesma consulta trocando LEFT JOIN por INNER JOIN. Quantas linhas saíram agora? Quem sumiu, e por quê?
-- 8 Linhas sairam, sumiram 102,202 e 302, porque o INNer JOIN nao mostra o NULL
SELECT quarto.numero, reserva.hospede
FROM quarto
INNER JOIN reserva
ON reserva.quarto_id = quarto.id;


-- 3 Quais quartos não têm nenhuma reserva? (LEFT JOIN e IS NULL)
SELECT quarto.numero
FROM quarto
LEFT JOIN reserva
ON reserva.quarto_id = quarto.id
WHERE reserva.id IS NULL;
-- 102, 202 e 302

-- 4 Quantas reservas cada quarto tem, incluindo quem tem zero? (COUNT de uma coluna e GROUP BY)
select quarto.numero, count(reserva.id) as total
from quarto
left join reserva
on reserva.quarto_id = quarto.id
group by quarto.numero;

-- Mostre os quartos do tipo Suíte com os seus hóspedes, incluindo suíte sem reserva. (WHERE na tabela da esquerda)
select quarto.numero, reserva.hospede
from quarto
inner join reserva
on reserva.quarto_id = quarto.id
where quarto.tipo = 'Suite';