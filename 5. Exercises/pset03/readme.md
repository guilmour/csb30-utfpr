## Trabalho Prático - Modelo Lógico (Esquemas)
  - [x] Feito
### Implementação do Modelo

Crie os esquemas (relações) de um banco que implemente seu modelo ER para a rede social.

Suas relações devem representar todas as entidades e relacionamentos do modelo. Inclua todos os atributos e crie chaves primárias e estrangeiras conforme seu modelo.

Caso você perceba que precisa mudar seu modelo ER, refaça o diagrama e envie seguindo as instruções abaixo.

Os esquemas devem estar no seguinte formato:

```
Nome_Da_Relação(Chave, Atributo_1, ... Atributo_n) Atributo_y → Relação_Referenciada
```

### Entrega
```mysql
Pessoa( _login_ , nome, cid_natal)

Conhece(_login_, _login2_)
  - login, login2; [FK] -> Pessoa

Bloqueia(_login_, _login2_, motivo)
  - login, login2; [FK] -> Pessoa

CurtirAstista(login, ArtistaID, Nota)
  - login [FK] -> Pessoa
  - ArtistaID [FK] -> ArtistaMusical

CurtirFilme(login, FilmeID, Nota)
  - login [FK] -> Pessoa
  - FilmeID [FK] -> Filme

Categoria(FilmeID, Categoria)
  - FilmeID [FK] -> Filme

ArtistaMusical(_Id_, nome_artistico, pais, genero_mus)

Musicos(nome_real, estilo, data_nasc, ArtistaID)
  - ArtistaID [FK] -> ArtistaMusical

Filme(_Id_, nome, data_estreia)

Artista(_Id_, nome, telefone, endereco)

Atua(FilmeID, AtorID)
  - FilmeID [FK] -> Filme
  - AtorID [FK] -> Artista

Dirige(FilmeID, DiretorID)
  - FilmeID [FK] -> Filme
  - DiretorID [FK] -> Artista

```
