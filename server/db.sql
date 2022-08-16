--
-- PostgreSQL database dump
--

-- Dumped from database version 12.11 (Ubuntu 12.11-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.11 (Ubuntu 12.11-0ubuntu0.20.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: flash_cards; Type: TABLE; Schema: public; Owner: my_user
--

CREATE TABLE public.flash_cards (
    id integer NOT NULL,
    term character varying,
    description character varying,
    category character varying,
    CONSTRAINT check_category CHECK (((category)::text = ANY ((ARRAY['analytics'::character varying, 'monitoring'::character varying, 'cdn and dns'::character varying, 'cloud concepts'::character varying, 'storage'::character varying, 'shared responsibility'::character varying, 'security'::character varying, 'networking'::character varying, 'iam'::character varying, 'global infrastructure'::character varying, 'databases'::character varying, 'compute'::character varying, 'cloud management'::character varying, 'billing'::character varying, 'auto scaling and load balancing'::character varying, 'architecting'::character varying, 'application integration'::character varying, 'machine learning'::character varying, 'additional services'::character varying])::text[])))
);


ALTER TABLE public.flash_cards OWNER TO my_user;

--
-- Name: flash_cards_id_seq; Type: SEQUENCE; Schema: public; Owner: my_user
--

CREATE SEQUENCE public.flash_cards_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.flash_cards_id_seq OWNER TO my_user;

--
-- Name: flash_cards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: my_user
--

ALTER SEQUENCE public.flash_cards_id_seq OWNED BY public.flash_cards.id;


--
-- Name: flash_cards id; Type: DEFAULT; Schema: public; Owner: my_user
--

ALTER TABLE ONLY public.flash_cards ALTER COLUMN id SET DEFAULT nextval('public.flash_cards_id_seq'::regclass);


--
-- Data for Name: flash_cards; Type: TABLE DATA; Schema: public; Owner: my_user
--

COPY public.flash_cards (id, term, description, category) FROM stdin;
1	Amazon Elastic Map Reduce (EMR)	Web service that enables processes vast amounts of data. EMR utilizes a hosted Hadoop framework, or others like Spark running on Amazon EC2 and Amazon S3. Can access the OS in machine, uses Steps to process data programmatically. Can access via CLI, console, or API.	analytics
2	Amazon Athena	Serverless interactive query service that analyzes data in Amazon S3 using standard SQL. Supports other formats like JSON or parquet. Can integrate with quicksight, and uses Data Catalog to store db metadata.	analytics
3	Amazon Glue	Managed, serverless ETL service on Spark environment that automates data preparation for analytics. It discovers data via Data Catalog, generates ETL code (Python, Scala) to transform from source to target schema. Can use S3, Redshift warehouse or databases. EMR and Redshift can be used with it. Can be done via console.	analytics
4	Amazon Kinesis	Collects, processes, and analyzes real-time, streaming data for insights. Data is processed in “shards”. The four Kinesis services are Video, Data, Data Firehose and Data Analytics.	analytics
5	Amazon CloudWatch	System wide performance monitoring service for resources (e.g. ec2, databases, metrics from apps). Can aggregate metrics via graphs, monitor logs, set alarms, send emails on changes and automatically react to them. Can use cloudtrail logs. Can be accessed with CLI, SDK or console among others. Data is retained in various time periods. Is set by default on some resources, and price varies by free or charged depending on chosen service to monitor.	monitoring
6	Amazon CloudTrail	Records user activity from api calls in account, to log file in S3. Used for auditing for user actions. Can be done with SDK, console or CLI, CloudFormation. It is enabled by default, one per account although can be consolidated from multiple accounts. Can also determine if log file was manipulated.	monitoring
7	Amazon Route 53	DNS Service, such as registration, translate name to IP address. Checks health via automated requests. Sends users to best endpoint, handles failover, integrates with ELB, S3 and CloudFront.	cdn and dns
8	Amazon CloudTrail	CDN to cache content (media, apps, apis) in edge locations across locations, so users can access them quickly. Gives security against DDOS. Locations are determined by distance to user, and are not associated with regions or AZs.	cdn and dns
12	The 6 Advantages of Cloud	1. Trade capital expense for variable expense.\n2. Benefit from massive economies of scale.\n 3. Stop guessing about capacity.\n4. Increase speed and agility.\n5. Stop spending money running and maintaining data centers.\n6. Go global in minutes.	cloud concepts
13	Cloud Computing Models	1. Infrastructure as a service (IaaS) - contains resources for building and configuring network\n2. Platform as a service (PaaS) - no need worry about infra. can focus on app.\n3. Software as a service (SaaS) - finished software product.	cloud concepts
14	Types of Cloud Deployment	1. Public Cloud – takes advantage of cloud services, usually migrated e.g. AWS, Microsoft Azure, Google Cloud Platform (GCP).\n2. Hybrid Cloud – a mixture of public and private clouds. On premisis connection to cloud is common.\n3. Private Cloud (on-premises) – a cloud managed in your own data center, usually legacy method e.g. Hyper-V, OpenStack, VMware.	cloud concepts
\.


--
-- Name: flash_cards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: my_user
--

SELECT pg_catalog.setval('public.flash_cards_id_seq', 14, true);


--
-- Name: flash_cards flash_cards_pkey; Type: CONSTRAINT; Schema: public; Owner: my_user
--

ALTER TABLE ONLY public.flash_cards
    ADD CONSTRAINT flash_cards_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

