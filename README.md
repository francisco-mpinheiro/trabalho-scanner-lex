# Analisador Léxico (Scanner) - Linguagem Java--

Este projeto implementa um Analisador Léxico (Scanner) para a gramática da linguagem "Java--", desenvolvido utilizando a ferramenta JFlex e a linguagem Java. O analisador lê um código-fonte de entrada, ignora espaços e comentários, e classifica os tokens válidos da linguagem (palavras reservadas, identificadores, números e símbolos).

## 🛠️ Pré-requisitos

Para compilar e executar este projeto, você precisa ter instalados em sua máquina:
* **Java Development Kit (JDK)** configurado nas variáveis de ambiente.
* **JFlex** (Gerador de Analisadores Léxicos para Java) configurado nas variáveis de ambiente.

## 📂 Estrutura dos Arquivos

* `scanner.flex`: Arquivo principal contendo as expressões regulares, as macros e as regras de geração dos tokens. Ele utiliza a diretiva `%standalone`, dispensando a necessidade de uma classe `Main` separada.
* `entrada.txt`: Arquivo contendo o código-fonte em Java-- utilizado para testar todas as funcionalidades do analisador (estruturas de repetição, condicionais, comentários, números hexadecimais, etc.).
* `saida.txt`: Arquivo gerado automaticamente contendo os tokens identificados no formato exigido `[linha,coluna] tipo: valor`.

## 🚀 Passo a Passo para Execução

Abra o terminal (ou prompt de comando / PowerShell), navegue até a pasta onde os arquivos estão salvos e execute os comandos abaixo em ordem:

### 1. Gerar o código Java a partir do JFlex
O comando abaixo lê o arquivo de regras e gera automaticamente a classe `Scanner.java`:
```bash
jflex scanner.flex
```

### 2. Compilar o código Java gerado
O comando abaixo compila a classe `Scanner.java`, gerando o arquivo `Scanner.class`:
```bash
javac Scanner.java
```

### 3. Executar o analisador léxico
O comando abaixo executa o analisador léxico, lendo o arquivo `entrada.txt` e redirecionando a saída para o arquivo `saida.txt`:
```bash
java -cp . Scanner entrada.txt > saida.txt
```