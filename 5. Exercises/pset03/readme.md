## Trabalho Prático - Modelo Lógico (Esquemas)
  - [ ] Feito
### Implementação do Modelo

Crie os esquemas (relações) de um banco que implemente seu modelo ER para a rede social.

Suas relações devem representar todas as entidades e relacionamentos do modelo. Inclua todos os atributos e crie chaves primárias e estrangeiras conforme seu modelo.

Caso você perceba que precisa mudar seu modelo ER, refaça o diagrama e envie seguindo as instruções abaixo.

Os esquemas devem estar no seguinte formato:

```
Nome_Da_Relação(Chave, Atributo_1, ... Atributo_n) Atributo_y → Relação_Referenciada
```

### Entrega
```
Filme(ID, nome, data de lançamento)

Filmes_Diretores(ID_FILME, ID_DIRETOR)
- ID_FILME: chave estrangeira para FILME
- ID_DIRETOR: chave estrangeira para DIRETOR

Filmes_Atores(ID_ATORES, ID_FILME)
- ID_ATORES: chave estrangeira para ATORES
- ID_FILME: chave estrangeira para FILME

Diretor(ID, telefone, endereço)

Atores(ID, telefone, endereço)

Atores_Diretores(ID_ATOR, ID_DIRETOR)
- ID_ATOR: chave estrangeira para ATORES
- ID_DIRETOR: chave estrangeira para DIRETORES

Filmes_Categorias(ID_FILME, NOME_CATEGORIA)
- ID_FILME: chave estrangeira para FILME
- NOME_CATEGORIA: chave estrangeira para CLASSIFICAÇÃO

Classificação(NOME_FILME, CATEGORIA)
- CATEGORIA: chave estrangeira para SUBORDINADA

Subordinada(CATEGORIA, superior)

Artista Musical:
Cantor/Banda(ID, Nome Artístico, País e Gênero)

- ID: Chave estrangeira para Músicos.

Músico(ID, Nome Real, Estilo Musical e Data de Nascimento)

```
