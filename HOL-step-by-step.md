**Contents**

<!-- TOC -->

- [Azure Synapse hands-on lab step-by-step](#)
  - [Overview](#Overview)
  - [Requirements](#Requirements)
  - [Environment Setup](#Environment-Setup)
  - [Accessing Synapse Workspace](#Accessing-Synapse-Workspace)
  - [Exercise 1: Data Orchestration and Ingestion](#Exercise-1-Data-Orchestration-and-Ingestion)
    - [Task 1: Data Ingestion](#Task-1-Data-Ingestion)
    - [Task 2: Migrate SAP Hana to Azure Synapse Analytics](#Task-2-Migrate-SAP-Hana-to-Azure-Synapse-Analytics)
    - [Task 3: Code First Experience: Migrate Teradata to Azure Synapse Analytics](#Task-3-Code-First-Experience-Migrate-Teradata-to-Azure-Synapse-Analytics)
    - [Task 4: Migrate last five years of sales transactional data from Oracle to Azure Synapse Analytics](#Task-4-Migrate-last-five-years-of-sales-transactional-data-from-Oracle-to-Azure-Synapse-Analytics)
    - [Task 5: Moving semi-structured data to Azure Synapse Analytics](#Task-5-Moving-semi-structured-data-to-Azure-Synapse-Analytics)
    - [Task 6: On-Demand Query: Azure Data Lake Gen2](#Task-6-On-Demand-Query-Azure-Data-Lake-Gen2)
    - [Task 7: COPY INTO Command](#Task-7-COPY-INTO-Command)
  - [Exercise 2: Develop Hub](#Exercise-2-Develop-Hub)
    - [Task 1: Running Queries against 30 Billion records](#Task-1-Running-Queries-against-30-Billion-records)
    - [Task 2: JSON Extractor Differentiator and other optional differentiators](#Task-2-JSON-Extractor-Differentiator-and-other-optional-differentiators)
    - [Task 3: Using Notebooks to Run Machine Learning Experiments](#Task-3-Using-Notebooks-to-Run-Machine-Learning-Experiments)
    - [Task 4: AutoML in Azure Synapse Analytics](#Task-4-AutoML-in-Azure-Synapse-Analytics)
  - [Exercise 3: Power BI reporting within the Synapse Analytics workspace](#Exercise-3-Power-BI-reporting-within-the-Synapse-Analytics-workspace)
    - [Task 1: Accessing PowerBI reports in Synapse Analytics workspace](#Task-1-Accessing-PowerBI-reports-in-Synapse-Analytics-workspace)
    - [Task 2: Ad Hoc Reporting in Azure Synapse Analytics](#Task-2-Ad-Hoc-Reporting-in-Azure-Synapse-Analytics)
  - [Exercise 4: Visualizing the data using the Power BI dashboard](#exercise-4-visualizing-the-data-using-the-power-bi-dashboard)
    - [Task 1: Access Data and AI Demo Dashboard](#Task-1-Access-Data-and-AI-Demo-Dashboard)
    - [Task 2: Campaign Analytics Report](#Task-2-Campaign-Analytics-Report)
    - [Task 3: Realtime Twitter Analytics](#Task-3-Realtime-Twitter-Analytics)
    - [Task 4: Retail Heat Map](#Task-4-Retail-Heat-Map)
    - [Task 5: Location Analytics ](#Task-5-Location-Analytics )
    - [Task 6: Product Recommendation](#Task-6-Product-Recommendation)

<!-- /TOC -->

## Overview

Azure Synapse is a limitless analytics service that brings together enterprise data warehousing and Big Data analytics. It gives you the freedom to query data on your terms, using either serverless on-demand or provisioned resources—at scale. Azure Synapse brings these two worlds together with a unified experience to ingest, prepare, manage, and serve data for immediate BI and machine learning needs.

During the next exercises, you will discover end-to-end analytics solutions with a unified experience within Azure Synapse Studio. You will have the chance to take a peek at data ingestion from SAP HANA, Oracle, Teradata, and Twitter, running queries against 30 Billion records, use notebooks to run machine learning experiments, try AutoML, and finally use PowerBI within Azure Synapse to built reports.

## Requirements

1. Microsoft Azure subscription
2. Azure Synapse Workspace / Studio
3. PowerBI Pro Account

## Environment Setup

Refer to the [Before Starting](https://github.com/solliancenet/azure-synapse-wwi-lab/blob/master/Before-Starting.md) guide before continuing to the lab exercises.

## Accessing Synapse Workspace

First of all, let's see how you can access your Azure Synapse Workspace.

Select the Synapse Workspace web URL to access your Synapse Workspace.

![Synapse Workspace](media/synapse-workspace-access.png) 

Once you access your workspace select the arrow on the top of the left menu to open the slider and access various sections of the workspace.

![Synapse Workspace](media/2020-04-10_15-51-29.png)

## Exercise 1: Data Orchestration and Ingestion

Duration: 60 minutes.

With Azure Synapse's code-free data orchestration environment, you can build ETL/ELT processes in a code-free visual environment to quickly ingest data from more than 85 native connectors. Moreover, you can perform real-time analytics on streaming data directly in your data warehouse.

### Task 1: Data Ingestion

Let's take a look at how we can connect to external data sources in Azure Synapse and discover the rich list of connectors available for use.

1. On the Synapse Home page, select **Ingest**.

![Dream Demo Synapse](media/2020-04-10_15-53-52.png)

2. In the Copy data dialog, select **Next**.

![Properties](media/2020-04-11_11-09-46.png)

3. Select **Create new connection**

![Create new connection](media/2020-04-11_11-11-00.png)

4. See all available data providers.

![Create new connection](media/05-05.png)

### Task 2: Migrate SAP Hana to Azure Synapse Analytics

SAP is one of the most widely-used enterprise software in the world. Azure Synapse empowers customers to integrate their existing SAP system with Azure to unblock business insights. In this exercise, we will observe an Azure Synapse Pipeline that moves data from SAP Hana to an ADLS Gen2 storage, followed by a Data Flow that transforms the data during the pipeline execution. 

1. Select **Orchestrate**

![SAP HANA To ADLS Pipeline](media/2020-04-11_11-12-13.png)

2. Select/Expand **Pipelines** and then select **SAP HANA TO ADLS** pipeline.

![Ingesting finance data from SAP Hana](media/2020-04-10_16-03-02.png)

3. From the editor window, select **Copy data** activity. Then select **Source** property of the **Copy data** activity to see the **Source Dataset** and observe that the query is pulling data from SAP Hana

![Ingesting finance data from SAP Hana](media/2020-04-10_16-03-54.png)

4. With copy data selected, select the **Sink** property of the **Copy data** activity. Look at the **Sink** dataset, in this case; you are saving to ADLS Gen2 storage container.

![Data moves to Azure Data Lake Gen2](media/2020-04-10_16-05-13.png)

5. Select **Mapping Data Flow** activity and then select **Settings**. Next select **Open** to go to **Data Flow** editor.

![Mapping Data Flow](media/2020-04-10_16-06-30.png)

6. In Data Flow editor, observe the flow. Look in detail into each activity using the following steps.

![Moving data from SAP to the Data Lake](media/2020-04-10_16-07-29.png)

7.	In the **first activity**, we are selecting data from the Data Lake staging area.
8.	In the **second activity**, we are filtering data for the last 5 years.

![filtering data for the last 5 years](media/2020-04-10_16-15-39.png)

9.	In the **third activity**, we are deriving columns from a **Column Order Date**.

![deriving columns from a Column Order Date](media/2020-04-10_16-16-23.png)

10.	In the **fourth activity**, we are only selecting the required columns from the table.

![](media/2020-04-10_16-16-52.png)

11. In the **fifth activity**, we are creating an aggregated **Total Sales** grouped by **Year** and **Month**.

![](media/2020-04-10_16-17-46.png)

12. In the **sixth activity**, we load the aggregated table to Azure Synapse.

![Load the aggregated table to Azure Synapse](media/2020-04-10_16-18-21.png)

20. In the **seventh activity**, we are taking a parallel route by selecting all the remaining rows and writing the full table to Azure Synapse.

![Writing the full table to Azure Synapse](media/2020-04-10_16-18-47.png)

21. To view all the available transformations in the data flow editor, select the **+ (add action)**, which is to the right of the first activity.

![view all the available transformations](media/2020-04-10_16-19-47.png)

22.	Scroll down to see the full list of transformations at different levels.

![Full list of transformations at different levels](media/2020-04-10_16-20-21.png)

### Task 3: Code First Experience: Migrate Teradata to Azure Synapse Analytics

Azure Synapse not only has the code-free path but can give you the ability to prepare data in an Azure Synapse Notebook. In this task, we will use Python and observe the code first experience in Azure Synapse Analytics. We will move data from Teradata from to ADLS Gen 2 and preparing it with Python.

1. In the Orchestrate hub, select **MarketingDBMigration** from the list of pipelines.

![Full list of transformations at different levels](media/2020-04-10_16-24-54.png)

> **Note:** This pipeline is for demonstration purposes only. __Do NOT execute__ the pipeline.

2. Select **Lookup** activity, then select **Settings** to observe the **Source dataset** property (Teradata).

![](media/2020-04-11_11-21-42.png)

3. Select **Copy data** activity and observe **Source** and **Sink** properties.

![](media/2020-04-11_11-24-23.png)

4. Select **Prep data in Azure Synapse** Notebook, then select **Settings**. Once you are in the settings tab, select **Open** to open the notebook

![](media/2020-04-10_16-27-51.png)

5.	Show the Python code. This is the code first experience in Synapse analytics.

![](media/2020-04-10_16-29-16.png)

### Task 4: Migrate last five years of sales transactional data from Oracle to Azure Synapse Analytics

Azure Synapse helps us copy data from an Oracle database to any supported sink data store. In this task, we will check for the existence of the Oracle database and load data from Oracle into Azure Synapse with the Copy Data activity.

1. Select **SalesDBMigration** from the **Orchestrate** hub.

![](media/2020-04-10_16-42-55.png)

2. Select **Lookup** activity and then **Settings** to see **OracleSalesDB** field in **Source Dataset** field

![](media/2020-04-10_16-50-57.png)

3. Select **Copy data** and see Synapse as the **sink**.

![](media/2020-04-10_16-54-39.png)

### Task 5: Moving semi-structured data to Azure Synapse Analytics

Azure Synapse Analytics enables direct streaming ingestion support and the ability to execute analytical queries over streaming data. Capabilities such as: joins across multiple streaming inputs, aggregations within one or more streaming inputs, transform semi-structured data, and multiple temporal windows are all supported. For streaming ingestion, you can integrate with Event Hubs (including Event Hubs for Kafka) and IoT Hubs.

In this task, we will load tweets from an ADSL Gen2 and clean up the dataset.

1. Select **TwitterDataMigration** from the list of pipelines.

![](media/2020-04-10_16-56-21.png)

2. Look at the **Copy data**, **Archive Tweets data in ADLS Gen2** and **Clean up the archived Twitter Data** activities. 

![](media/2020-04-10_16-57-19.png)

### Task 6: On-Demand Query: Azure Data Lake Gen2

Every Azure Synapse Analytics workspace comes with SQL on-demand endpoints that you can use to query data in the lake. SQL on-demand is a query service over the data in your data lake. It is a distributed data processing system, built for large scale of data and compute. SQL on-demand enables you to analyze your Big Data in seconds to minutes, depending on the workload. Thanks to built-in query execution fault-tolerance, the system provides high reliability and success rates even for long-running queries involving large data sets.

SQL on-demand is serverless; hence there is no infrastructure to setup or clusters to maintain. A default endpoint for this service is provided within every Azure Synapse workspace, so you can start querying data as soon as the workspace is created. There is no charge for resources reserved. You are only being charged for the data scanned by queries you run; hence this model is a true pay-per-use model.

In this task, we will query twitter data stored as Parquet files in Azure Data Lake Gen 2 using SQL On-Demand, and visualize the result.

1. Select **Data** Hub from the left navigation in the Synapse Analytics workspace. From the **Data** blade, select **Linked** tab and under **Storage accounts**, Select/expand the storage account starting with **asaexpworkspace**. Observe data sources that are now in ADL Gen2 and then select **twitterdata** storage container.

![](media/2020-04-10_17-00-38.png)

2. See all the parquet files and other folders in the **twitterdata** container. Select the first two parquet files and right-click, from the context menu, Select **New SQL Script** and then select **Select TOP 100 rows**.

![](media/2020-04-10_17-01-49.png)

3. Select **Run**.

![](media/2020-04-11_11-26-50.png)

4. Select **Chart**

![](media/05-31.png)

5. Minimize the **storage accounts** on the left side, then switch to **Workspace** tab. Cxpand the **Databases** tree, expand **SQLPool01 (SQL pool)**, and finally expand **Tables** folder.

![](media/2020-04-11_11-29-17.png)

### Task 7: COPY INTO Command

One of the options to load data into Azure Synapse to be used in SQL queries is the COPY statement that helps to load data from external storage accounts. The COPY statement provides the most flexibility for high-throughput data ingestion into Azure Synapse. In this task, we will load twitter data storage in Azure Storage and run a query against it with the COPY INTO command.

1. Select **Develop**, then expand **SQL Scripts** to list all available scripts. Select **8 External Data to Synapse Via Copy Into** and highlight the query presented below titled **Step:1**.

![](media/2020-04-10_17-06-50.png)

2. Select **Run** and observe the **No results found** message in the **Messages** tab.

![](media/2020-04-11_11-31-19.png)

3.	Scroll to the bottom and select **COPY INTO** query below **Step:2** as shown in the screenshot. Finally, select **Run**

![](media/2020-04-11_11-32-39.png)

## Exercise 2: Develop Hub

Duration: 45 minutes.

The Develop Hub in Azure Synapse helps you work on SQL scripts, notebooks, data flows, and PowerBI reports. It is part of Azure Synapse's unified experience for developing end-to-end analytics solutions. It significantly reduces project development time for BI and machine learning projects with a limitless analytics service that enables you to seamlessly apply intelligence over all your most important data and easily share data with just a few clicks.

During the next couple of tasks, you will have a chance to look at how to develop queries in Azure Synapse, using notebooks to run machine learning experiments and an AutoMl customer forecasting scenario.

### Task 1: Running Queries against 30 Billion records

In this task, we will run queries against 30 Billion records and create some early charts to get a feeling of how the data looks.

> **Note:** If you did not opt-in to load 30 billion records into the database during environment preparation steps described in the hands-on lab preparation guide your queries will result in 3.4 million records.

1. Select **Develop** in the various tabs available in the **Develop** hub workspace and discover the environment. 

![](media/2020-04-10_17-09-25.png)

2. Select **SQL Scripts** and then select **1 SQL Query with Synapse**

![](media/2020-04-11_11-33-42.png)

3. Select **AzureSynapseDW** SQL Pool from the **Connect to** drop-down menu. Once the **Use database** drop-down is populated select **AzureSynapseDW** database from the **Use Database** drop-down. Finally, select the below query (#3 in the screenshot)

![](media/2020-04-11_11-35-09.png)

`SELECT COUNT_BIG(1) as TotalCount  FROM dbo.Sales(nolock)`

4. Select **Run** and observe the results (30 Billion).

![](media/2020-04-10_17-11-19.png)

5. Scroll down a few lines to the second query, select the query as shown in the screenshot, and then select **Run**. Observe time the query takes – query time is listed at the bottom of the screenshot.

![](media/2020-04-11_11-39-28.png)

5. Select the **chart** button, and then select **chart type** dropdown to see various chart types 

![](media/2020-04-11_11-40-23.png)

### Task 2: JSON Extractor Differentiator and other optional differentiators

To speed up time to insight and minimize unnecessary data transformation processes, Azure Synapse enables support for querying JSON data. Business analysts can now use the familiar T-SQL language to query and manipulate documents that are formatted as JSON data. JSON functions, such as `JSON_VALUE, JSON_QUERY`, `JSON_MODIFY`, and `OPENJSON` are available in Azure Synapse. In this task, we will take JSON data and extract specific structured columns using T-SQL.

1. Select **Develop**, and then select **2 JSON Extractor**. 
![](media/2020-04-10_17-13-47.png)

2. From the **Connect to** dropdown connect to **AzureSynapseDW** SQL Pool. Select the query as shown in the screenshot and select **Run**.

![](media/2020-04-10_17-14-55.png)

3. Observe the results of query 

![](media/2020-04-10_17-16-30.png)

### Task 3: Using Notebooks to Run Machine Learning Experiments

An Azure Synapse Studio notebook is a web interface for you to create files that contain live code, visualizations, and narrative text. Notebooks are an excellent place to validate ideas and use quick experiments to get insights from your data. Notebooks are also widely used in data preparation, data visualization, machine learning, and other Big Data scenarios.

In this task, we will use PySpark to run a notebook on a Spark Pool.

1. Select the **Develop** hub from the Synapse workspace. Next, select and expand the **Notebooks** option.

2. Select the **1. Product Recommendations** notebook, which will open the notebook.

![](media/2020-04-10_17-18-41.png)

3. Once the notebook is open, select **CDP DreamPool** from the **Attach to** dropdown. CDP DreamPool is a Spark Pool. Select **PySpark** from the **Language** dropdown list.

![](media/2020-04-10_17-19-32.png)

4. Expand **Language** and see supported languages.

![](media/05-45.png)

5. Observe the import statements in the Notebook 

![](media/05-46.png)

6. Observe the results in the notebook under **Map Products**.

![](media/05-47.png)

### Task 4: AutoML in Azure Synapse Analytics 

Automated machine learning, also referred to as automated ML or AutoML, is the process of automating the time consuming, iterative tasks of machine learning model development. It allows data scientists, analysts, and developers to build ML models with high scale, efficiency, and productivity, all while sustaining model quality. In this task, we will look at a notebook to learn how AutoML in Azure Synapse Analytics works.

1. Select **Develop** from the Synapse workspace

2. Expand **Notebooks** section and select **2 AutoML Customer Forecasting** Notebook.

![](media/2020-04-10_17-23-41.png)

3. Scroll down to see the content in the screenshot in Cell 22.

![](media/05-51.png)

4. Scroll down to observe the content in the screenshot in Cell 26.

![](media/05-52.png)

5. Scroll down to see the code in **cell 39**.

![](media/05-53.png)

6. Scroll down to see **cell 42**.

![](media/05-54.png)

## Exercise 3: Power BI reporting within the Synapse Analytics workspace 

Duration: 20 minutes.

In Azure Synapse, business analysts can securely access datasets and use Power BI to build dashboards in minutes, all while using the same analytics service. DirectQuery allows you to create dynamic reports based on data and metrics you already have in Azure Synapse.

In this exercise, we will see how PowerBI integrates into Azure Synapse Analytics workspace and run ad-hoc reports against our data set.

### Task 1: Accessing PowerBI reports in Synapse Analytics workspace

Let's explore how we can access PowerBI reports in the Synapse Analytics workspace.

1. Select **Develop** from the Synapse workspace and expand the **Power BI** section. Next, expand **Data & AI Demo** (which is a Power BI workspace) and expand **Power BI** reports. Finally, select **1. CDP Vision Demo** Power BI report. This will open the decomposition tree.

![](media/2020-04-10_17-27-03.png)

2. Once the report is open, in the **Decomposition Tree Analysis** tab see **Store Visits by Campaign** then by **Region**. Select **+** next to **North & Central America** 

![](media/2020-04-11_11-42-23.png)

3. Select **QnA** tab 

4. In the **Q&A** box, type **profit by country by product category as treemap**

![](media/2020-04-11_11-44-04.png)

### Task 2: Ad Hoc Reporting in Azure Synapse Analytics

With Azure Synapse, data professionals can query both relational and non-relational data using the familiar SQL language. This can be done using either serverless on-demand queries for data exploration and ad hoc analysis or provisioned resources for your most demanding data warehousing needs.

In this task, we will modify a report using Ad-Hoc queries as its underlying data access choice.

1. From the **Develop** hub, **Power BI** section select **2. Billion Rows Demo** Power BI report.

![](media/2020-04-10_17-29-53.png)

2. Select **Page 1** from the bottom tabs, then select the empty area in the report canvas. Next, from the **Fields** list select or drag and drop **CustomerId** from **wwi Sales** table to the report canvas.

![](media/2020-04-11_11-45-25.png)

3. From the Visualizations pane, select the **card visual**. Resize and move the **card visual** to see what is shown in the screenshot.

![](media/2020-04-11_11-46-44.png)

4. Select the empty area in the report canvas. From the **Fields** list select or drag and Drop **CustomerId** from **wwi AllSales** table to the report canvas. [Pointer 1 from the screenshot]. Then select **Name** field from the **Products** table [Pointer 2 from the screenshot]. Then select **Campaign** field from the **ProdChamp** table [Pointer 3 from the screenshot]. From the **Visualizations** pane select the **Treemap** icon [Pointer 4 from the screenshot].

![](media/2020-04-11_11-48-18.png)

5.	Resize and move the **card visual**, as shown in the screenshot.

![](media/05-63.png)

6. Select an empty area in the report canvas. Then select the **Campaign** field from the **ProdChamp** table [Pointer 1 from the screenshot]. Then select **Profit** field from the **wwi AllSales** table [Pointer 2 from the screenshot]. Finally, from the **Visualizations** pane, select the **Bar Chart** icon [Pointer 3 from the screenshot].

![](media/2020-04-11_11-50-10.png)

7. Resize and move the **card visual**, as shown in the screenshot. 

![](media/05-65.png)

8. Hover over **Save** button, but **do NOT** save.

## Exercise 4: Visualizing the data using the Power BI dashboard

As you evaluate tools to find the right amount of power, flexibility, this exercise will introduce you to a PowerBI Dashboard that brings data sources from various reports. You will have the chance to look into every report one by one directly in Power BI.

Duration: 20 minutes.

### Task 1: Access Data and AI Demo Dashboard

A Power BI dashboard is a single page, often called a canvas, that uses visualizations to tell a story. Because it is limited to one page, a well-designed dashboard contains only the most-important elements of that story. 

The visualizations you will see on the dashboard are called tiles and are pinned to the dashboard by report designers. In most cases, selecting a tile takes you to the report page where the visualization was created. During the next tasks we will look at various reports that are linked to our dashboard called `Data and AI Demo Dashboard`.

1. Sign in to the [Power BI Portal](https://powerbi.microsoft.com/) using your Azure credentials.

2. From the hamburger menu select **Workspaces** to access the list of workspaces available to you. Select the workspace named `ASA-EXP`.

![The workspaces button from the hamburger menu is selected to list workspaces available. The ASA-EXP workspace is selected.](media/powerbi_workspace_selection.png)

3. Select `Data & AI Demo Dashboard` to launch the dashboard.

![The list of dashboard are on screen. Data and AI Dashboard is selected.](media/powerbi_data_ai_dashboard.png)

### Task 2: Campaign Analytics Report

A Power BI report is a multi-perspective view into a dataset, with visuals that represent different findings and insights from that dataset. The visuals aren't static. They update as the underlying data changes. You can interact with the visuals and filters as you dig into the data to discover insights and look for answers. Like a dashboard, a report is highly interactive and highly customizable.

During the next couple of tasks we will look at various reports that are linked to our original dashboard called `Data and AI Demo Dashboard`.

1. Select **Campaign revenue vs target** to access `The Campaign Analytics` report.

![Data and AI Dashboard is shown. Campaign revenue vs target section is selected.](media/data-ai-dashboard-campaign-analytics.png)

2. Select **Enjoy the Moment** campaign from the top filter.

![Campaign Analytics report is shown. Enjoy the moment is selected](media/campaign-analytics-enjoy-the-moment.png)

3. In the `Sentiment by product category`, Select Positive sentiment for the **Cocktail Glasses** product category.

![Sentiment by product category section is shown. Positive bar for cocktail glasses is selected.](media/campaign-analytics-sentiment-by-product.png)

4. Then Select Negative sentiment for the **Exercise** product category.

![Sentiment by product category section is shown. Negative bar for Exercise product category is selected.](media/campaign-analytics-sentiment-by-product-exercise.png)

### Task 3: Realtime Twitter Analytics

1. Select **No. of tweets** from **Realtime Twitter analytics** pillar to access `Realtime Twitter ayanlysis` report.

![Data and AI Dashboard is shown. No. of tweets from Realtime Twitter analytics pillar is selected.](media/data-ai-dashboard-realtime-twitter-analytics.png)

2. Select **Shopping** from **Tweets by Sentiment Category** and observe the changes on the map visual. 

![Real time Twitter analysis report is shown. Shopping is selected from the list of tweets by sentiment category.](media/data-ai-dashboard-realtime-twitter-analytics-shopping.png)

### Task 4: Retail Heat Map

1. [Click here to watch](media/New-Store-Simulation.avi) the heat map video. 

### Task 5: Location Analytics 

1. Select **Total visitors** from **Realtime location analytics** pillar to access `Location Analytics` report.

![Data and AI Dashboard is shown. Total visitors from Realtime location analytics pillar is selected.](media/data-ai-dashboard-realtime-location-analytics.png)

2. See **Visit to by store department**, then select long `visit_type` in the Entertainment department.

![Location analytics report is shown. Long visit type for Entertainment is selected](media/data-ai-dashboard-realtime-location-analytics-entertainment.png)

3. Select short `visit_type` in the Mens department.

![Location analytics report is shown. Short visit type for Mens is selected](media/data-ai-dashboard-realtime-location-analytics-mens.png)

4. Select **Gen Y** in `Revenue by customer segment over department visual` and Hover over **Visitors by the hour of day** visual. 

![Location analytics report is shown. Gen Y is selected in Revenue by customer segment over department visual.](media/data-ai-dashboard-realtime-location-analytics-geny.png)

5. Select **play** on a Scatter plot to see what devices are used by visitors.

![Location analytics report is shown. Play is selected for scatter plot.](media/data-ai-dashboard-realtime-location-analytics-play.gif)

### Task 6: Product Recommendation

1. Select **Recommended Products** from **Product recommendation analytics** pillar to access `Product Recommendations` report.

![Data and AI Dashboard is shown. Recommended Products from Product recommendation analytics pillar is selected.](media/data-ai-dashboard-product-recommendation-analytics.png)

2. Select **Cocktail Glasses** in **Product Category** filter.

![Product recommendations report is shown. Cocktail Glassess is selected from product category list.](media/data-ai-dashboard-product-recommendation-analytics-cocktail.png)

3. Select **Running Shoes** in **Product Category** filter.

![Product recommendations report is shown. Running Shoes is selected from product category list.](media/data-ai-dashboard-product-recommendation-analytics-shoes.png)
