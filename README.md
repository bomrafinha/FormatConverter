# Format Converter (Delphi)

>Conversor de formatos (JSON, XML, etc) para Delphi.
>
>Format converter (JSON, XML, etc.) for Delphi.

<br />

![Maintenance](https://img.shields.io/maintenance/yes/2021)
![Build](https://img.shields.io/badge/Build-1.2.30.479-brightgreen) 
![GitHub release (latest by date)](https://img.shields.io/github/v/release/bomrafinha/FormatConverter)
![GitHub Release Date](https://img.shields.io/github/release-date/bomrafinha/FormatConverter)
![Github repo age](https://img.shields.io/github/issues/detail/age/bomrafinha/FormatConverter/1.svg?style=flat-square)
![Github author](https://img.shields.io/github/issues/detail/u/bomrafinha/FormatConverter/1.svg?style=flat-square)

![GitHub contributors](https://img.shields.io/github/contributors/bomrafinha/FormatConverter)
![GitHub last commit](https://img.shields.io/github/last-commit/bomrafinha/FormatConverter)
![GitHub commit activity](https://img.shields.io/github/commit-activity/y/bomrafinha/FormatConverter.svg?style=flat-square)

![GitHub issues](https://img.shields.io/github/issues/bomrafinha/FormatConverter)
![GitHub closed issues](https://img.shields.io/github/issues-closed/bomrafinha/FormatConverter)
![GitHub pull requests](https://img.shields.io/github/issues-pr/bomrafinha/FormatConverter)
![GitHub closed pull requests](https://img.shields.io/github/issues-pr-closed/bomrafinha/FormatConverter)
![GitHub forks](https://img.shields.io/github/forks/bomrafinha/FormatConverter)
![GitHub stars](https://img.shields.io/github/stars/bomrafinha/FormatConverter)
![GitHub All Releases](https://img.shields.io/github/downloads/bomrafinha/FormatConverter/total)

![GitHub top language](https://img.shields.io/github/languages/top/bomrafinha/FormatConverter)
![GitHub language count](https://img.shields.io/github/languages/count/bomrafinha/FormatConverter)
![Delphi Supported Versions](https://img.shields.io/badge/Delphi%20Supported%20Versions-XE2..10.3%20Rio-blue.svg)
![Platforms](https://img.shields.io/badge/Supported%20platforms-Win32-red.svg)
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/bomrafinha/FormatConverter)

![GitHub](https://img.shields.io/github/license/bomrafinha/FormatConverter)

<br />

*******
## Índice
 1. [Instalação/Configuração](#instalacao)
 2. [Uso](#uso)
 3. [Sitemap](#sitemap)
 4. [Estrutura](#estrutura)
 5. [Workgroup](#workgroup)
 6. [Dependências](#dependencias)
 7. [Contribuir](#contribuir)
 8. [Checklist para Contribuir](#checklist)
 9. [Créditos](#creditos)
 10. [Licença](#licenca)
 11. [Padronização de Código](#source)
 12. [TODO](#todo)
 13. [Árvore do Projeto](#arvore)
*******

<br />

## Instalação/Configuração <a name="instalacao"></a>
[![Clique na Imagem para visualizar o vídeo](documentation/images/install_config.png)](http://www.youtube.com/watch?v=V6iuXUkt1rQ "Clique na Imagem para visualizar o vídeo")

**Clique na Imagem para visualizar o vídeo*

**Correção:** Substituir "$(variavel_criada)\dcu" por "$(variavel_criada)\output" no *library path*

<br />

## Uso <a name="uso"></a>

### Como Usar
[![Clique na Imagem para visualizar o vídeo](documentation/images/uso.png)](http://www.youtube.com/watch?v=DzkltvhSIzM "Clique na Imagem para visualizar o vídeo")

**Clique na Imagem para visualizar o vídeo*

### Exemplo de Uso
[![Clique na Imagem para visualizar o vídeo](documentation/images/exemplo.png)](http://www.youtube.com/watch?v=YZBCXZxL2aw "Clique na Imagem para visualizar o vídeo")

**Clique na Imagem para visualizar o vídeo*

### Recursos

- **JSONtoXML**
  * **stringToString:** Converte um JSON em forma de String em um XML em forma de string (string);
    + **Parametrização**
      - *strContent:* JSON à converter (string);
  * **stringToFile:** Converte um JSON em forma de String em um arquivo XML (boolean);
    + **Parametrização**
      - *strContent:* JSON à converter (string);
      - *filePathResult:* Caminho do arquivo XML à ser salvo (string);
  * **stringToReturnType:** Converte um JSON em forma de String em um XML em forma de TXMLDocument (TXMLDocument);
    + **Parametrização**
      - *strContent:* JSON à converter (string);
  * **fileToString:** Converte um arquivo JSON em um XML em forma de string (string);    
    + **Parametrização**
      - *filePath:* Caminho do arquivo JSON à converter (string);
  * **fileToFile:** Converte um arquivo JSON em um arquivo XML (boolean);
    + **Parametrização**
      - *filePath:* Caminho do arquivo JSON à converter (string);
      - *filePathResult:* Caminho do arquivo XML à ser salvo (string);
  * **fileToReturnType:** Converte um arquivo JSON em um XML em forma de TXMLDocument (TXMLDocument);
    + **Parametrização**
      - *filePath:* Caminho do arquivo JSON à converter (string);
  * **originTypeToString:** Converte um JSON em forma de TJSONObject em um XML em forma de string (string);
    + **Parametrização**
      - *content:* JSON à converter (TJSONObject);
  * **originTypeToFile:** Converte um JSON em forma de TJSONObject em um arquivo XML (boolean);
    + **Parametrização**
      - *content:* JSON à converter (TJSONObject);
      - *filePathResult:* Caminho do arquivo XML à ser salvo (string);
  * **originTypeToReturnType:** Converte um JSON em forma de TJSONObject em um XML em forma de TXMLDocument (TXMLDocument);
    + **Parametrização**
      - *content:* JSON à converter (TJSONObject);
  * **normalizeOrigin:** Converte um JSON em forma de String em um JSON em forma de TJSONObject (TJSONObject);
    + **Parametrização**
      - *content:* JSON à normalizar (string);
  * **normalizeOrigin:** Converte um JSON em forma de TJSONObject em um JSON em forma de TStringList (TStringList);
    + **Parametrização**
      - *content:* JSON à normalizar (TJSONObject);
  * **normalizeOrigin:** Converte um JSON em forma de TStringList em um JSON em forma de String (string);
    + **Parametrização**
      - *content:* JSON à normalizar (TStringList);
  * **normalizeReturn:** Converte um XML em forma de String em um XML em forma de TXMLDocument (TXMLDocument);
    + **Parametrização**
      - *content:* XML à normalizar (string);
  * **normalizeReturn:** Converte um XML em forma de TXMLDocument em um XML em forma de TStringList (TStringList);
    + **Parametrização**
      - *content:* XML à normalizar (TXMLDocument);
  * **normalizeReturn:** Converte um XML em forma de TStringList em um XML em forma de String (string);
    + **Parametrização**
      - *content:* XML à normalizar (TStringList);
      
- **XMLtoJSON**
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
 
## [Sitemap](https://coggle.it/diagram/XmZ2-WVe0wuFMqlu/t/formatconverter/8eab1c100cdfab7da57fd7b188f16250b46cd1b54f3256000d57bb42499f2147) <a name="sitemap"></a>   
![Sitemap](documentation/images/sitemap.png)

<br />

## Estrutura <a name="estrutura"></a>
+ **app:** Contém a compilação do(s) pacote(s) e testador(es);
+ **documentation:** Contém a documentação do(s) pacote(s);
+ **images:** Contém as imagens usadas no(s) pacote(s);
+ **modules:** Módulos que executam cada conversão disponível no sistema;
  - **JSONtoXML:** Contém o pacote usado para conversão de XML para JSON;
  - **XMLtoJSON:** Contém o pacote usado para conversão de JSON para XML;
+ **output:** Contém os arquivos pré compilados usados pelo Delphi (.dcu);
+ **project:** Diretório com os projetos de cada pacote e testador;
+ **src:** Contém o fonte essencial para o funcionamento do(s) pacote(s);
  - **Padronizacao:** Contém as interfaces que padronizao os pacoes;
  - **FormatConverter:** Contém o pacote com o registro desse componente (também usado para pegar o número de build);
  - **FormatConverterTester:** Contém o executável de este do Componente;
+ **vendor:** Contém os pacotes de terceiros;
 
<br />

## Workgroup <a name="workgroup"></a>
Deve-se manter a ordem de compilação do projeto como na imagem.

![Workgroup](documentation/images/workgroup.png)

<br />

## Dependências <a name="dependencias"></a>
+ **Sem dependências até o momento.**

<br />

## Contribuir <a name="contribuir"></a>
1. Faça um "fork" com base no master;
2. Faça "commit" de suas alterações (Caso estiver resolvendo alguma "issue" não esqueça de na mensagem escrever "Fixed #numeroIssue");
3. Faça "push" de seus commits;
4. Solicite um "pull request" para o master do repositório principal.

### Criando uma *Issue*
Para criar uma *issue* atente para o seguinte:
+ Selecionar o *label* adequado para a *issue* (esse *label* poderá vir a ser alterado, mas a não designação faz com que a *issue* fique perdida).

![Label Issue](documentation/images/label_issue.png)

+ Selecionar o projeto *FormatConverter - Kanban*, isso organizará o que está sendo feito e o que deverá ser feito.

![Projeto Issue](documentation/images/project_issue.png)

<br />

## Checklist para Contribuir <a name="checklist"></a>
+ Testar as funcionalidades criadas / alteradas;
+ Marcar com "#" os issues concluídos, nos commits;
+ Readme (caso nescessário)
  - Número do build;
  - Alterar indice;
  - Alterar / adicionar forma de uso;
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

<br />

## Padronização de Código <a name="source"></a>
### Versionamento
Para versionar o FormatConverter deve-se usar como base, o versionamento do pacote FormatConverter.bpl para windows 32 bits, da forma que se segue:

![Workgroup](documentation/images/versionamento.png)
#### onde:
1. Versão principal, só muda quando o funcionamento básico do sistema altera de forma considerável;
2. Quantidade de módulos funcionais do sistema;
3. Quantidade de funções públicas disponíveis no sistema;
4. Versão de build do sistema auto-gerado pelo Delphi;
5. Deve-se manter o build como auto incremento;

Para cada teste compilado com sucesso deve-se dar *build* no FormatConverter.bpl para versionar (shift + F9).

Os *releases* do repositório serão feitos a cada vez que um módulo estiver 100% finalizado, ou quando um conserto muito relevante for realizado. 

<br />

### Padrões adotados no projeto
Para um melhor entendimento do projeto foi-se adotado alguns padrões que facilitam a identificação de cada estrutura usada. São, basicamente, o uso de *camelCase*, e *PascalCase*;

#### Variáveis de método
Variáveis locais devem ser *camelCase*.

Observar o espaçamento entre a declaração de variáveis e o inicio do método.

![Variáveis de método](documentation/images/padrao_variaveis_locais.png)

#### Variáveis privadas
A declaração de váriaveis privadas deve ocorrer sempre dentro dos modificadores de acesso. 

Devem ser *camelCase* começando sempre com "f" seguido por seu nome.

![Variáveis privadas](documentation/images/padrao_variaveis_privadas.png)

#### Propriedades
Propriedades devem usar *PascalCase*.

Devem ter exatamente o nome de sua variável privada e/ou metodo de acesso, eliminando apenas o prefixo (f, get, set).

![Propriedades](documentation/images/padrao_propriedades.png)

#### Métodos
A declaração de métodos deve ocorrer sempre dentro dos modificadores de acesso. 

Métodos devem ser *camelCase*.

Os parâmetros do método devem ser *camelCase* iniciando com "a".

Procurar, quando possível, usar prefixos *get*, *set*, *eh*, etc de acordo com a função do método e/ou seu retorno.

Ao serem chamados usar sempre parentesis em sua chamada, mesmo quando sem parâmetros. Ex: meuMetodo();

![Métodos](documentation/images/padrao_metodos.png)

#### Interfaces
Interfaces devem começar sempre com a letra "I" (maiúsculo), seguido por seu nome em *PascalCase*.

![Interfaces](documentation/images/padrao_interfaces.png)

#### Classes
Classes devem começar sempre com a letra "T" (maiúsculo), seguido por seu nome em *PascalCase*.

Classes que não extendem nenhuma outra classes em específico devem extender *TInterfacedObject*.

![Classes](documentation/images/padrao_classes.png)

#### Chamada de métodos em múltiplas linhas
Métodos com chamadas muito extensas devem ser chamados usando padrão de identação JSON.

![Chamada de métodos em múltiplas linhas 01](documentation/images/padrao_chamadas_01.png)
![Chamada de métodos em múltiplas linhas 02](documentation/images/padrao_chamadas_02.png)

#### Uso de blocos *begin end*
Estruturas que não se utilizam do bloco de abertura e fechamento de código, como *ifs* de uma linha, em um código muito extenso geralmente atrapalham na leitura do código para posteriores modificações. Por esse motivo **todas** as estruturas devem possuir o bloco de abertura e fechamento (*begin .. end*)

![Uso de blocos *begin end* 01](documentation/images/padrao_blocos_01.png)
![Uso de blocos *begin end* 02](documentation/images/padrao_blocos_02.png)

#### Identação
Modificadores de acesso devem ser declarados de forma a ficarem alinhados à declaração da classe.

Declaração de métodos, propriedades, construtores/destrutores, bem como o *var* da declaração de variáveis, devem estar alinhados.

Agrupar *procedures* e *functions* sem alterná-los.

Separar declações de variáveis, métodos, construtores, destrutores e propriedades com uma linha em branco, bem como deixar uma linha em branco antes da declaração de modificador de acesso, ou fim do bloco, exceto no primeiro modificador após a declaração da classes.

![Identação](documentation/images/padrao_identacao_01.png)

#### Chamada de métodos e variaveis internas da classe

Devem ser precedidas da palavra reservada *Self*, para facilitar a leitura do código.

![Self](documentation/images/padrao_self_01.png)

#### Palavras Reservadas
Dá-se preferência ao uso de iniciais minúsculas para palavras reservadas. Porém isso não é uma regra para o projeto tendo em vista que por serem reservadas a IDE às sinaliza, não atrapalhando, assim, a leitura do código.

#### Nomenclatura dos Arquivos
Deve-se nomear os arquivos começando-se com *U_*.

Para uma melhor localização dos arquivos no gerenciador de arquivos, e das unidades dentro do Delphi, devemos montar o nome dos arquivos compondo-os de seus módulos, submódulos, e função final, todos separados por ponto. Como segue na imagem a seguir:

![Nomenclatura Arquivos](documentation/images/nomenclatura.png)

#### Um código bem padronizado é muito mais fácil de ler, mesmo por programadores que utilizam outras linguagens.

<br />

## TODO <a name="todo"></a>
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
│   └── images
│       ├── exemplo.png
│       ├── install_config.png
│       ├── label_issue.png
│       ├── nomenclatura.png
│       ├── padrao_blocos_01.png
│       ├── padrao_blocos_02.png
│       ├── padrao_chamadas_01.png
│       ├── padrao_chamadas_02.png
│       ├── padrao_classes.png
│       ├── padrao_identacao_01.png
│       ├── padrao_interfaces.png
│       ├── padrao_metodos.png
│       ├── padrao_propriedades.png
│       ├── padrao_self_01.png
│       ├── padrao_variaveis_locais.png
│       ├── padrao_variaveis_privadas.png
│       ├── project_issue.png
│       ├── sitemap.png
│       ├── uso.png
│       ├── versionamento.png
│       └── workgroup.png
├── images
│   └── icone
│       ├── FormatConverter.bmp
│       ├── icon 150x150.png
│       ├── icon 44x44.png
│       ├── icon.ico
│       ├── icon.png
│       └── icon.psd
├── modules
│   ├── CSVtoJSON
│   │   └── U_CSV.JSON.pas
│   ├── CSVtoXML
│   │   └── U_CSV.XML.pas
│   ├── JSONtoCSV
│   │   └── U_JSON.CSV.pas
│   ├── JSONtoXML
│   │   └── U_JSON.XML.pas
│   ├── XMLtoCSV
│   │   └── U_XML.CSV.pas
│   └── XMLtoJSON
│       └── U_XML.JSON.pas
├── output
│   └── .gitkeep
├── project
│   ├── CSVtoJSON.dpk
│   ├── CSVtoJSON.dproj
│   ├── CSVtoXML.dpk
│   ├── CSVtoXML.dproj
│   ├── Format_Converter.groupproj
│   ├── FormatConverter.dpk
│   ├── FormatConverter.dproj
│   ├── FormatConverterTester.dpr
│   ├── FormatConverterTester.dproj
│   ├── JSONtoCSV.dpk
│   ├── JSONtoCSV.dproj
│   ├── JSONtoXML.dpk
│   ├── JSONtoXML.dproj
│   ├── Padronizacao.dpk
│   ├── Padronizacao.dproj
│   ├── XMLtoCSV.dpk
│   ├── XMLtoCSV.dproj
│   ├── XMLtoJSON.dpk
│   └── XMLtoJSON.dproj
├── src
│   ├── FormatConverter
│   │   └── U_FormatConverter.pas
│   ├── FormatConverterTester
│   │   ├── U_FormatConverterTester.View.fmx
│   │   └── U_FormatConverterTester.View.pas
│   └── Padronizacao
│       ├── U_Normalize.pas
│       └── U_Origin.Return.pas
├── vendor
│   └── .gitkeep
├── .gitattributes
├── .gitignore
├── LICENSE
└── README.md
```
