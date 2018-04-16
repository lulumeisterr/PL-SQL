/*

2. Execute os comandos abaixo para criar e popular a tabela MESSAGES.
CREATE TABLE messages (results VARCHAR2 (60));

*/

CREATE TABLE messages (results VARCHAR2 (60));
DROP TABLE messages;

--------------------------------------------------------------------------------
/*

3. Fa�a um bloco PL/SQL para inserir os n�meros de 1 a 10 na tabela MESSAGES, 
excluindo os n�meros 6 e 8. 
Fa�a a inclus�o dos n�meros usando um la�o FOR. Ao final do la�o 
fa�a um COMMIT.

*/

DECLARE
BEGIN
FOR i IN 1..10 LOOP 
    IF i = 6 or i = 8 then
    null;
    ELSE
        INSERT INTO messages values(i);
        END IF;
END LOOP;
END;

SELECT * FROM messages;

--------------------------------------------------------------------------------
/*

4. Execute os comandos abaixo para inserir um funcion�rio com o sal�rio NULO.
insert into emp
values (8000, 'DOE', 'CLERK', 7698, SYSDATE, NULL, NULL, 10)

*/

insert into emp values (8000, 'DOE', 'CLERK', 7698, SYSDATE, NULL, NULL, 10

--------------------------------------------------------------------------------

/*

5. Crie um bloco PL/SQL que compute o valor da comiss�o (COMM) de um determinado funcion�rio com base no sal�rio (SAL) do funcion�rio.
a. Aceite o n�mero do funcion�rio (EMPNO) como entrada do usu�rio com uma vari�vel de substitui��o do SQL*Plus.
b. Se o sal�rio do funcion�rio for inferior a US$ 1.000, defina o valor da comiss�o do funcion�rio para 10% do sal�rio.
c. Se o sal�rio do funcion�rio estiver entre US$ 1.000 e US$ 1.500, defina o valor da comiss�o do funcion�rio para 15% do sal�rio.
d. Se o sal�rio do funcion�rio exceder US$ 1.500, defina o valor da comiss�o do funcion�rio para 20% do sal�rio.
e. Se o sal�rio do funcion�rio for NULL, defina o valor da comiss�o do funcion�rio para 0.
f. Efetue um commit.
g. Teste o bloco PL/SQL para cada caso usando os casos de teste a seguir e verifique cada comiss�o atualizada.

*/

DECLARE

V_EMPNO emp.empno%TYPE := &funcionario;
V_SAL emp.sal%TYPE;
V_COM emp.comm%type;

BEGIN

SELECT EMPNO , SAL , COMM INTO V_EMPNO , V_SAL , V_COM FROM EMP WHERE EMPNO = V_EMPNO;

IF V_SAL < 1000 THEN
    V_COM := V_SAL * 0.10;
    ELSE
        IF V_SAL BETWEEN 1000 AND 1500 THEN
        V_COM := V_SAL * 0.15;  
        ELSE
            IF V_SAL > 1500 THEN
            V_COM := V_SAL * 0.20;
            ELSE
                IF V_SAL = NULL THEN
                V_COM  := NULL;
             END IF;
         END IF;
    END IF;
END IF;

UPDATE emp SET comm = V_COM WHERE EMPNO = V_EMPNO;

COMMIT;

END;

SELECT * FROM EMP;
--------------------------------------------------------------------------------
/*

6. Adicione uma nova coluna chamada STARS, de tipo de dado 
VARCHAR2 e comprimento 50, � tabela EMP para armazenar asteriscos (*).
ALTER TABLE emp ADD stars VARCHAR2(50);

*/

ALTER TABLE emp ADD stars VARCHAR2(50);

--------------------------------------------------------------------------------

/*

7. Crie um bloco PL/SQL que premie um funcion�rio, anexando um asterisco 
� coluna STARS para 
cada US$ 100 do sal�rio do funcion�rio.
a. Aceite o ID do funcion�rio como entrada do usu�rio com uma vari�vel 
de substitui��o do SQL*Plus.
b. Inicialize uma vari�vel que conter� uma string de asteriscos.

*/

--------------------------------------------------------------------------------
DECLARE

V_EMPNO emp.empno%TYPE := &funcionario;
V_STARS emp.stars%type;
V_ASTE emp.stars%TYPE := '*';
v_sal emp.sal%TYPE;
BEGIN

SELECT NVL(ROUND(sal/100), 0)
      INTO v_sal
     FROM emp
    WHERE empno = v_empno;

for i in 1..v_sal loop
v_aste := v_aste;
END LOOP;

UPDATE emp SET STARS = V_ASTE 
WHERE EMPNO = V_EMPNO;

END;

SELECT * FROM EMP;

/*
8. Anexe um asterisco � string para cada US$ 100 do sal�rio. Por exemplo, se o funcion�rio 
recebe um sal�rio de US$ 800, a string de asteriscos dever� conter oito asteriscos. 
Se o funcion�rio recebe um sal�rio de US$ 1.250, a string de asteriscos deve conter 13 asteriscos.

*/


/*
9. Atualize a coluna STARS do funcion�rio com a string de asteriscos.
*/
            

/*
10. Efetue um commit.
*/

COMMIT;

/*
11. Teste o bloco dos funcion�rios que n�o t�m sal�rio e de um funcion�rio que tem um sal�rio como, por exemplo, 7934 e 8000
EMPNO SAL STARS ----- ----- ---------------- 8000 7934 1300 *************
*/
