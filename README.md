<h1 align="center">
    Banco de dados: Relação delegacia-denuncia
</h1>

## :detective:Índice

* Sobre o Projeto;
* Tecnologias utilizadas;
* Diagrama;
* Autor.

## :desktop_computer:Sobre o Projeto

O projeto foi desenvolvido no PostgreSQL a partir de uma única relação: delegacia-denuncia. A partir desta foram modeladas outras entidades de acordo com o contexto da relação e das regras de negócio:

### Contexto do relacionamento delegacia-denuncia: 

> O departamento de Polícia do Rio de Janeiro adotou um novo sistema de 
gerenciamento de denúncias digitais, que armazena as denúncias 
em um banco de dados relacional.
Dependendo da categoria da denúncia, ela será alocada a um diferente
setor da delegacia, que tomará os passos para analisar e resolver.

 ### Regras de Negócio:
> * Cada usuário terá um cadastro;
> * Um usuário poderá realizar uma ou mais denúncias;
> * Haverão mais de uma categoria de denúncia disponíveis;
> * Cada denúncia será alocada a uma diferente seção, que alocará um policial;
> * Um policial irá iniciar um processo após receber uma denúncia;
> * Cada policial será especializado em uma diferente categoria, que ditará sua seção.

## :hammer_and_wrench: Tecnologias utilizadas

- [DBeaver](https://dbeaver.io/download/)
- [PostgreSQL](https://www.postgresql.org)
- [Draw.io](https://app.diagrams.net/)
- [GitHub](https://github.com/)

## :chart_with_upwards_trend: Diagramas

<div align="center">

  ### Modelo Conceitual
  <img src=modeloConceitual.png>
  
  ### Modelo Lógico
  <img src=modeloLogico.png>

</div>

## Autor

- :man_technologist: [Paulo Henrique]([github.com/paulooosf](https://github.com/paulooosf))

  <sub>Projeto desenvolvido durante a disciplina de Banco de Dados da Residência em TIC/Software do Serratec.</sub>
