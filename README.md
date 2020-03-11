# Format Converter (Delphi)

>Conversor de formatos (JSON, XML, etc) para Delphi.

<br />

![Maintenance](https://img.shields.io/maintenance/yes/2020)
![Build](https://img.shields.io/badge/Build-1.1.14.114-brightgreen) 
![GitHub release (latest by date)](https://img.shields.io/github/v/release/bomrafinha/FormatConverter)
![GitHub Release Date](https://img.shields.io/github/release-date/bomrafinha/FormatConverter)

![GitHub last commit](https://img.shields.io/github/last-commit/bomrafinha/FormatConverter)
![GitHub contributors](https://img.shields.io/github/contributors/bomrafinha/FormatConverter)

![GitHub issues](https://img.shields.io/github/issues/bomrafinha/FormatConverter)
![GitHub closed issues](https://img.shields.io/github/issues-closed/bomrafinha/FormatConverter)
![GitHub pull requests](https://img.shields.io/github/issues-pr/bomrafinha/FormatConverter)
![GitHub closed pull requests](https://img.shields.io/github/issues-pr-closed/bomrafinha/FormatConverter)
![GitHub forks](https://img.shields.io/github/forks/bomrafinha/FormatConverter)
![GitHub stars](https://img.shields.io/github/stars/bomrafinha/FormatConverter)
![GitHub All Releases](https://img.shields.io/github/downloads/bomrafinha/FormatConverter/total)

![GitHub top language](https://img.shields.io/github/languages/top/bomrafinha/FormatConverter)
![GitHub language count](https://img.shields.io/github/languages/count/bomrafinha/FormatConverter)
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/bomrafinha/FormatConverter)

![GitHub](https://img.shields.io/github/license/bomrafinha/FormatConverter)

<br />

*******
## Índice
 1. [Uso](#uso)
 2. [Sitemap](#sitemap)
 3. [Estrutura](#estrutura)
 4. [Workgroup](#workgroup)
 5. [Dependências](#dependencias)
 6. [Instalação/Configuração](#instalacao)
 7. [Contribuir](#contribuir)
 8. [Checklist para Contribuir](#checklist)
 9. [Créditos](#creditos)
 10. [Licença](#licenca)
 11. [Documentação](#documentacao)
 12. [TODO](#todo)
 13. [Árvore do Projeto](#arvore)
*******

<br />

## Uso <a name="uso"></a>
Implementar as **[formas de uso](documentation/usage)**.

![Uso](documentation/usage/uso.png)

<br />

+ **PACKAGE**
  - **CLASS**
    * **METHOD:** Descrição do Método
      + **Parametrização**
        - *var01*: Variável 01;
        - *var02*: Variável 02;


 
## [Sitemap](https://coggle.it/diagram/XmZ2-WVe0wuFMqlu/t/-) <a name="sitemap"></a>   
![Sitemap](documentation/images/sitemap.png)

<br />

## Estrutura <a name="estrutura"></a>
+ **app:** Contém a compilação do(s) pacote(s) e testador(es);
+ **documentation:** Contém a documentação do(s) pacote(s);
+ **images:** Contém as imagens usadas no(s) pacote(s);
+ **modules:** Módulos não essenciais, como testadores, etc;
  - **testador tal:** Implementar;
+ **output:** Contém os arquivos précompilados usados pelo Delphi (.dcu);
+ **project:** Diretório com os projetos de cada pacote e testador;
+ **src:** Contém o fonte essencial para o funcionamento do(s) pacote(s);
  - **pacote tal:** Pacote centralizador do sistema, quando o executável faz a chamada da função solicitada é essa parte da aplicação que localiza as rotinas nos pacotes;
+ **vendor:** Contém os pacotes de terceiros;
 
<br />

## Workgroup <a name="workgroup"></a>
Deve-se manter a ordem de compilação do projeto exatamente como na imagem.

![Workgroup](documentation/images/workgroup.png)

<br />

## Dependências <a name="dependencias"></a>
+ **Dependência01:** Dependência;

<br />

## Instalação/Configuração <a name="instalacao"></a>
+ **[Configuração](documentation/configuracaoFonte.md)**

<br />

## Contribuir <a name="contribuir"></a>
1. Faça um "fork" com base no master;
2. Faça "commit" de suas alterações (Caso estiver resolvento alguma "issue" não esqueça de na mensagem escrever "Fixed #numeroIssue");
3. Faça "push" de seus commits;
4. Solicite um "pull request" para o master do repositório principal.

<br />

## Checklist para Contribuir <a name="checklist"></a>
+ Testar as funcionalidades criadas / alteradas;
+ Marcar com "#" os issues concluídos, nos commits;
+ Readme (caso nescessário)
  - Número do build;
  - Alterar indice;
  - Alerar / adicionar forma de uso;
  - Incluir pacotes / classes / métodos / parâmetros nas formas de uso;
  - Alterar sitemap;
  - Alterar estrutura da aplicação;
  - Imagem atualizada do Workgroup;
  - Adicionar / Remover dependências (pacotes de terceiros);
  - Atualizar métodos de instalação / configuração do pacote;
  - Atualizar a documentação do fonte;
  - Remover / adicionar itens ao TODO;
  - Atualizar árvore do projeto;
+ Ao adicionar itens ao TODO, não esquecer de criar a "issue" correspondente;
  * Labels principais
    - **bug:** Correção de algum problema;
    - **documentation:** Alteração na documentação;
    - **enhacement:** Alteração de funcionalidade existente para melhorá-la;
    - **feature:** Nova funcionalidade;
  * Projeto
    - **FormatConverter - Kanban:** Para melhor organizar o projeto;

<br />

## Créditos <a name="creditos"></a>
[@bomrafinha](https://github.com/bomrafinha)

<br />

## [Licença](./LICENSE) <a name="licenca"></a>
Verificar tipo de licença.
+ Propriedade Intelectual: [@bomrafinha](https://github.com/bomrafinha)

<br />

## Documentação <a name="documentacao"></a>
+ **[Implementar documentação](documentation/documentacao.md)**

<br />

## TODO <a name="todo"></a>
+ Documentação
  - README
  - LICENCE
  - usage
  - configuração do fonte
  - arquivo padronização de código e documentação
  - forma de versionamento
  - checklist de atualização

+ Estrutura básica do código
  - Pacotes com recursos visuais (arrastar e soltar)

+ Conversor JSON -> XML
  - Entrada JSON    -> Saída XML
  - Entrada JSON    -> Saída string
  - Entrada JSON    -> Saída arquivo
  - Entrada string  -> Saída XML
  - Entrada string  -> Saída string
  - Entrada string  -> Saída arquivo
  - Entrada arquivo -> Saída XML
  - Entrada arquivo -> Saída string
  - Entrada arquivo -> Saída arquivo
  - Normalizar origin String      -> JSON
  - Normalizar origin JSON        -> TStringList
  - Normalizar origin TStringList -> String
  - Normalizar return String      -> XML
  - Normalizar return XML         -> TStringList
  - Normalizar return TStringList -> String

+ Conversor JSON -> CSV
  - Entrada JSON    -> Saída CSV
  - Entrada JSON    -> Saída string
  - Entrada JSON    -> Saída arquivo
  - Entrada string  -> Saída CSV
  - Entrada string  -> Saída string
  - Entrada string  -> Saída arquivo
  - Entrada arquivo -> Saída CSV
  - Entrada arquivo -> Saída string
  - Entrada arquivo -> Saída arquivo
  - Normalizar origin String      -> JSON
  - Normalizar origin JSON        -> TStringList
  - Normalizar origin TStringList -> String
  - Normalizar return String      -> CSV
  - Normalizar return CSV        -> TStringList
  - Normalizar return TStringList -> String

+ Conversor XML -> JSON
  - Entrada XML     -> Saída JSON

+ Conversor XML -> CSV
  - Entrada XML    -> Saída CSV
  - Entrada XML    -> Saída string
  - Entrada XML    -> Saída arquivo
  - Entrada string  -> Saída CSV
  - Entrada string  -> Saída string
  - Entrada string  -> Saída arquivo
  - Entrada arquivo -> Saída CSV
  - Entrada arquivo -> Saída string
  - Entrada arquivo -> Saída arquivo
  - Normalizar origin String      -> XML
  - Normalizar origin XML         -> TStringList
  - Normalizar origin TStringList -> String
  - Normalizar return String      -> CSV
  - Normalizar return CSV        -> TStringList
  - Normalizar return TStringList -> String

+ Conversor CSV -> JSON
  - Entrada CSV     -> Saída JSON
  - Entrada CSV     -> Saída string
  - Entrada CSV     -> Saída arquivo
  - Entrada string  -> Saída JSON
  - Entrada string  -> Saída string
  - Entrada string  -> Saída arquivo
  - Entrada arquivo -> Saída JSON
  - Entrada arquivo -> Saída string
  - Entrada arquivo -> Saída arquivo
  - Normalizar origin String      -> CSV
  - Normalizar origin CSV         -> TStringList
  - Normalizar origin TStringList -> String
  - Normalizar return String      -> JSON
  - Normalizar return JSON        -> TStringList
  - Normalizar return TStringList -> String

+ Conversor CSV -> XML
  - Entrada CSV    -> Saída XML
  - Entrada CSV    -> Saída string
  - Entrada CSV    -> Saída arquivo
  - Entrada string  -> Saída XML
  - Entrada string  -> Saída string
  - Entrada string  -> Saída arquivo
  - Entrada arquivo -> Saída XML
  - Entrada arquivo -> Saída string
  - Entrada arquivo -> Saída arquivo
  - Normalizar origin String      -> CSV
  - Normalizar origin CSV         -> TStringList
  - Normalizar origin TStringList -> String
  - Normalizar return String      -> XML
  - Normalizar return XML         -> TStringList
  - Normalizar return TStringList -> String

<br />

## Árvore do Projeto <a name="arvore"></a>
```
FormatConversor
├── app
│   └── .gitkeep
├── documentation
│   ├── images
│   │   ├── sitemap - Copia (2).png
│   │   ├── sitemap.png
│   │   └── workgroup.png
│   ├── usage
│   │   └── uso.png
│   ├── configuracaoFonte.md
│   └── documentacao.md
├── images
│   └── .gitkeep
├── modules
│   ├── U_Testador.View.fmx
│   └── U_Testador.View.pas
├── output
│   └── .gitkeep
├── project
│   ├── Delphi XMLtoJSON.groupproj
│   ├── Testador.dpr
│   ├── Testador.dproj
│   ├── XMLtoJSON.dpk
│   └── XMLtoJSON.dproj
├── src
│   └── XMLtoJSON
│       └── U_XMLtoJSON.pas
├── vendor
│   └── .gitkeep
├── .gitattributes
├── .gitignore
├── LICENSE
└── README.md
```