# Trabalho Prático: Modelos de Dados e XML
- [x] Feito

Neste trabalho exploraremos a leitura de dados XML usando o modelo DOM e manipulação de dados em arquivo usando Python ou Java. Este e os demais trabalhos devem ser feitos em grupo, de acordo com os grupos cadastrados. Use o fórum do moodle caso você precise encontrar um parceiro(a).

Usando como base os códigos-fonte e dados fornecidos pelo professor (pasta how-tos do Moodle), você deve implementar um programa que cumpra os seguintes requisitos:
  - Leia o arquivo XML fornecido contendo heróis da Marvel
  - Crie um diretório chamado "dadosMarvel” em algum lugar do disco
  - Para cada herói presente no XML, transforme os dados em dados tabulares (formato CSV) e escreva todas as linhas no arquivo "herois.csv” dentro do diretório "dadosMarvel”. Exemplo de algumas linhas e colunas para o arquivo gerado:

```
1, Spider Man, 1, Good, Male, 1.78, 75.75, USA, 4, 4, 3, 3, 1, 4
2, Iron Man, 20, Neutral, Male, 1.98, 102.58, USA, 6, 6, 5, 6, 6, 4
. . .
```

Crie os arquivos "herois_good.csv” e "herois_bad.csv”, seguindo o formato acima e contendo apenas os heróis bons e maus, respectivamente.
  - Calcule, a partir dos dados do arquivo, e imprima na tela a proporção de heróis bons/maus.
  - Calcule, a partir dos dados do arquivo, e imprima na tela a média de peso dos heróis
  - Calcule, a partir dos dados do arquivo, e imprima na tela o "Índice de massa corporal” do Hulk

## Submissão

A submissão será corrigida no GitLab. Implemente sua solução e faça o commit/push para o repositório do grupo que foi informado para o Professor. Certifique-se de que o arquivo README.md esteja atualizado com os nomes, RAs e logins GitLab dos integrantes do grupo. Implemente sua solução no diretório "01 - Modelos de dados e XML” que foi criado automaticamente no seu repositório após a clonagem do repositório do professor. Submeta abaixo um texto com o link para o repositório do grupo e o resultado do comando "git log HEAD origin/master”. Submissões que não atendem às especificações não serão consideradas.
