# Lexical Analyzer for EASY Language
by Aira Mae Aloveros

This repository contains a solution for Problem Set 2 - Lexical Analyzer using Flex for the EASY Language. 

## Part 1
In Part 1 of the problem set, the task was to:
1. Extract all the possible TOKEN classifications from the EASY language from the provided extract.
2. Write regular expressions for each token classification.
3. Determine the order of precedence for the different token classifications.

## Part 2 and Problem Set 2
In Part 2  and Problem Set 2, using FLEX, the task is to write a simple lexical analyzer for the EASY language. 

The following are the additional features of the Lexical Analyzer:
1. `>=` for greater than or equal, `<=` for less than or equal, and `!=` for not equal.
2. Single quotes for literal strings, e.g., `'this is a string'`.
3. `==` is an equality symbol, while `=` is an assignment symbol.
4. Symbols not included in the given QUIWA EASY language were marked as `UNKNOWN`
5. The Comments considered are any text from `//` to the newline `/n`
6. To fully identify `go to` lexemes as two words, the regex used have space as follows `"go to "`
    * In the case of `else if`, it is considered as two separate tokens, the `else` token and the `if` token to avoid more complex handling in the parser.
7. The program ignores newline and whitespace.


In addition, own test files were also created to validate the program's functionality.Several own test cases were created and added to the `easycodes` folder. 
* The filenames of test cases starting with `modified_` are versions of the given codes that have been modified to adopt the features added to my own version of the QUIWA language.
* The list of own testcases are
    * correctlexeme.easy
    * correctlexeme1.easy
    * incorrectlexeme.easy
    

## Usage
To use the Lexical Analyzer, follow the steps below:

1. Open your terminal and navigate to the directory where the `lexicalanalyzer.lex` file is located.
2. Run the following command to generate the lexer:
   ```
   flex lexicalanalyzer.lex
   ```
3. Next, compile the `lex.yy.c` file using either of the following commands, depending on your operating system:
   - On Mac OS X:
     ```
     gcc lex.yy.c -ll
     ```
   - On Linux:
     ```
     gcc lex.yy.c -lfl
     ```
   Note that you may have to use `sudo` before the commands in steps 2 and 3, depending on your system's permissions.
4. After compiling, run the program using the following command:
   ```
   ./a.out <filepath>
   ```
   Replace `<filepath>` with the path to your input file.
6. The Lexical Analyzer will then process the input and display the output on the terminal in the following format: 
    ```
    <lexeme, TOKEN CLASS, line number>
    ```
    * As example, when `./a.out easycodes/hanoi.easy` is run, the first lines of the ouput is as follows
    ```
    <// This is a comment - you may edit this out if you did not handle comments
    , COMMENT, 1>                                                                                                                                               
    <// hanoi.easy
    , COMMENT, 2>
    <procedure, PROCEDURE, 4>
    <THP, IDENTIFIER, 4>
    <(, LPAR, 4>
    <n, IDENTIFIER, 4>
    <,, SEPARATOR, 4>
    <S, IDENTIFIER, 4>
    <,, SEPARATOR, 4>
    <T, IDENTIFIER, 4>
    .
    .
    .
    ```
7. When using WSL, you can use tmux to view all lines of output printed in the terminal by pressing `CTRL+B` then `[`.
    * tmux allows you to scroll through the output even if it goes beyond the height of the terminal window.

