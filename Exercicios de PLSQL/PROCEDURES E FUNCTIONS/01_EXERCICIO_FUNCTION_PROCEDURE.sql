/*
Crie uma fun��o chamada fun_qtd_func_deptoque
retorne a quantidade total de funcion�rio de um 
determinado departamento. Caso n�o exista funcion�rio
cadastrado para o departamento informado, ou ocorrer 
qualquer erro imprevisto, retornar o valor 0 (zero).
*/

SELECT * FROM LOC_FUNCIONARIO;
SET SERVEROUTPUT ON

create or replace function fun_qtd_func_deptoque(cd_departamento in number)
return number
is
     contaFunc number := 0;  
BEGIN
    FOR INDICE IN (SELECT CD_DEPTO FROM LOC_FUNCIONARIO) LOOP
           if(INDICE.CD_DEPTO = cd_departamento) then
                contaFunc := contaFunc + 1;
           end if;    
    END LOOP;  
    return contafunc;
 END;

 
 -------------------------------------------------------------------------------------------------------------------------------
 
 /*
 2) Desenvolva uma fun��o denominada fun_nome_ve�culo que vai ter um retorno varchar2. Essa fun��o vai receber como
par�metro a placa do ve�culo e selecionar as seguintes colunas: Modelo + Cor + e tipo do autom�vel. Concatene essas colunas na
vari�vel de retorno da fun��o. Caso a placa do ve�culo n�o esteja cadastrada, parar o processamento emitindo a seguinte
mensagem de erro �Placa <nrplaca> do ve�culo n�o est� cadastrada. Favor informar um c�digo v�lido !�. 
*/

SELECT * FROM LOC_VEICULO;
SET SERVEROUTPUT ON


create or replace function fun_nome_ve�culo(v_placa in varchar2)
return varchar2

IS

BEGIN

FOR INDICE IN (SELECT NR_PLACA , MODELO , COR , TIPO_AUTOMOVEL FROM LOC_VEICULO) LOOP
    IF(INDICE.NR_PLACA = v_placa) THEN
        DBMS_OUTPUT.PUT_LINE('MODELO : ' || INDICE.MODELO);
    END IF;
    END LOOP;
    
END;



 

