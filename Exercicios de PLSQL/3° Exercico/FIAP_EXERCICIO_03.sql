 /*
 
1) Crie um bloco PL/SQL an�nimo que exiba o nome do funcion�rio 
(ENAME) com o sal�rio (SAL) de 5000. 
Salve o programa com o nome de ex01.sql

*/

SET SERVEROUTPUT ON

DECLARE

V_NAME EMP.ENAME%TYPE;
V_SAL EMP.SAL%TYPE;

BEGIN

SELECT ENAME , SAL INTO V_NAME , V_SAL FROM EMP WHERE SAL = 5000;

DBMS_OUTPUT.put_line('NOME : ' || V_NAME || 'SALARIO : ' || V_SAL);

END;


/
--------------------------------------------------------------------------------

/*
2) Altere o programa anterior para exibir o nome do funcion�rio (ENAME), c�digo de 
departamento (DEPTNO) e data de contrata��o (HIREDATE). 
A data dever� ser exibida no formato DD/MONTH/YYYY. 
Salve o programa com o nome de ex02.sql
*/

DECLARE

V_NAME EMP.ENAME%TYPE;
V_HIREDATE EMP.HIREDATE%TYPE;
V_CODIGO EMP.DEPTNO%TYPE;


BEGIN

SELECT ENAME , DEPTNO , HIREDATE   
INTO V_NAME , V_CODIGO , V_HIREDATE  
FROM EMP WHERE SAL = 5000;

DBMS_OUTPUT.put_line('NOME : ' || V_NAME  || 'DATA :' || TO_CHAR(V_HIREDATE,'DD/MM/YYYY') ||  'CODIGO : ' || V_CODIGO);

END;


/

--------------------------------------------------------------------------------
/*
3) Crie um bloco PL/SQL an�nimo para exibir o nome do funcion�rio (ENAME), sal�rio 
(SAL) e data de contrata��o (HIREDATE) do
funcion�rio com o menor sal�rio da empresa. O sal�rio deve ser exibido no formato R$ 9.999,00.
*/

DECLARE

V_NAME EMP.ENAME%TYPE;
V_SAL EMP.SAL%TYPE;
V_DATA EMP.HIREDATE%TYPE;
V_MENOR_SAL NUMBER(8,2);

BEGIN

SELECT
ENAME ,
SAL,
HIREDATE
INTO V_NAME , V_SAL , V_DATA
FROM EMP 
WHERE SAL =(SELECT MIN(sal) FROM EMP); -- ONDE SALARIO SEJA IGUAL AO MENOR DA MINHA TABELA

DBMS_OUTPUT.put_line('MENOR SALARIO' || TO_CHAR(V_SAL,'L9G999D00') || 
                     'NAME : ' || V_NAME || 
                     'DATA : ' || TO_CHAR(V_DATA,'DD/MM/YYYY'));


END;

/
--------------------------------------------------------------------------------
/*
4) Crie um bloco PL/SQL an�nimo para exibir o nome do funcion�rio (ENAME), 
sal�rio (SAL) e data de contrata��o (HIREDATE) do funcion�rio com o menor 
(Fun��o MIN) s�l�rio do departamento (DEPTNO) 
onde trabalha o funcion�rio com o maior (Fun��o MAX) sal�rio da empresa.
*/

SET SERVEROUTPUT ON

DECLARE

V_NAME EMP.ENAME%TYPE;
V_SAL EMP.SAL%TYPE;
V_DATA EMP.HIREDATE%TYPE;

BEGIN

SELECT ENAME , SAL , HIREDATE 
INTO V_NAME , V_SAL , V_DATA FROM EMP 
WHERE SAL = (SELECT MIN(SAL) FROM EMP);

DBMS_OUTPUT.put_line('MENOR SALARIO : ' || TO_CHAR(V_SAL,'L9G999D00') || ' NOME : ' || V_NAME || 'DATA CONTRATACAO : ' ||  TO_CHAR(V_DATA,'DD/MM/YYYY'));

SELECT ENAME , SAL 
INTO V_NAME , V_SAL 
FROM EMP 
WHERE SAL = (SELECT MAX(SAL) FROM EMP);

DBMS_OUTPUT.put_line('MAIOR SALARIO : ' || TO_CHAR(V_SAL,'L9G999D00') || ' NOME : ' || V_NAME ||  TO_CHAR(V_DATA,'DD/MM/YYYY'));

END;
--------------------------------------------------------------------------------

/*
5) Crie um bloco PL/SQL an�nimo para exibir o nome do funcion�rio (ENAME), sal�rio 
(SAL), m�dia salarial da empresa (Fun��o AVG) do funcion�rio com o maior 
(Fun��o MAX) sal�rio do departamento (DEPTNO) onde trabalha o
funcion�rio com o menor (Fun��o MIN) sal�rio da empresa. 
*/

SET SERVEROUTPUT ON

DECLARE

V_NAME EMP.ENAME%TYPE;
V_SAL EMP.SAL%TYPE;
V_DEPTNO EMP.DEPTNO%TYPE;

BEGIN


SELECT ENAME ,
       SAL , 
       DEPTNO 
       INTO V_NAME , V_SAL , V_DEPTNO 
       FROM EMP
       WHERE SAL = (SELECT MAX(SAL) FROM EMP WHERE ENAME = ENAME);
       DBMS_OUTPUT.PUT_LINE('MAIOR SALARIO : ' || V_SAL || ' DO ' || ' DEPARTAMENTO : ' || V_DEPTNO || ' � ' || V_NAME);
       
SELECT ENAME , 
       SAL , 
       DEPTNO INTO V_NAME , V_SAL , V_DEPTNO 
       FROM EMP WHERE SAL = 
       (SELECT MIN(SAL) FROM EMP WHERE ENAME = ENAME);
       DBMS_OUTPUT.PUT_LINE('MENOR SALARIO : ' || V_SAL || ' DO ' || ' DEPARTAMENTO : ' || V_DEPTNO || ' � ' || V_NAME);
    
        SELECT AVG(SAL)INTO V_SAL FROM EMP;
        DBMS_OUTPUT.PUT_LINE('SALARIO EMPRESARIAL TOTAL ' || V_SAL);
END;

--------------------------------------------------------------------------------
