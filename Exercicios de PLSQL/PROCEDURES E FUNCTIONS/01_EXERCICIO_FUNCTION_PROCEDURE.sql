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
    
  exception 
    when others then
  return 0;
  
 END;
 
select fun_qtd_func_deptoque(50) from dual;
 

 
 -------------------------------------------------------------------------------------------------------------------------------
 
 /*
 2) Desenvolva uma fun��o denominada fun_nome_ve�culo que vai ter um retorno varchar2. Essa fun��o vai receber como
par�metro a placa do ve�culo e selecionar as seguintes colunas: Modelo + Cor + e tipo do autom�vel. Concatene essas colunas na
vari�vel de retorno da fun��o. Caso a placa do ve�culo n�o esteja cadastrada, parar o processamento emitindo a seguinte
mensagem de erro �Placa <nrplaca> do ve�culo n�o est� cadastrada. Favor informar um c�digo v�lido !�. 
*/

SELECT * FROM LOC_VEICULO;
SET SERVEROUTPUT ON


create or replace function fun_nome_veiculo (v_placa in varchar2)
return varchar2

IS

save_placa varchar2(100) := '';

BEGIN
FOR INDICE IN (SELECT NR_PLACA ,  MODELO , COR , TIPO_AUTOMOVEL  FROM LOC_VEICULO) LOOP
    IF(INDICE.NR_PLACA = v_placa) THEN
        save_placa := INDICE.MODELO || INDICE.COR || INDICE.TIPO_AUTOMOVEL;
    END IF;  
  END LOOP;
    return save_placa;
END;

select fun_nome_veiculo('CZR9988') from dual;

/*

3) Desenvolva uma fun��o denominada fun_nome_grupo que vai ter um retorno varchar2. Essa fun��o vai receber como
par�metro o c�digo do grupo de ve�culo e selecionar o nome do grupo na tabela LOC_GRUPO. Caso o c�digo do grupo n�o esteja
cadastrado, parar o processamento emitindo a seguinte mensagem de erro �C�digo do grupo n�o est� cadastrado. Favor informar
um c�digo v�lido !�. 

*/

SELECT * FROM LOC_GRUPO;

create or replace function fun_nome_veiculo (cod_group in varchar2)
return varchar2
IS
save_group varchar2(100) := '';
save_msg varchar2(100) := 'C�digo do grupo n�o est� cadastrado. Favor informar um c�digo v�lido !';

BEGIN

FOR INDICE IN (SELECT CD_GRUPO , DS_GRUPO FROM LOC_GRUPO) LOOP
  IF(INDICE.CD_GRUPO = cod_group) then
    save_group := INDICE.DS_GRUPO;
    ELSE
    RETURN save_msg;
    END IF;
  END LOOP;
  return save_group;
END;

select fun_nome_veiculo('3213210') from dual;


SELECT * FROM loc_pedido_locacao;
/*

4) Crie uma fun��o chamada fun_val_med_loc_cliente que retorne o valor total m�dio gasto por determinado cliente. Caso n�o
exista o cliente cadastrado, ou ocorrer qualquer erro imprevisto, retornar o valor 0 (zero).

*/

-- loc_pedido_locacao

create or replace function fun_val_med_loc_cliente (cod_cli in number)
return number

is
 v_vl_total_medio number(5,2) := 0;
begin
  
  FOR INDICE IN (SELECT NVL(AVG(VL_TOTAL),0) , CD_CLIENTE FROM LOC_PEDIDO_LOCACAO GROUP BY VL_TOTAL) LOOP
      IF (INDICE.CD_CLIENTE = cod_cli) then
            v_vl_total_medio := INDICE.VL_TOTAL;
      END IF;
    END LOOP;
           return v_vl_total_medio;
  
end;

select fun_val_med_loc_cliente(1) from dual;



create or replace function fun_val_med_loc_cliente 
(
p_cd_cliente    loc_pedido_locacao.cd_cliente%type
) return number
is
  v_valor   number;
begin
  select trunc(nvl(avg(vl_total),0))
    into v_valor
    from loc_pedido_locacao
   where cd_cliente = p_cd_cliente;
  return v_valor;
exception
  when others then
    return 0;
end;


select FUN_VAL_MED_LOC_CLIENTE(1) from dual
-----------------------------------------------------------------------------------------------------------------------------------

/*
Desenvolva um procedimento chamado prc_gera_estrelas_cli que tem como objetivo atualizar o n�mero de estrelas de cada
cliente(coluna nr_estrelas: tabela LOC_CLIENTE). O n�mero de estrelas que um cliente pode possuir est� entre 1 e 5 estrelas.
Para ser poss�vel identificar qual estrela o cliente possui, utilize a fun��o FUN_VAL_MED_LOC_CLI para obter o valor m�dio
total gasto pelo cliente e utilize a tabela abaixo, que determina em qual faixa o valor m�dio de loca��o o cliente se encaixa. No
final do processamento, confirme as transa��es realizadas e cria uma instru��o SQL � parte que verifica se a estrela gerada
para cada cliente est� de acordo com as loca��es hoje cadastradas.
*/

SELECT * FROM LOC_CLIENTE;

set serveroutput on

CREATE OR REPLACE PROCEDURE prc_gera_estrelas_cli(cd_cliente in number)

IS

  V_RECEBE_FUNC number := fun_val_med_loc_cliente(1);
  V_MSG_ERROR VARCHAR2(255) := 'ESTRELA INVALIDA';
  V_VALUE number := 0;
  
  BEGIN
    FOR INDICE IN (nr_estrelas , cd_cliente) from LOC_CLIENTE loop
      IF INDICE.NR_ESTRLA < 5 THEN
          return V_MSG_ERROR;
      ELSE
        return V_RECEBE_FUNC
        
  END;











  









 

