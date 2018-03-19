/*

1. Crie um bloco PL/SQL que liste o nome (ENAME), sal�rio (SAL) e data de contrata��o
(HIREDATE) do funcion�rio com o menor sal�rio do departamento (DEPTNO) 10. A data
de contrata��o deve ser exibida no formato DIA �de� Nome do m�s por extenso �de�
ANO (exemplo, 19 de Mar�o de 2018)


*/

SET SERVEROUTPUT ON

DECLARE

V_ENAME EMP.ENAME%TYPE;
V_SAL EMP.SAL%TYPE;
V_HIREDATE EMP.HIREDATE%TYPE;

BEGIN


SELECT ENAME , SAL , HIREDATE INTO V_ENAME , V_SAL , V_HIREDATE
    FROM EMP
    
    WHERE DEPTNO = 10 AND 
      SAL = (SELECT MIN(SAL) FROM EMP WHERE DEPTNO = 10);


DBMS_OUTPUT.put_line('NOME '  || V_ENAME);
DBMS_OUTPUT.PUT_LINE('SALARIO ' || V_SAL);
DBMS_OUTPUT.PUT_LINE('DATA ' || TO_CHAR(V_HIREDATE,'fmDD "de" Month "de YYYY'));


END;


/*

2 - Altere o programa anterior para exibir o nome, sal�rio e data de contra��o do
funcion�rio com o menor sal�rio do departamento 10 e esses mesmos dados do
gerente (MGR) desse funcion�rio. A data de contrata��o deve ser exibida no formato
Dia da sema, Dia �de� nome do m�s por extenso �de� Ano (exemplo, Segunda-feira, 19
de Mar�o de 2018)

*/

DECLARE

V_ENAME EMP.ENAME%TYPE;
V_SAL EMP.SAL%TYPE;
V_HIREDATE EMP.HIREDATE%TYPE;
V_MGR EMP.MGR%TYPE;

BEGIN


SELECT ENAME , SAL , HIREDATE , MGR INTO V_ENAME , V_SAL , V_HIREDATE , V_MGR
    FROM EMP
    
    WHERE DEPTNO = 10 AND 
      SAL = (SELECT MIN(SAL) FROM EMP WHERE DEPTNO = 10);



DBMS_OUTPUT.put_line('NOME  : '  || V_ENAME);
DBMS_OUTPUT.PUT_LINE('SALARIO : ' || V_SAL);
DBMS_OUTPUT.PUT_LINE('DATA : ' || TO_CHAR(V_HIREDATE,' "DIA" fmDD DAY "de" Month "de 2018'));

--EXIBINDO GERENTE

SELECT ENAME , SAL , HIREDATE INTO V_ENAME , V_SAL , V_HIREDATE
    FROM EMP
    WHERE EMP = V_MGR;


DBMS_OUTPUT.put_line('NOME DO GERENTE  : '  || V_ENAME);
DBMS_OUTPUT.PUT_LINE('SALARIO : ' || V_SAL);
DBMS_OUTPUT.PUT_LINE('DATA DE CONTRATACAO : ' || TO_CHAR(V_HIREDATE,' "DIA" fmDD DAY "de" Month "de 2018'));

END;


/*

Altere o programa anterior para gerar um convite para uma reuni�o de avalia��o entre
o funcion�rio e o seu gerente na primeira segunda-feira ap�s tr�s meses da
contrata��o do funcion�rio com o menor sal�rio do departamento 10. (Exemplo,
Reuni�o de avalia��o do funcion�rio XXXX pelo seu gerente YYYY agenda para
segunda-feira, 19 de mar�o de 2018)



*/


DECLARE

V_ENAME EMP.ENAME%TYPE;
V_SAL EMP.SAL%TYPE;
V_MGR EMP.MGR%TYPE;
V_ENAME_GERENTE EMP.ENAME%TYPE;
V_HIREDATE EMP.HIREDATE%TYPE;

BEGIN

SELECT ENAME , SAL  , HIREDATE , MGR INTO  V_ENAME , V_SAL , V_HIREDATE , V_MGR
                         FROM EMP WHERE DEPTNO = 10 
                         AND SAL = (SELECT MIN(SAL) FROM EMP WHERE DEPTNO = 10);
                         
                         SELECT ENAME INTO V_ENAME_GERENTE FROM EMP WHERE EMPNO = V_MGR;
                         
DBMS_OUTPUT.PUT_LINE('Reuni�o de avalia��o do funcion�rio ' || V_ENAME || 'pelo seu gerente ' || V_ENAME_GERENTE || ' AGENDADA PARA : ' ||TO_CHAR(V_HIREDATE,' "DIA" fmDD DAY "de" Month "de 2018'));


END;


/*

4. Usando PL/SQL, gere um relat�rio de apoio para a reuni�o de avalia��o do exerc�cio
anterior. Nesse relat�rio devem constar o nome do funcion�rio, seu sal�rio atual, sua
comiss�o (COMM) atual, uma proposta de aumento de 10% no sal�rio atual e em sua
comiss�o, o c�lculo de quanto o funcion�rio recebe anualmente com o sal�rio atual,
quanto ir� receber anualmente ap�s o aumento e a diferen�a entre esses valores. Leve
em considera��o que os ganhos do funcion�rio s�o calculados somando o sal�rio com
a comiss�o


*/



/*

5. Usando PL/SQL gere um relat�rio gerencial exibindo o nome (ENAME), data de
contrata��o (HIREDATE) e sal�rio (SAL) do funcion�rio mais antigo da empresa, em
seguida, liste os mesmos dados do funcion�rio contratado mais recentemente pela
empresa. Ap�s ter listado esses dados, exiba a diferen�a entre seus sal�rio e a
quantidade de meses e dias entre a contrata��o destes dois funcion�rios.


*/


SELECT * FROM EMP;