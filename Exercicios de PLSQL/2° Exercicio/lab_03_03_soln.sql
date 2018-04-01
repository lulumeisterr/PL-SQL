/*
EXERCICIO 02 

1. Avalie o bloco PL/SQL da p�gina anterior e determine o tipo de dados e o
valor de cada uma das seguintes vari�veis de acordo com as regras de
escopo.

a . O valor de v_weight na posi��o 1 e 2 �: 

R:  Na Posi��o  1 � : 601
R : Na posi��o 2 �  : 2 

b . O valor de v_new_locn na posi��o 1 e 2 �:

R: 1 - Na Posi��o 1 : Erro pois a variavel n�o foi declarada no declare inicial
R: 2 - Na Posi��o 2 : Wastern  Europe

c . O valor de v_message na posi��o 2 � :

R: Product 10112 is isnt sotck

*/
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*

3. Examine o c�digo abaixo e fa�a as altera��es necess�rias para que ele
funcione como um bloco PL/SQL an�nimo:


SELECT first_name, salary
 INTO fname, emp_sal
 FROM hr.employees
WHERE employee_id=110;
*/

SET SERVEROUTPUT ON
DECLARE
V_SALARY EMPLOYEES.SALARY%TYPE;
V_NAME EMPLOYEES.FIRST_NAME%TYPE;
BEGIN
SELECT FIRST_NAME , SALARY INTO V_NAME , V_SALARY FROM EMPLOYEES WHERE EMPLOYEE_ID = 100;
DBMS_OUTPUT.PUT_LINE(V_NAME || V_SALARY);
END;


----------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*
4. Altere o programa para exibir o nome e sal�rio do funcion�rio 110 no
    formato �John recebe o salario de 8200�.

*/

DECLARE

V_SALARY EMPLOYEES.SALARY%TYPE;
V_NAME EMPLOYEES.FIRST_NAME%TYPE;

BEGIN

    SELECT FIRST_NAME , SALARY INTO V_NAME , V_SALARY FROM EMPLOYEES WHERE EMPLOYEE_ID = 100;

    UPDATE EMPLOYEES SET SALARY = 8200 WHERE EMPLOYEE_ID = 100;
    DBMS_OUTPUT.PUT_LINE(V_NAME || ' recebe o salario de : ' || V_SALARY);
 
END;



----------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*
5 - Calcule a contribui��o do funcion�rio para o fundo de previd�ncia (PF). PF
� 12% do sal�rio b�sico e o sal�rio b�sico � 45% do sal�rio. Use as
vari�veis locais para o c�lculo. Tente usar apenas uma express�o para
calcular PF. Imprima o sal�rio do funcion�rio e sua contribui��o para o PF,
usando o modelo a seguir:

*/

SET SERVEROUTPUT ON

DECLARE

V_NAME_F EMPLOYEES.FIRST_NAME%TYPE;
V_SALARY EMPLOYEES.SALARY%TYPE;
V_PORCENTUAL NUMBER(8,3);

BEGIN

SELECT SALARY , FIRST_NAME INTO V_SALARY , V_NAME_F FROM EMPLOYEES WHERE EMPLOYEE_ID = 145;

--0,12
--0,48

V_SALARY := V_SALARY * 0.48;
V_PORCENTUAL := V_SALARY / 12 ;

DBMS_OUTPUT.PUT_LINE('HELLOW ' || V_NAME_F || ' YOUR SALARY IS : ' || V_SALARY || ' AND YOUR CONTRIBUTION IS : ' ||  V_PORCENTUAL);
END;
