/*
Crie uma fun��o chamada fun_qtd_func_deptoque
retorne a quantidade total de funcion�rio de um 
determinado departamento. Caso n�o exista funcion�rio
cadastrado para o departamento informado, ou ocorrer 
qualquer erro imprevisto, retornar o valor 0 (zero).
*/

--DBMS_OUTPUT.PUT_LINE('TOTAL DE FUNCIONARIOS LISTADO POR CODIGO : ' || v_qtd_total);

SELECT * FROM LOC_FUNCIONARIO;

SET SERVEROUTPUT ON

create or replace function fun_qtd_func_deptoque(cd_departamento in number)
return number

  IS
    v_qtd_total number(5,2);
    BEGIN
      FOR INDICE IN (SELECT COUNT(CD_FUNC)  , CD_DEPTO FROM LOC_FUNCIONARIO) LOOP
        v_qtd_total := INDICE.CD_FUNC;
  END LOOP;
  
return v_qtd_total
END;


select fun_qtd_func_deptoque(50) from LOC_FUNCIONARIO;




