# Format Converter (Delphi)

>Conversor de formatos (JSON, XML, etc) para Delphi.

<br />

![Maintenance](https://img.shields.io/maintenance/yes/2020)
![Build](https://img.shields.io/badge/Build-1.1.14.172-brightgreen) 
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
 11. [Padronização de Código](#source)
 12. [TODO](#todo)
 13. [Árvore do Projeto](#arvore)
*******

<br />

## Uso <a name="uso"></a>

- **TXMLtoJSON**
  * **stringToString:** Converte um XML em forma de String em um JSON em forma de string (string);
    + **Parametrização**
      - *strContent:* XML à converter (string);
  * **stringToFile:** Converte um XML em forma de String em um arquivo JSON (boolean);
    + **Parametrização**
      - *strContent:* XML à converter (string);
      - *filePathResult:* Caminho do arquivo JSON à ser salvo (string);
  * **stringToReturnType:** Converte um XML em forma de String em um JSON em forma de TJSONObject (TJSONObject);
    + **Parametrização**
      - *strContent:* XML à converter (string);
  * **fileToString:** Converte um arquivo XML em um JSON em forma de string (string);    
    + **Parametrização**
      - *filePath:* Caminho do arquivo XML à converter (string);
  * **fileToFile:** Converte um arquivo XML em um arquivo JSON (boolean);
    + **Parametrização**
      - *filePath:* Caminho do arquivo XML à converter (string);
      - *filePathResult:* Caminho do arquivo JSON à ser salvo (string);
  * **fileToReturnType:** Converte um arquivo XML em um JSON em forma de TJSONObject (TJSONObject);
    + **Parametrização**
      - *filePath:* Caminho do arquivo XML à converter (string);
  * **originTypeToString:** Converte um XML em forma de TXMLDocument em um JSON em forma de string (string);
    + **Parametrização**
      - *content:* XML à converter (TXMLDocument);
  * **originTypeToFile:** Converte um XML em forma de TXMLDocument em um arquivo JSON (boolean);
    + **Parametrização**
      - *content:* XML à converter (TXMLDocument);
      - *filePathResult:* Caminho do arquivo JSON à ser salvo (string);
  * **originTypeToReturnType:** Converte um XML em forma de TXMLDocument em um JSON em forma de TJSONObject (TJSONObject);
    + **Parametrização**
      - *content:* XML à converter (TXMLDocument);
  * **normalizeOrigin:** Converte um XML em forma de String em um XML em forma de TXMLDocument (TXMLDocument);
    + **Parametrização**
      - *content:* XML à normalizar (string);
  * **normalizeOrigin:** Converte um XML em forma de TXMLDocument em um XML em forma de TStringList (TStringList);
    + **Parametrização**
      - *content:* XML à normalizar (TXMLDocument);
  * **normalizeOrigin:** Converte um XML em forma de TStringList em um XML em forma de String (string);
    + **Parametrização**
      - *content:* XML à normalizar (TStringList);
  * **normalizeReturn:** Converte um JSON em forma de String em um JSON em forma de TJSONObject (TJSONObject);
    + **Parametrização**
      - *content:* JSON à normalizar (string);
  * **normalizeReturn:** Converte um JSON em forma de TJSONObject em um JSON em forma de TStringList (TStringList);
    + **Parametrização**
      - *content:* JSON à normalizar (TJSONObject);
  * **normalizeReturn:** Converte um JSON em forma de TStringList em um JSON em forma de String (string);
    + **Parametrização**
      - *content:* JSON à normalizar (TStringList);

<br />
 
## [Sitemap](https://coggle.it/diagram/XmZ2-WVe0wuFMqlu/t/-) <a name="sitemap"></a>   
![Sitemap](documentation/images/sitemap.png)

<br />

## Estrutura <a name="estrutura"></a>
+ **app:** Contém a compilação do(s) pacote(s) e testador(es);
+ **documentation:** Contém a documentação do(s) pacote(s);
+ **images:** Contém as imagens usadas no(s) pacote(s);
+ **modules:** Módulos não essenciais, como testadores, etc;
  - **Format_Converter:** Testa as converções de formato (também usado para pegar o número de build);
+ **output:** Contém os arquivos pré compilados usados pelo Delphi (.dcu);
+ **project:** Diretório com os projetos de cada pacote e testador;
+ **src:** Contém o fonte essencial para o funcionamento do(s) pacote(s);
  - **OriginToReturn:** Contém a interface de que comanda a implementação dos pacotes;
  - **XMLtoJSON:** Contém o pacote usado para conversão de XML para JSON;
+ **vendor:** Contém os pacotes de terceiros;
 
<br />

## Workgroup <a name="workgroup"></a>
Deve-se manter a ordem de compilação do projeto como na imagem.

![Workgroup](documentation/images/workgroup.png)

<br />

## Dependências <a name="dependencias"></a>
+ **Sem dependências aé o momento.**

<br />

## Instalação/Configuração <a name="instalacao"></a>
+ **[Configuração](documentation/instalacao.md)**

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

## Padronização de Código <a name="source"></a>
### Versionamento
Para versionar o FormatConverter deve-se usar como base o versionamento para windows 32 bits do Format_Converter.exe, da forma que se segue:

![Workgroup](documentation/images/versionamento.png)
#### onde:
1. Versão principal, só muda quando o funcionamento básico do sistema altera de forma considerável;
2. Quantidade de módulos funcionais do sistema;
3. Quantidade de funções públicas disponíveis no sistema;
4. Versão de build do sistema auto-gerado pelo Delphi;
5. Deve-se manter o build como auto incremento;

Para cada teste compilado com sucesso deve-se dar *build* no .exe para versionar (shift + F9).

Os *releases* do repositório serão feitos a cada vez que um módulo estiver 100% finalizado, ou quando um conserto muito relevante for realizado. 

<br />

## TODO <a name="todo"></a>
+ Documentação
  - configuração do fonte
  - arquivo padronização de código e documentação

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
FormatConverter
├── app
│   └── .gitkeep
├── documentation
│   ├── images
│   │   ├── sitemap.png
│   │   └── workgroup.png
│   ├── documentacao.md
│   └── instalacao.md
├── images
│   └── icone
│       ├── icon 150x150.png
│       ├── icon 44x44.png
│       ├── icon.ico
│       ├── icon.png
│       └── icon.psd
├── modules
│   └── Format_Converter
│       ├── U_FormatConverter.View.fmx
│       └── U_FormatConverter.View.pas
├── output
│   └── .gitkeep
├── project
│   ├── CSVtoJSON.dpk
│   ├── CSVtoJSON.dproj
│   ├── CSVtoXML.dpk
│   ├── CSVtoXML.dproj
│   ├── Format_Converter.dpr
│   ├── Format_Converter.dproj
│   ├── FormatConverter.groupproj
│   ├── JSONtoCSV.dpk
│   ├── JSONtoCSV.dproj
│   ├── JSONtoXML.dpk
│   ├── JSONtoXML.dproj
│   ├── OriginToReturn.dpk
│   ├── OriginToReturn.dproj
│   ├── XMLtoCSV.dpk
│   ├── XMLtoCSV.dproj
│   ├── XMLtoJSON.dpk
│   └── XMLtoJSON.dproj
├── src
│   ├── CSVtoJSON
│   │   └── U_CSV.JSON.pas
│   ├── CSVtoXML
│   │   └── U_CSV.XML.pas
│   ├── JSONtoCSV
│   │   └── U_JSON.CSV.pas
│   ├── JSONtoXML
│   │   └── U_JSON.XML.pas
│   ├── OriginToReturn
│   │   └── U_Origin.Return.pas
│   ├── XMLtoCSV
│   │   └── U_XML.CSV.pas
│   └── XMLtoJSON
│       └── U_XML.JSON.pas
├── vendor
│   └── .gitkeep
├── .gitattributes
├── .gitignore
├── LICENSE
└── README.md
```