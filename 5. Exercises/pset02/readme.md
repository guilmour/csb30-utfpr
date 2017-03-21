## 01) Exercício: Modelagem ER
  - [ ] Feito
  
Modele em um diagrama ER o banco de dados para o serviço de microblogs e rede social Twitter. O serviço permite o cadastro de usuários que devem informar nome, e-mail, e um identificador único para a conta. Usuários podem seguir (follow) outros usuários. Usuários também podem bloquear outros usuários.

Usuários postam mensagens (tweets). Mensagens possuem identificador, conteúdo (texto) e timestamp do momento de postagem (estilo Unix time, ou seja, representa o número total de segundos decorridos desde 0:00 de 1/1/1970). Mensagens podem mencionar outros usuários (conhecidos como at ou @) e mencionar tópicos (conhecidos como hashtags ou #). Tópicos possuem id e rótulo (e.g. "banco_de_dados”). Usuários e tópicos são automaticamente extraídos do texto do post no momento de envio com base nas strings que começam por @ ou #. Por exemplo, a mensagem "Hoje é dia de prova de #banco_de_dados! @UTFPR @BSI” referencia o tópico "banco_de_dados” e os usuários "UTFPR” e "BSI”. Mensagens podem ser repostadas (re-tweets), marcadas como favoritas, ou respondidas por qualquer usuário. Mensagens de resposta são novas mensagens que fazem referência à mensagem original. Mensagens repostadas são idênticas às originais, mas fazem referência aos usuários que as repostaram.

Descreva no seu diagrama todas as entidades e relacionamentos relevantes, atributos, chaves primárias e cardinalidades. Minimize a redundância de informação.

## Submissão
Submeta abaixo um único arquivo de imagem no formato JPG ou PNG. O modelo pode ser feito em qualquer software de edição de imagens ou feito a mão e escaneado/fotografado. Independentemente da abordagem usada, os componentes devem estar claros. Submissões que não atenda à especificação não serão corrigidas.

<hr>

## 02) Trabalho prático - Modelagem
- [ ] Feito
### Descrição do mini-mundo
Nossa rede social deve registrar as pessoas da turma (alunos, monitores e professores indistintamente), com um login único, nome completo e cidade natal. As pessoas podem registrar seus conhecidos da turma na rede social. A definição de quem uma pessoa conhece é um conceito individual e pode variar na rede. Por exemplo, algumas pessoas só considerarão como conhecidos os amigos mais próximos, outras considerarão como conhecidos pessoas que conhecem de vista. Portanto, o relacionamento pode não ser recíproco.

Pessoas podem bloquear outras pessoas da suas listas de conhecidos. É preciso armazenar as razões para cada bloqueio (spammer, conteúdo abusivo, motivos pessoais ou outras). Caso a razão seja "outras", o sistema deve armazenar um texto descrevendo a razão. Pessoas podem ser bloqueadas por mais de uma razão.

A rede social também registra "artistas musicais” e filmes dos quais as pessoas gostam. Artistas musicais podem ser cantores(as) ou bandas. Artistas musicais possuem nome artístico, identificador único, país e gênero. Bandas possuem múltiplos músicos. Para músicos, precisamos registrar nome real, estilo musical e data de nascimento. Um cantor(a) também possui um músico correspondente.

Filmes possuem nome, identificador (string única) e data de lançamento. Cada filme tem um diretor e um diretor pode dirigir vários filmes ao longo da carreira. Um filme também possui atores. Tanto atores quanto diretores possuem identificador (string única), telefone e endereço. Um ator pode ser também diretor. Um filme é classificado em uma categoria (ação, documentário, ficção etc.). Categorias são representadas em uma hierarquia (ex. ação é subcategoria de ficção).

Pessoas podem curtir artistas musicais e filmes. As pessoas atribuem uma nota (inteiro de 1 a 5) a cada artista musical ou filme, indicando o quanto gosta do item (1 = pouco, 5 = muito).

Implemente um modelo ER contendo apenas os conceitos descritos acima. Casa alguma informação dada não seja suficiente para tomar uma decisão, basei-se em casos do mundo real.

### Submissão
A submissão será corrigida no GitLab. Implemente sua solução e faça o commit/push para o repositório do grupo que foi informado para o Professor. Certifique-se de que o arquivo README.md esteja atualizado com os nomes, RAs e logins GitLab dos integrantes do grupo. Implemente sua solução no diretório "02 - Modelagem” que foi criado automaticamente no seu repositório após a clonagem do repositório do professor. Seu modelo deve ser um arquivo de imagem (PNG). O modelo pode ser feito em qualquer programa de desenho. Armazene os fontes no GitLab. Se preferir, o aluno pode digitalizar um modelo feito em papel e caneta. Independente da opção, a submissão só será corrigida se todos os componentes de modelo estiverem claros e fáceis de ler. Submeta abaixo um texto com o link para o repositório do grupo e o resultado do comando "git log HEAD origin/master”. Submissões que não atendem às especificações não serão consideradas.
Link para submissão: http://moodle.dainf.ct.utfpr.edu.br/mod/assign/view.php?id=22306
