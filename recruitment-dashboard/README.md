# Recruitment Analytics Dashboard

![Recruitment Dashboard](dashboard-overview.png)

## Key Metrics Monitored

- Average Time to Hire
- Contract Cancellation Rate
- Contracts Signed by Recruiter
- Average Time to Signature by Recruiter
- Recruiter Performance Comparison
  
## Business Problem

Recruitment tracking was conducted manually using spreadsheets and WhatsApp communication, resulting in fragmented information, limited visibility, and time-consuming reporting processes.

## Project Objective

To design an interactive dashboard that centralizes recruitment data and provides real-time insights to support strategic decision-making.

## Tools Used

- Google Sheets
- SQL
- BigQuery
- Looker Studio

## Technical Implementation

The dashboard was developed following an end-to-end analytical workflow:

Google Sheets → BigQuery → Exploratory SQL Analysis → Analytical View Creation → Looker Studio Dashboard

### Data Quality Challenges

During exploratory analysis, it was identified that the `FECHA FIRMADO` field contained both date values and text labels such as:

- CANCELADO
- PENDIENTE
- NO FIRMÓ

Additional SQL logic was implemented to appropriately handle these inconsistencies before calculating recruitment KPIs.

### SQL Components

The project includes documented SQL queries used to generate recruiter-level metrics and support dashboard development.

## Business Impact

- Reduced time spent preparing recruitment reports.
- Centralized recruitment information into a single source of truth.
- Improved visibility of recruiter performance indicators.
- Enabled data-driven decision-making in talent acquisition processes.

## Key Insights and Recommendations

### Insights

- Significant variability was observed in average signature times among recruiters.
- Certain recruiters consistently achieved faster hiring cycles.
- Monitoring cancellation rates provided visibility into potential inefficiencies within the recruitment process.

### Recommendations

- Identify and replicate best practices from high-performing recruiters.
- Investigate root causes behind elevated cancellation rates.
- Use recruiter performance metrics to guide coaching and resource allocation.
