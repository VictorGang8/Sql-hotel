# 🚛 Transportadora SQL - Estudo de JOINs e Agregações

Projeto prático em **SQL (MySQL)** focado na modelagem, manipulação e consulta de dados de uma empresa de logística/transportadora. O objetivo principal deste repositório é exercitar conceitos fundamentais e avançados de junção de tabelas (`LEFT JOIN`, `INNER JOIN`), agregações (`SUM`, `COUNT`, `MAX`) e filtros avançados (`HAVING`, `ON` vs `WHERE`).

---

## 📐 Estrutura do Banco de Dados

O banco `transportadora_left` é composto por duas tabelas principais ligadas por uma chave estrangeira (1:N):

* **`motorista`**: Armazena os dados dos motoristas cadastrados.
* **`entrega`**: Armazena o código, destino, peso, status e a chave estrangeira do motorista responsável pela entrega.

```mermaid
erDiagram
    MOTORISTA ||--o{ ENTREGA : "realiza"
    MOTORISTA {
        int id PK
        string nome
        string cnh
        string cidade_base
    }
    ENTREGA {
        int id PK
        string codigo UK
        string destino
        decimal peso_kg
        string status
        int motorista_id FK
    }
