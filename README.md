# Projeto Básico Delphi - CRUD de Produtos

Este projeto foi desenvolvido em **Delphi** como um exemplo prático de um sistema CRUD (Create, Read, Update, Delete) para gerenciamento de produtos.  
Ele permite cadastrar, editar, excluir e visualizar produtos em uma tabela exibida via **DBGrid**.

---

## ✨ Funcionalidades
- **Cadastro de produtos** com código, nome, preço, quantidade e foto.
- **Edição de produtos** já existentes.
- **Exclusão de registros** diretamente pelo DBGrid.
- **Visualização** dos produtos cadastrados em uma tabela.
- **Filtro por coluna**: é possível clicar no cabeçalho da coluna e aplicar filtros dinâmicos.

---

## 🗄️ Estrutura da Tabela `produto`

Para que o projeto funcione corretamente, crie a tabela `produto` no banco de dados com a seguinte definição:

```sql
CREATE TABLE produto (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nome_produto VARCHAR(50) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    quantidade INT NOT NULL,
    foto_produto VARBINARY(MAX),
    id_categoria INT,
    CONSTRAINT FK_produto_categoria
        FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
);
