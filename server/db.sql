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
4	Amazon Kinesis	Collects, processes, and analyzes real-time, streaming data for insights. Data is processed in ???shards???. The four Kinesis services are Video, Data, Data Firehose and Data Analytics.	analytics
5	Amazon CloudWatch	System wide performance monitoring service for resources (e.g. ec2, databases, metrics from apps). Can aggregate metrics via graphs, monitor logs, set alarms, send emails on changes and automatically react to them. Can use cloudtrail logs. Can be accessed with CLI, SDK or console among others. Data is retained in various time periods. Is set by default on some resources, and price varies by free or charged depending on chosen service to monitor.	monitoring
6	Amazon CloudTrail	Records user activity from api calls in account, to log file in S3. Used for auditing for user actions. Can be done with SDK, console or CLI, CloudFormation. It is enabled by default, one per account although can be consolidated from multiple accounts. Can also determine if log file was manipulated.	monitoring
7	Amazon Route 53	DNS Service, such as registration, translate name to IP address. Checks health via automated requests. Sends users to best endpoint, handles failover, integrates with ELB, S3 and CloudFront.	cdn and dns
12	The 6 Advantages of Cloud	1. Trade capital expense for variable expense.\n2. Benefit from massive economies of scale.\n 3. Stop guessing about capacity.\n4. Increase speed and agility.\n5. Stop spending money running and maintaining data centers.\n6. Go global in minutes.	cloud concepts
13	Cloud Computing Models	1. Infrastructure as a service (IaaS) - contains resources for building and configuring network\n2. Platform as a service (PaaS) - no need worry about infra. can focus on app.\n3. Software as a service (SaaS) - finished software product.	cloud concepts
14	Types of Cloud Deployment	1. Public Cloud ??? takes advantage of cloud services, usually migrated e.g. AWS, Microsoft Azure, Google Cloud Platform (GCP).\n2. Hybrid Cloud ??? a mixture of public and private clouds. On premisis connection to cloud is common.\n3. Private Cloud (on-premises) ??? a cloud managed in your own data center, usually legacy method e.g. Hyper-V, OpenStack, VMware.	cloud concepts
8	Amazon Cloudfront	CDN to cache content (media, apps, apis) in edge locations across locations, so users can access them quickly. Gives security against DDOS. Locations are determined by distance to user, and are not associated with regions or AZs.	cdn and dns
15	Amazon Simple Storage Service (S3)	Object storage for any file type, 99.9% durability. Can also host application, static website and media. File can be up to 5 TB stored in root level folder (aka bucket). There are several classes, but standard is most common. Data persists even when turned off. Name must be unique globally. Objects are key value pairs. Charges apply to requests, transfer, accelaration and choosing region.	storage
17	AWS Snowmobile	A shipping container full of storage (up to 100PB) and a truck to transport it.	storage
18	AWS Snowcone	A small device in the snow service family that is best suited for outside the data center.	storage
19	Amazon Elastic Block Store (EBS)	Persistent block storage volumes for EC2 in the same AZ. Each volume replicated automatically in AZ. Can scale up or down. Storage types vary from high IOPS (read / write per second) SSD with high volume, to Cold HDD with low IOPS and low volume. Multiple EBS can be attached to one EC2, but not multiple EC2 for one EBS. Has termination protection by default. Snaphots of data are stored in S3, and can be incremental - they are region specific instead of AZ.	storage
20	Instance Store Volumes	High performance local or root storage on EC2. Data is lost when turned off. Volume created from AMI. Cannot be detached or re-attached.	storage
21	Amazon Elastic File System (EFS)	Scalable storage service up to petabytes for any type of data using NFS protocol. The volume grows / shrinks depending on existing data. Can connect up to 1000 EC2 from different AZs but must be in same region. Up to 10 volumes per account. On prem access via Direct Connect or VPN. Can choose General SSD or Max IOPS SSD. Can be used with ELB.	storage
22	AWS Storage Gateway	Hybrid storage service for access to cloud data for backups, file sharing in on prem or applications. Three types : file gateway (file interface), volume gateway (block based), and tape gateway (tape library compatible with backup software).	storage
24	AWS	Responsible security of the cloud. Regards infra, hardware, provided software, networking in infra and facilities.	shared responsibility
25	AWS Artifact	Central resource for AWS security and compliance reports, select online agreements. Reports are service organization control, payment card industry, and certifications from regulatory bodies. Agreements can be Business Associate Addendum and the Nondisclosure Agreement.	security
26	AWS GuardDuty	Threat detection for AWS account, instance and bucket using events from Cloudtrail, VPC Flow, DNS, WAF and Shield. 	security
27	AWS Web Application Firewall	Threat detection for exploits against common web explotions, such as SQL injections, DDOS and cross site scripting using Web ACLs. Can use filters based on HTTP protocols or IP adresses.	security
28	AWS Shield	Denial of Service (DDoS) protection service using standard and advanced tier.	security
29	AWS Key Management Service (AWS KMS)	Encryption key management service used to encrypt data. Can be integrated with certain AWS services and CloudTrail (see who manipulated resource).	security
30	AWS CloudHSM	Hardware security module (HSM) to generate encryption keys.	security
31	AWS Certificate Manager	Provisions SSL/TLS certificates (confirms identity of website or resource on private network.	security
16	AWS Snowball	Bulk transfer service between on premi to S3 with a secure physical device, in same region of customer. Can upload via batches in client or terminal.\n. Can be integrated with EC2	storage
32	AWS Inspector	Security assessment service of apps via vulnerabilities or best practices. Has an agent on EC2 and must be tagged. 	security
33	AWS Trusted Advisor	Provides guidance on resource best practice via ost Optimization, Performance, Security, Service Limits, and Fault Tolerance. Two versions: Core checks is free and checks certain resources, and Full checks entire infra.	security
34	Penetration Testing	Tests application security for vulnerabilities by simulating specific attack on resources. Some tests need permission, but some dont such as on EC2 or CloudFront.	security
35	AWS Single Sign-On (AWS SSO)	Cloud-based service to manage access, permissions to AWS accounts and apps. Can be done in AWS Orgs. Supports SAML and access to third party software.	security
36	Amazon Cognito	Configures user access control to your web and mobile apps. Can use social identiy,OpenID and enterprise via SAML. Two components are: user pool (directory and user sign in) and identity pool (acess aws resources).	security
37	AWS Directory Services	Integrates directory service (such as MS) into cloud services. Three types: Microsoft Active Directory, Simple AD (sign on service) and AD Connector (LDAP user directory).	security
38	AWS Systems Manager Parameter Store	Hierarchical storage for sensitivate data like passwords or db strings. Can be enecrypted or plaintext using key valye pair. 	security
39	AWS Secrets Manager	Similar to Parameter Store but native and automatic rotation of keys.	security
40	Amazon Virtual Private Cloud (VPC)	Logically isolated network from other virtual networks in Cloud. Can map IP ranges, create subnets, and configure route tables and internet gateways. Can launch AWS resources (like EC2) in VPC. Spans all AZs in region. A VPC is created in each region, with subnet in each AZ when account created. 5 VPCs per region. Subnet route table has attached Internet Gateway. Instances in the default VPC always have both a public and private IP address.	networking
41	Components of VPC	1. A Virtual Private Cloud: Isolated network in cloud. You define VPCs IP address space from ranges.\\n2. Subnet: Segment of VPCs IP address range where resources are isolated. Can be public (via internet gateway), private (no internet gateway) or vpn.\\n3. Internet Gateway: Connection to the public Internet.\\n4. NAT Gateway: Network Address Translation (NAT) service for your resources in a private subnet to access the Internet.\\n5. Hardware VPN Connection: hardware VPN connection between your Amazon VPC and datacenter or on-prem.\\n6. Virtual Private Gateway: The Amazon VPC side of a VPN connection.\\n7. Customer Gateway: Your side of a VPN connection.\\n8. Router: Connects subnets and direct traffic between Internet gateways, virtual private gateways, NAT gateways, and subnets.\\n9. Peering Connection: Routes traffic via between two peered VPCs.\\n10. VPC Endpoints: Enables private connectivity to services hosted in AWS, from within your VPC without using an Internet Gateway, VPN, Network Address Translation (NAT) devices, or firewall proxies.\\n11. Egress-only Internet Gateway: A stateful gateway to provide egress only access for IPv6 traffic from the VPC to the Internet.	networking
42	Firewalls	Network Access Control Lists (ACLs) provides security in subnet; ACLs are stateful network traffic control. Security Groups provide security layer in instance.	networking
43	NAT Instances	Managed service which enables private subnet instances to Internet, in public subnet. Assigned to security group. No security groups. Can scale to 45gbps.	networking
44	AWS Direct Connect (DX)	Connect a customer???s on-premises sites to AWS. Data transmitted through private network between AWS and customer. Can be configured with more virtual interfaces (VIFs); public VIF accesses VPC and public to services like S3, EC2. Can connect to all Azs. Charged by port hours and data transfer, available in different speeds.	networking
45	AWS Global Accelerator	Optimizes path from users to applications. Monitors health of endpoints and redirects to healthy instance if one goes bad.	networking
46	AWS Outposts	Managed service that offers AWS infra, services, APIs, and to on prem as hybrid. Can access services and resources in region to build locally.	networking
77	IAM Users	Entity that represents a person or service. Can be assigned access key ID and secret access key api calls or password. Can have up to 5000 users per AWS account. Has friendly name and globally unique ARN. A unique ID is also created. Access key needs to be regenerated if lost.	iam
78	Groups	Collection of users and with policies.	iam
79	Roles	Delegate permissions via policy for users and services without permanent credentials like password or access key. Permissions can be temporary. Can also be given to user via third party login. Can also be assumed by EC2 instance. Trust policy specifies account that are allowed for role. 	iam
80	Policies	JSON documents that define permission via key value pair. All permissions are implicitly denied by default. Can use IAM policy simulator.	iam
81	AWS Security Token Service (AWS STS)	Web service that enables temporary credentials for IAM or federated users.	iam
82	Best Practices	1. Lock root user access keys.\n2. Create individual IAM users and assign to group.\n3. Use AWS defined policies.\n4. Grant least privilege.\n5. Use access levels to review IAM permissions.\n6.Use strong password policy for users.\n7. Enable MFA.\n8. Use roles for applications on EC2 instances.\n9. Delegate roles instead credentials.\n10. Rotate credentials regularly.\n11. Remove unnecessary credentials.\n12. Use policy conditions for extra security.\n13. Monitor activity in your AWS account.	iam
83	Regions	A region with 2 or more AZs and data centers, which is isolated from other regions. Data can be replicated across regions (with a fee).	global infrastructure
84	Availability Zones	One or more isolated (failure independent i.e. low risk flood plain) data centers with direct, low-latency, high throughput, redundant connections between each other. AWS maps Availability Zones each AWS account.	global infrastructure
85	Local Zones	Relay point for Compute, storage, database, and other services closer to end-users. Provides a fast, secure connection to AWS Region which has all sthe services.	global infrastructure
86	AWS Wavelength	Method of deploying appication to AWS services in telecommunication providers own datacenters in the region to minimize latency.	global infrastructure
87	AWS Outposts	Bring AWS services and infra to on prem. 	global infrastructure
88	Edge Locations and Regional Edge Caches	Content Delivery Network (CDN) endpoints for CloudFront. There are more edge locations than regions (200). The service is between CloudFront Origin server and Edge Location with large cache.	global infrastructure
89	Amazon Relational Database Service (RDS)	Service for relational database (OLTP) which support multiple engines, with Aurora being proprietary. No access to root OS. Can use read replicas, multi AZ (failover), can enable encryption at rest. Scaling via compute and storage possible is only possible upwards (except MS SQL). Charges apply for instance hours, storage per month, i/o. data egress and backup	databases
90	Amazon DynamoDB	NoSQL database service with fast and scalable performance. Can used SSD for performance. Uses three replicas in AZs (failfure). Eventual consistency is good for read output, but changes from writes not immediate. Can also use strongly consistent read for high performance reflecting read and write.	databases
91	Amazon RedShift	OLAP SQL Data warehouse to analyze large amount of data with SQL and Business Intelligence (BI) tools. It is 10x faster because of columnar indexing. Always keeps three replicas of data (compute node, S3 copy, incremetal backup).	databases
92	Amazon ElastiCache	Web service for Memcached or Redis protocol-compliant server nodes. Use case is heavy read apps or compute intensive work, such as OLAP transactions (session data, db caching, bi dashboards)	databases
93	Amazon EMR	Service to process vast amounts of data easily using Hadoop, Spark, etc for analysis or ETL.	databases
102	Amazon EC2	Web service for virtual server ???instances??? using various OS. You pay only for used capacity. Can increase / decrease number of instances, integrates with othere services. Can launch from AMI, use ephemeral storage from instance root or EBS.	compute
128	Amazon EC2 pricing	Based server uptime, configuration, number of instances, load balancing, monitoring, elastic IP, which OS and instance type.\n1. On demand: pay for compute with no commitments per hour or second. \n2. Dedicated Hosts: host of EC2 instances committed to customer, pay for physical server.\n3. Spot Instances: purchase computing at discounted hourly rates (90% discount).\n4. Reserved instances: up to 75% compared to On-Demand pricing, by paying for capacity ahead of time.	billing
129	Amazon Simple Storage Service (S3) Pricing	Storage pricing Storage class (Standard or IA), storage quantity per GB, number of requests, moving data between storage classes and transferring out of region.	billing
130	Amazon Glacier pricing	Charged for requests, data scanned, returned and data transferred out of Glacier.	billing
131	AWS Snowball Pricing	Fee per data transfer job and shipping the appliance. First 10 days are free. Inbound data free, outbound is charged.	billing
132	Amazon Relational Database Service (RDS) Pricing	1. Server uptime\n2. database engine, size, and memory class.\n3. On-Demand, Reserved\n4. Number of database instances.\n5. After the DB terminated backup charged per GB per month.\n6. Amount of storage in addition to provisioned storage charged per GB per month.\n7. Number of input and output requests to the DB.\n8. single AZ or multi-AZ.\n9. Data transfer inbound is free, outbound data costs are tiered.\n10. Reserved Instances for Aurora, MySQL, MariaDB, Oracle and SQL Server with No Upfront, Partial Upfront, or All Upfront costs.	billing
133	AWS Quick Starts	Guide for solutions and  best practices for security and high availability.	billing
134	AWS Cost Explorer	Free tool for charts of costs for past 13 months and forecast next three. Usage stats available for which services most sed, most traffic in AZ and which linked account most acive.	billing
135	AWS Pricing Calculator	Create cost estimates for AWS infra.	billing
136	AWS Cost & Usage Report	Billing reports to an Amazon S3 by Hour, day, month, product, product resource, tags. Can update up to three times a day. Can be called via CUR API.	billing
137	AWS Price List API	Query the prices of services. Can have SNS alerts when prices change.	billing
139	AWS Organizations and Consolidated Billing	Consolidate multiple accounts for one bill. Can track charges across multiple accounts and download the combined cost and usage data. Can get volume pricing discounts. Can have billing alerts.	billing
140	Resource Groups and Tagging	Key / value pairs attached to resources. Resource groups are aggregated tags.	billing
104	Amazon Elastic Container Service (ECS)	Container management compute that supports Docker containers which runs on cluster of EC2. Can schedule container in cluster. Two types are EC2 and Fargate: fargate provisions compute, cluster and infrastructure automatically while Ec2 is manual. You only pay for usage. Uses ECR which is a registry of containers.	compute
105	AWS Lambda	Serverless compute without managing servers as code. Scales automatically. Use cases are data processing, file and stream processing, API backends.	compute
106	Amazon LightSail	Provides compute, storage, networking and capabilities to deploy web applications. Includes virtual machines, containers, databases, CDN, load balancers, DNS management etc.	compute
107	Amazon LightSail Databases	Seperate instance for running database. Comes with security options, automated backups. Comes in Standard and High Availability. Comes with standy database for failover.	compute
109	AWS Batch	Can run hundreds of thousands of computing jobs. Dynamically provisions according to quantity and can run concurrently.	compute
113	AWS Service Catalog	Catalogs IT services that are approved for use on AWS. Can also managed deployed services. 	cloud management
114	AWS Systems Manager	Manages resources with components such as automation, run commands, inventory, patch management, session management and parameter store.	cloud management
115	AWS Personal Health Dashboard	Dashboard with alert and remediation guidance when event might affect you. Can view performance and availability of resources, also scheduled event management. Alerts (can be emails) triggered by health of resource state. Can integrate with Amazon CloudWatch Events.	cloud management
116	Service Health Dashboard	Service availability tool. Not customizable.	cloud management
117	AWS OpsWorks	Service that provides managed instances of Chef and Puppet for automating servers. It includes patching, updating, backup, configuration, and compliance management.	cloud management
118	AWS Trusted Advisor	Provides guidance resource best practice. The service checks to on how to optimize infra, security, performance, costs and service limits. Basic and Developer tier get 6 security checks, and 50 security limit checks. Busines and Enterprise get 115 checks.	cloud management
119	AWS CloudFormation	Allows to use text file to model and provision resources via automation. Can use JSON or YAML.	cloud management
120	Amazon Simple Notification Service	Send push based notifications (email, sms or http) for loosely couply and distributed apps. Can be automated or manual. Can be integrated with CloudWatch alarms or events and CloudTrail auditing.	application integration
121	Amazon Simple Queue Service (Amazon SQS)	producing receiving data. Pull-based, not push-based (like Amazon SNS).	application integration
122	Amazon Simple Workflow Service (Amazon SWF)	Coordinates background jobs via parallel or sequential steps across distributed application components. Tracks state of workflow	application integration
123	Amazon MQ	Manages message service and provisions infra for ActiveMQ. ActiveMQ sends messages between different softwares.	application integration
124	AWS Step Functions	Used to coordinate the components of applications via visual workflow in steps.	application integration
125	Amazon EC2 Auto Scaling	Automates launching and terminating EC2 instances based on the traffic on app to handle compute load. A collection of instances is called Auto Scaling Group. Can specify min and max instance size of group. Policy determines when to scale and Scaling Plan defines triggers.	auto scaling and load balancing
126	Amazon Elastic Load Balancing (ELB)	Distributes application traffic across multiple EC2 instances, containers, and IP addresses. Can be via single or mutiple AZs. Application Load Balancer (ALB) layer 7 routes connections based on the content of the request. Network Load Balancer (NLB) ??? layer 4 routes connections based on IP protocol data.	auto scaling and load balancing
127	Well Architected	1. Operational Excellence: operations, customer needs and business value. Principles are perform ops as code, make small reversible changes, anticipate failture, learn from failure.\n2. Security: protect datas, systems, and resources with cloud services.  Principles are traceability, security on layers, automate security, protect data at rest and transit, seperate data from people, prepare for events.\n3. Reliability: consistent workload performance, with testing via lifecycle. Principles are test recovering, scale horizontally, stop guessing capacity, manage change in automation.\n4. Performance Efficiency: using resources efficiently as demand and technologies evolve. Principles are democratice technology, go global in minutes, use serverless, experiment often, have mechanical sympathy.\n5. Cost Optimization: deliver business value lowest price. Principles are financial management, consumption model, measure efficiency, analyze expenditure, stop spending money on undifferentiated heavy lifting.\n6. Sustainability: addresses the long-term impactbusiness activities. Principles are understand impact, have sustainability goals, maximize utilization, anticipate more efficient software / hardware, use  managed services, reduce downstream impact	architecting
110	AWS Organizations	Consolidates multiple AWS accounts into an organization to manage. Available as consolidated billing or all features. Policies can be applied to each account or OU; can restrict API access in each account which users can access. A Paying account pays for bill, but cannot manipulate resources of others. Linked accounts means all accounts functions are independent.	cloud management
108	AWS Elastic Beanstalk	Automation tool or compute service for uploading application code. Server automatically handles resource creation, load balancing, auto-scaling, and monitoring with common programming languages.\n	compute
112	AWS Config	Provides resource inventory, auditing capabillities, configuration history, and configuration change tracking on resources against set compliance rules. Can have alerts  on changes.	cloud management
111	AWS Control Tower	Service for creating multi-account environments for compliance and security reasons. Can integrate and control access of other services, account users and enabling encryption on resources. Uses guardrails which use SCPs to detect policy violations from aws config	cloud management
141	AWS Support Plans	1. Basic:  billing and account support only.\n2. Developer: business hours support via email.\n3. Enterprise (comes with a Technical Account Manager): and Business 247 email, chat, and phone support.	billing
142	Amazon Elastic Block Store (EBS) Pricing	per GB of all volumes per month, size of snapshot and copying it, egress data transfer 	billing
143	AWS Lambda Pricing	Based on the number of requests for functions and time to execute, and memory to perform.	billing
144	Amazon CloudFront Pricing	Data transfer and request (varies by regions) and edge location where content served. Egress data. Encryption, SSL and invalidation requests.	billing
145	Amazon DynamoDB Pricing	1. Provisioned throughput (write and read).\n2. Index storing.\n3. Cross regions transfers charged\n4, Global tables\n5. Reserved Capacity (upfront fee and usage hours)\n6. Adding throughput	billing
23	Customer	Responsible for security in the cloud and software licensing. Network level security and firewalls, guest os patches and patches, IAM access and client / server encryption. AKA inherited controls.	shared responsibility
103	Types	1. On-demand: Low cost and flexible EC2 with unpredictable workloads.\n2. Reserved: apps with predictable usage, reserved capacity with up-front payment (cheaper). Standard Reserved Instances (RIs) provide up to 75% discount. Convertible RIs provide up to 54% discount and can change attributes of instance in that period. Scheduled are launched at a set time interval.\n3. Spot: apps with flexible start and end times. Low prices. Used for urgent need of compute; aws can terminate whenever. \n4. Dedicated hosts: a physical server which can be on demand or dedicated. Use cases are compliance or licensing requirement with predictable performance, isolaton. Can only attach on instance to host. One bill per host.\n5. Dedicated instances: phyical server, similar to dedicated host, but without controls of that service. Available as On-Demand, Reserved Instances, and Spot Instances. Billed per hour.\n6. On-demand reserved capacity reservation with savings plan: reserved compute service which is active until the requested time	compute
138	AWS Budgets	Track costs, usage, coverage and utilization for Reserved Instances and Savings Plans. Alerts when cost or usage exceeds drops below budget limit. Annual, quarterly, monthly, daily budgets. Budgets is for alerts only, cannot manipulate services if thresholds crossed.	billing
\.


--
-- Name: flash_cards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: my_user
--

SELECT pg_catalog.setval('public.flash_cards_id_seq', 145, true);


--
-- Name: flash_cards flash_cards_pkey; Type: CONSTRAINT; Schema: public; Owner: my_user
--

ALTER TABLE ONLY public.flash_cards
    ADD CONSTRAINT flash_cards_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

