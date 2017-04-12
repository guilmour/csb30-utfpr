## 1. Trabalho Prático - XML Parsing e inserção de dados

  - [ ] Feito

### XML Parsing e inserção de dados
Os dados da nossa rede social foram exportados para XML. Você deve criar um programa (Java, Python ou qualquer outra linguagem) que leia os XMLs com os dados e os insira no seu banco de dados. Como os dados provenientes do XML são mais simples que o modelo desenvolvido no trabalho até o momento, os grupos podem simplificar os esquemas definidos se acharem adequado. A leitura do XML deve ser feita diretamente da internet (ou seja, você não pode salvar e ler os arquivos no disco). Os arquivos estão publicados em:

Pessoas: [http://dainf.ct.utfpr.edu.br/~gomesjr/BD1/data/person.xml](http://dainf.ct.utfpr.edu.br/~gomesjr/BD1/data/person.xml)

Artistas Musicais: [http://dainf.ct.utfpr.edu.br/~gomesjr/BD1/data/music.xml](http://dainf.ct.utfpr.edu.br/~gomesjr/BD1/data/music.xml)

Filmes: [http://dainf.ct.utfpr.edu.br/~gomesjr/BD1/data/movie.xml](http://dainf.ct.utfpr.edu.br/~gomesjr/BD1/data/movie.xml)

Conhecidos: [http://dainf.ct.utfpr.edu.br/~gomesjr/BD1/data/knows.xml](http://dainf.ct.utfpr.edu.br/~gomesjr/BD1/data/knows.xml)

### Submissão

A submissão será corrigida usando o GitLab. Implemente sua solução e faça o commit/push para o repositório do grupo que foi informado para o Professor. Certifique-se de que o arquivo README.md esteja atualizado com os nomes, RAs e logins GitLab dos integrantes do grupo. Implemente sua solução no diretório "04 - XML Parsing e inserção de dados” que foi criado automaticamente no seu repositório após a clonagem do repositório do professor. Na raiz deste diretório, crie um arquivo chamado readme.txt que descreva a localização dos arquivos fontes da sua solução. Submeta abaixo um texto com o link para o repositório do grupo e o resultado do comando "git log HEAD origin/master”. Submissões que não atendem às especificações não serão consideradas.


## working

primeiro, vamos atualizar nosso pip para uma versão recente com

```
sudo pip install -U pip
```

então, vamos instalar
```
sudo -H pip install psycopg2
sudo -H pip install wget
```
