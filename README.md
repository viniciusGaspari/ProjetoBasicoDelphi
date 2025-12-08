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

## ⚙️ Configuração da Conexão com o Banco de Dados (ADOConnection)

O projeto utiliza um **ADOConnection** localizado no `uDataModule.pas` para gerenciar a conexão com o banco de dados.  
Você pode customizar a conexão diretamente pelo Object Inspector ou via código.

### 🔧 Configuração pelo Object Inspector
1. Abra o arquivo `uDataModule.pas` no Delphi.
2. Selecione o componente `ADOConnection1`.
3. No Object Inspector, configure a propriedade **ConnectionString**:
   - Clique em `...` para abrir o assistente.
   - Escolha o provedor adequado (ex.: `Microsoft OLE DB Provider for SQL Server`).
   - Informe o servidor, banco de dados, usuário e senha.
   - Teste a conexão antes de salvar.

### 🔧 Configuração via código
Você também pode definir a conexão programaticamente no evento `OnCreate` do DataModule:

```delphi
procedure TDataModule1.DataModuleCreate(Sender: TObject);
begin
  ADOConnection1.ConnectionString :=
    'Provider=SQLOLEDB.1;' +
    'Persist Security Info=False;' +
    'User ID=seu_usuario;' +
    'Password=sua_senha;' +
    'Initial Catalog=nome_do_banco;' +
    'Data Source=SEU_SERVIDOR;';
  ADOConnection1.LoginPrompt := False;
  ADOConnection1.Connected := True;
end;
