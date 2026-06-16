/*
Recruitment Analytics Dashboard

Purpose:
Create recruiter-level metrics used in the recruitment dashboard.

Metrics included:
- Contracts signed
- Average time to signature
- Cancellation rate

Data quality considerations:
- The "FECHA FIRMADO" field contained both dates and text values
  such as "CANCELADO", "PENDIENTE", and "NO FIRMÓ".
- Additional exploratory analysis was performed to identify and
  appropriately handle these inconsistencies before calculating KPIs.
*/


SELECT
    RECLUTADOR,

    COUNTIF(ESTADO = 'FIRMADO') AS firmados,

    ROUND(
        AVG(
            CASE
                WHEN `FECHA FIRMADO` IN ('CANCELADO', 'PENDIENTE', 'NO FIRMÓ')
                THEN NULL

                WHEN `FECHA FIRMADO` = '31/3/2025'
                THEN DATE_DIFF(
                    DATE '2026-03-31',
                    `FECHA ENVIADO`,
                    DAY
                )

                ELSE
                    CASE
                        WHEN DATE_DIFF(
                            PARSE_DATE('%d/%m/%Y', `FECHA FIRMADO`),
                            `FECHA ENVIADO`,
                            DAY
                        ) >= 0
                        THEN DATE_DIFF(
                            PARSE_DATE('%d/%m/%Y', `FECHA FIRMADO`),
                            `FECHA ENVIADO`,
                            DAY
                        )
                    END
            END
        ),
        2
    ) AS promedio_dias_firma,

    ROUND(
        SUM(
            CASE
                WHEN ESTADO = 'CANCELADO'
                THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS tasa_cancelacion

FROM `glass-trilogy-483323-u4.CONTRATACIONES.CONTRATACIONES_2026`

GROUP BY RECLUTADOR
