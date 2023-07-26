# Projeto: Implementação e Simulação do Caminho de Dados RISC-V

## Descrição

Este projeto tem como objetivo implementar e simular o caminho de dados de um processador na arquitetura RISC-V. O caminho de dados é responsável por executar as instruções em um processador, realizando as operações lógicas e aritméticas necessárias.

O trabalho foi desenvolvido utilizando a linguagem de descrição de hardware Verilog e compreende a implementação de diversos módulos, como RegisterFile, InstructionMemory, ALU, ALUControl, Control, DataMemory, PC Counter e Immediate Generator. Esses módulos desempenham papéis específicos na execução das instruções, desde a busca e decodificação até a execução e armazenamento dos resultados.

Além da implementação, foi criado um diagrama do caminho de dados para proporcionar uma visão clara do fluxo de dados e da interação entre os blocos funcionais. Esse diagrama é fundamental para compreender a estrutura do processador e como as instruções são processadas em cada etapa.

Para validar o funcionamento correto do caminho de dados, foram realizados testes com instruções assembly que abrangiam diferentes operações lógicas e aritméticas. Os resultados obtidos foram consistentes, demonstrando a correta execução das instruções e o armazenamento adequado dos valores nos registradores e memória de dados.

## Instalação

Para executar o projeto, é necessário ter um ambiente de desenvolvimento Verilog configurado. Certifique-se de ter instalado o Verilog e as ferramentas necessárias para a compilação e simulação do código.

1. Clone o repositório para sua máquina local:
```bash
git clone https://github.com/seu-usuario/seu-repositorio.git
```
2. Acesse o diretório do projeto:
```bash
cd seu-repositorio
```
3. Compile os arquivos Verilog:
```bash
iverilog -o datapath.vvp datapath.v [outros arquivos Verilog, se houver]
```
4. Execute a simulação:
```bash
vvp datapath.vvp
```
5. Verifique os resultados da simulação.

Desculpe pela confusão anterior. Aqui está o texto formatado corretamente usando a sintaxe markdown, incluindo a formatação adequada para os comandos bash:

## Execução do Projeto

Para executar o projeto, siga as seguintes etapas:

1. Preencha o arquivo `instrucao.asm` com as instruções assembly que serão testadas. O montador não aceita rótulos, portanto, as instruções de desvio devem receber números imediatos como argumento.

2. Execute o seguinte comando para gerar as instruções no formato binário e salvá-las no arquivo `Instrucoes.bin`:
```bash
python3 montador.py
```
Caso ocorra algum erro no montador, as instruções podem ser escritas diretamente em binário no arquivo `instrucoes.bin`.

3. Utilize o arquivo `makefile` fornecido para facilitar a compilação e execução do projeto. Para compilar e executar o projeto, utilize o seguinte comando:
```bash
make
```
Caso deseje visualizar os resultados no GTKWave, utilize o seguinte comando:
```bash
make gtk
```
Se o `makefile` não estiver instalado, você pode seguir a sequência de comandos a seguir:
```bash
iverilog -o testbench testBench.v
vvp testbench
gtkwave RiscV.vcd
```

4. Os registradores e a memória são inicializados a partir de arquivos, nomeados como `Registradores.bin` e `DataMemory.bin`, respectivamente. Certifique-se de que esses arquivos estejam presentes e contenham os dados necessários para a simulação.

## Referências

- Patterson, D. A., & Hennessy, J. L. (2017). Computer Organization and Design RISC-V Edition: The Hardware Software Interface. Morgan Kaufmann.
- Asanović, K., & Patterson, D. (2014). The RISC-V Instruction Set Manual: Volume I: User-Level ISA Version 2.2. Technical Report.
- Hines, J. (2023). RISC-V Graphical Datapath Simulator. Recuperado de: [https://jesse-r-s-hines.github.io/RISC-V-Graphical-Datapath-Simulator/](https://exemplo.com)
