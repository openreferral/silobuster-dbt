# SiloBuster! DBT
A straighforward DBT project that standardizes three source data sets and munges them into common HSDS tables (WIP).

Moving quick and dirty to a certain degree in order to meet the real time demands of a hackathon.

## Organization.
This is essentially three separate transformation pipelines for three separate data sources, where the root level (`/models`) models are interfaces to combine the three sources.

Subdirectory file structure is based on DBT best practices for model organization (https://docs.getdbt.com/guides/best-practices/how-we-structure/1-guide-overview).

## Resources for DBT:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
