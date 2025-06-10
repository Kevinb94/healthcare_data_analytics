🌍 Map-Based Visualizations Ideas
1. Choropleth / Heatmap of Condition Prevalence
    What: Map regions (state, county, ZIP code) shaded by the rate or count of specific conditions (e.g., diabetes, hypertension).
    Why: Easily spot regional health disparities or clusters of chronic disease.

2. Demographic Heatmaps
    What: Choropleth showing patient density by demographic categories, e.g., race, ethnicity, or gender.
    Why: Understand geographic distribution of population subgroups.

3. Encounter Density Map
    What: Choropleth or point heatmap by encounter counts (e.g., ER visits or total encounters) by region.
    Why: Identify areas with heavier healthcare utilization.

4. Medication Dispensing Map
    What: Regionally map prescription counts for specific drug classes (e.g., antibiotics, antihypertensives).
    Why: Spot prescribing hotspots or potential over-prescription zones.

5. Care Plan / Procedure Clustering
    What: Map procedure or care plan frequency per region.
    Why: Highlight areas with particular medical service usage (e.g., surgeries, dialysis).

6. Temporal Maps (“Small-Multiples” Over Time)
    What: Create maps for different time periods (month/year) to show evolving hotspots of conditions or encounters.
    Why: Track growth or decline of disease prevalence or health service usage over time.

🎯 Implementation Tips

    Geographic granularity: Use ZIP code (most detailed), or roll up to county/state if ZIPs are sparse or too many.

    SQL Prep in DuckDB:
        Compute counts/rates per region: e.g., % of patients with hypertension per ZIP.
        Join with demographic data (e.g., total patients by region) for rates.
        Structure for Metabase: columns like region_id, metric_count, metric_rate.

    In Metabase:
        Use "Map" visualization type.
        Upload a GeoJSON with region shapes (ZIPs, counties, states).
        Map your region_id and select the metric as color intensity.
        Allow dashboard filters (e.g., by condition, date range, demographic group).


Examples
    - Hypertension prevalence by ZIP code
    - Diabetes rates by county
    - Asthma treatment density in children across regions