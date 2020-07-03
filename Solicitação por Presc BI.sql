/*
DEVELOPED BY SAMIRA ALVES LUCIO DIA
DATE: 02/07/2020
GOAL: STRUCTURE DEVELOPED TO RETURN ITEMS PRESCRIBED AND REQUESTED TO  HOSPITAL PHARMACY
*/

SELECT   
         SOLSAI_PRO.CD_ATENDIMENTO
        ,SOLSAI_PRO.CD_SETOR
        ,SETOR.NM_SETOR
        ,SOLSAI_PRO.CD_ESTOQUE
        ,SOLSAI_PRO.TP_ORIGEM_SOLICITACAO
        ,SOLSAI_PRO.CD_PRESTADOR
        ,PRESTADOR.NM_PRESTADOR
        ,SOLSAI_PRO.CD_PRE_MED
        ,SOLSAI_PRO.DT_SOLSAI_PRO
        ,SOLSAI_PRO.DT_IMPRESSAO
        ,SOLSAI_PRO.CD_SOLSAI_PRO
        ,DECODE(solsai_pro.tp_solsai_pro,'P','PEDIDO PACIENTE'
                                        ,'S','PEDIDO SETOR'
                                        ,'E','PEDIDO ESTOQUE'
                                        ,'C','DEVOL. PACIENTE'
                                        ,'D','DEVOL. SETOR') Descricao_Tipo_Solicitacao
        ,DECODE(solsai_pro.tp_situacao,'P','PEDIDO'
                                      ,'S','CONFIRMADO'
                                      ,'C','ATEND. PARCIAL') Descricao_Situacao
                                    
FROM SOLSAI_PRO SOLSAI_PRO
INNER JOIN SETOR SETOR
  ON SETOR.CD_SETOR = SOLSAI_PRO.CD_SETOR
INNER JOIN PRESTADOR PRESTADOR
  ON PRESTADOR.CD_PRESTADOR=SOLSAI_PRO.CD_PRESTADOR
WHERE SOLSAI_PRO.CD_ESTOQUE =#ESTOQUE# 
AND TO_CHAR(SOLSAI_PRO.DT_SOLSAI_PRO,'DD/MM/YYYY') BETWEEN  #TaubateDataInicial#  AND #TaubateFinal#
AND SOLSAI_PRO.CD_PRE_MED IS NOT NULL
ORDER BY SOLSAI_PRO.DT_SOLSAI_PRO DESC