<h1 align="center">Banco de dados: relação delegacia-denúncia</h1>
<h4 align="center">Projeto desenvolvido durante a disciplina de Banco de Dados da Residência em TIC/Software 2024.1 do Serratec.</h4>
<p align="center">
  <img alt="PostgreSQL" src="https://img.shields.io/badge/POSTGRESQL-%234169E1?style=for-the-badge&logo=POSTGRESQL&logoColor=%234169E1&labelColor=black">
  <img alt="DBeaver" src="https://img.shields.io/badge/dbeaver-%23382923?style=for-the-badge&logo=dbeaver&logoColor=%23382923&labelColor=black">
</p>
<p align="center">
  <a href="#contexto">Contexto</a> •
  <a href="#diagramas">Diagramas</a> •
  <a href="#créditos">Créditos</a>
</p>

## Contexto
O departamento de Polícia do Rio de Janeiro adotou um novo sistema de 
gerenciamento de denúncias digitais, que armazena as denúncias 
em um banco de dados relacional.
Dependendo da categoria da denúncia, ela será alocada a um diferente
setor da delegacia, que tomará os passos para analisar e resolver.

### Regras de Negócio:
 * Cada usuário terá um cadastro;
 * Um usuário poderá realizar uma ou mais denúncias;
 * Haverão mais de uma categoria de denúncia disponíveis;
 * Cada denúncia será alocada a uma diferente seção, que alocará um policial;
 * Um policial irá iniciar um processo após receber uma denúncia;
 * Cada policial será especializado em uma diferente categoria, que ditará sua seção.
## Diagramas
### Modelo Conceitual
<img src=modeloConceitual.png>

### Modelo Lógico
<img src=modeloLogico.png>

## Créditos
- Paulo Henrique - [paulooosf](http://github.com/paulooosf)
