#  DesafioDIO Cenário E-commerce - Projeto Lógico de BD

Para esse projeto, refinei um modelo conceitual de E-commerce (nos arquivos é possível ver o modelo EER antes e depois do refinamento), criei SCRIPTS para a implementação do BD, para o povoamento das tabelas e criei queries SQL com as cláusulas: 
_Recuperações simples com SELECT Statement;
Filtros com WHERE Statement;
Crie expressões para gerar atributos derivados;
Defina ordenações dos dados com ORDER BY e GROUP BY;
Condições de filtros aos grupos – HAVING Statement;
Crie junções (JOIN) entre tabelas para fornecer uma perspectiva mais complexa dos dados;_

No processo de refinamento da modelagem, eliminei as tabelas Cliente, Fornecedor e Vendedor-Terceiro e centralizei como pessoa: Pessoa_Fisica e Pessoa_Juridica, pois os dados se repetiam nas tabelas separadas, o Fornecedor também pode ser um Cliente e um Vendedor-Terceiro (ou cliente) pode ser PF ou PJ.
