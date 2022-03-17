--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases
--

DROP DATABASE onlinejudge;




--
-- Drop roles
--

DROP ROLE onlinejudge;


--
-- Roles
--

CREATE ROLE onlinejudge;
ALTER ROLE onlinejudge WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'md54827417b344ff91a2f608bbad9b4e488';






--
-- Database creation
--

CREATE DATABASE onlinejudge WITH TEMPLATE = template0 OWNER = onlinejudge;
REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


\connect onlinejudge

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.18
-- Dumped by pg_dump version 10.18

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

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: acm_contest_rank; Type: TABLE; Schema: public; Owner: onlinejudge
--

CREATE TABLE public.acm_contest_rank (
    id integer NOT NULL,
    submission_number integer NOT NULL,
    accepted_number integer NOT NULL,
    total_time integer NOT NULL,
    submission_info jsonb NOT NULL,
    contest_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.acm_contest_rank OWNER TO onlinejudge;

--
-- Name: acm_contest_rank_id_seq; Type: SEQUENCE; Schema: public; Owner: onlinejudge
--

CREATE SEQUENCE public.acm_contest_rank_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.acm_contest_rank_id_seq OWNER TO onlinejudge;

--
-- Name: acm_contest_rank_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: onlinejudge
--

ALTER SEQUENCE public.acm_contest_rank_id_seq OWNED BY public.acm_contest_rank.id;


--
-- Name: announcement; Type: TABLE; Schema: public; Owner: onlinejudge
--

CREATE TABLE public.announcement (
    id integer NOT NULL,
    title text NOT NULL,
    content text NOT NULL,
    create_time timestamp with time zone NOT NULL,
    last_update_time timestamp with time zone NOT NULL,
    visible boolean NOT NULL,
    created_by_id integer NOT NULL
);


ALTER TABLE public.announcement OWNER TO onlinejudge;

--
-- Name: announcement_id_seq; Type: SEQUENCE; Schema: public; Owner: onlinejudge
--

CREATE SEQUENCE public.announcement_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.announcement_id_seq OWNER TO onlinejudge;

--
-- Name: announcement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: onlinejudge
--

ALTER SEQUENCE public.announcement_id_seq OWNED BY public.announcement.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: onlinejudge
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO onlinejudge;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: onlinejudge
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO onlinejudge;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: onlinejudge
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: onlinejudge
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO onlinejudge;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: onlinejudge
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO onlinejudge;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: onlinejudge
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: onlinejudge
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO onlinejudge;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: onlinejudge
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO onlinejudge;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: onlinejudge
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: contest; Type: TABLE; Schema: public; Owner: onlinejudge
--

CREATE TABLE public.contest (
    id integer NOT NULL,
    title text NOT NULL,
    description text NOT NULL,
    real_time_rank boolean NOT NULL,
    password text,
    rule_type text NOT NULL,
    start_time timestamp with time zone NOT NULL,
    end_time timestamp with time zone NOT NULL,
    create_time timestamp with time zone NOT NULL,
    last_update_time timestamp with time zone NOT NULL,
    visible boolean NOT NULL,
    created_by_id integer NOT NULL,
    allowed_ip_ranges jsonb NOT NULL
);


ALTER TABLE public.contest OWNER TO onlinejudge;

--
-- Name: contest_announcement; Type: TABLE; Schema: public; Owner: onlinejudge
--

CREATE TABLE public.contest_announcement (
    id integer NOT NULL,
    title text NOT NULL,
    content text NOT NULL,
    create_time timestamp with time zone NOT NULL,
    contest_id integer NOT NULL,
    created_by_id integer NOT NULL,
    visible boolean NOT NULL
);


ALTER TABLE public.contest_announcement OWNER TO onlinejudge;

--
-- Name: contest_announcement_id_seq; Type: SEQUENCE; Schema: public; Owner: onlinejudge
--

CREATE SEQUENCE public.contest_announcement_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contest_announcement_id_seq OWNER TO onlinejudge;

--
-- Name: contest_announcement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: onlinejudge
--

ALTER SEQUENCE public.contest_announcement_id_seq OWNED BY public.contest_announcement.id;


--
-- Name: contest_id_seq; Type: SEQUENCE; Schema: public; Owner: onlinejudge
--

CREATE SEQUENCE public.contest_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contest_id_seq OWNER TO onlinejudge;

--
-- Name: contest_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: onlinejudge
--

ALTER SEQUENCE public.contest_id_seq OWNED BY public.contest.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: onlinejudge
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO onlinejudge;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: onlinejudge
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO onlinejudge;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: onlinejudge
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_dramatiq_task; Type: TABLE; Schema: public; Owner: onlinejudge
--

CREATE TABLE public.django_dramatiq_task (
    id uuid NOT NULL,
    status character varying(8) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    message_data bytea NOT NULL
);


ALTER TABLE public.django_dramatiq_task OWNER TO onlinejudge;

--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: onlinejudge
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO onlinejudge;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: onlinejudge
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO onlinejudge;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: onlinejudge
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: onlinejudge
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO onlinejudge;

--
-- Name: judge_server; Type: TABLE; Schema: public; Owner: onlinejudge
--

CREATE TABLE public.judge_server (
    id integer NOT NULL,
    hostname text NOT NULL,
    ip text,
    judger_version text NOT NULL,
    cpu_core integer NOT NULL,
    memory_usage double precision NOT NULL,
    cpu_usage double precision NOT NULL,
    last_heartbeat timestamp with time zone NOT NULL,
    create_time timestamp with time zone NOT NULL,
    task_number integer NOT NULL,
    service_url text,
    is_disabled boolean NOT NULL
);


ALTER TABLE public.judge_server OWNER TO onlinejudge;

--
-- Name: judge_server_id_seq; Type: SEQUENCE; Schema: public; Owner: onlinejudge
--

CREATE SEQUENCE public.judge_server_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.judge_server_id_seq OWNER TO onlinejudge;

--
-- Name: judge_server_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: onlinejudge
--

ALTER SEQUENCE public.judge_server_id_seq OWNED BY public.judge_server.id;


--
-- Name: oi_contest_rank; Type: TABLE; Schema: public; Owner: onlinejudge
--

CREATE TABLE public.oi_contest_rank (
    id integer NOT NULL,
    submission_number integer NOT NULL,
    total_score integer NOT NULL,
    submission_info jsonb NOT NULL,
    contest_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.oi_contest_rank OWNER TO onlinejudge;

--
-- Name: oi_contest_rank_id_seq; Type: SEQUENCE; Schema: public; Owner: onlinejudge
--

CREATE SEQUENCE public.oi_contest_rank_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oi_contest_rank_id_seq OWNER TO onlinejudge;

--
-- Name: oi_contest_rank_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: onlinejudge
--

ALTER SEQUENCE public.oi_contest_rank_id_seq OWNED BY public.oi_contest_rank.id;


--
-- Name: options_sysoptions; Type: TABLE; Schema: public; Owner: onlinejudge
--

CREATE TABLE public.options_sysoptions (
    id integer NOT NULL,
    key text NOT NULL,
    value jsonb NOT NULL
);


ALTER TABLE public.options_sysoptions OWNER TO onlinejudge;

--
-- Name: options_sysoptions_id_seq; Type: SEQUENCE; Schema: public; Owner: onlinejudge
--

CREATE SEQUENCE public.options_sysoptions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.options_sysoptions_id_seq OWNER TO onlinejudge;

--
-- Name: options_sysoptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: onlinejudge
--

ALTER SEQUENCE public.options_sysoptions_id_seq OWNED BY public.options_sysoptions.id;


--
-- Name: problem; Type: TABLE; Schema: public; Owner: onlinejudge
--

CREATE TABLE public.problem (
    id integer NOT NULL,
    title text NOT NULL,
    description text NOT NULL,
    input_description text NOT NULL,
    output_description text NOT NULL,
    samples jsonb NOT NULL,
    test_case_id text NOT NULL,
    test_case_score jsonb NOT NULL,
    hint text,
    languages jsonb NOT NULL,
    template jsonb NOT NULL,
    create_time timestamp with time zone NOT NULL,
    last_update_time timestamp with time zone,
    time_limit integer NOT NULL,
    memory_limit integer NOT NULL,
    spj boolean NOT NULL,
    spj_language text,
    spj_code text,
    spj_version text,
    rule_type text NOT NULL,
    visible boolean NOT NULL,
    difficulty text NOT NULL,
    source text,
    submission_number bigint NOT NULL,
    accepted_number bigint NOT NULL,
    created_by_id integer NOT NULL,
    _id text NOT NULL,
    statistic_info jsonb NOT NULL,
    total_score integer NOT NULL,
    contest_id integer,
    is_public boolean NOT NULL,
    spj_compile_ok boolean NOT NULL,
    io_mode jsonb NOT NULL,
    share_submission boolean NOT NULL
);


ALTER TABLE public.problem OWNER TO onlinejudge;

--
-- Name: problem_id_seq; Type: SEQUENCE; Schema: public; Owner: onlinejudge
--

CREATE SEQUENCE public.problem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.problem_id_seq OWNER TO onlinejudge;

--
-- Name: problem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: onlinejudge
--

ALTER SEQUENCE public.problem_id_seq OWNED BY public.problem.id;


--
-- Name: problem_tag; Type: TABLE; Schema: public; Owner: onlinejudge
--

CREATE TABLE public.problem_tag (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.problem_tag OWNER TO onlinejudge;

--
-- Name: problem_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: onlinejudge
--

CREATE SEQUENCE public.problem_tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.problem_tag_id_seq OWNER TO onlinejudge;

--
-- Name: problem_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: onlinejudge
--

ALTER SEQUENCE public.problem_tag_id_seq OWNED BY public.problem_tag.id;


--
-- Name: problem_tags; Type: TABLE; Schema: public; Owner: onlinejudge
--

CREATE TABLE public.problem_tags (
    id integer NOT NULL,
    problem_id integer NOT NULL,
    problemtag_id integer NOT NULL
);


ALTER TABLE public.problem_tags OWNER TO onlinejudge;

--
-- Name: problem_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: onlinejudge
--

CREATE SEQUENCE public.problem_tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.problem_tags_id_seq OWNER TO onlinejudge;

--
-- Name: problem_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: onlinejudge
--

ALTER SEQUENCE public.problem_tags_id_seq OWNED BY public.problem_tags.id;


--
-- Name: submission; Type: TABLE; Schema: public; Owner: onlinejudge
--

CREATE TABLE public.submission (
    id text NOT NULL,
    contest_id integer,
    problem_id integer NOT NULL,
    create_time timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    code text NOT NULL,
    result integer NOT NULL,
    info jsonb NOT NULL,
    language text NOT NULL,
    shared boolean NOT NULL,
    statistic_info jsonb NOT NULL,
    username text NOT NULL,
    ip text
);


ALTER TABLE public.submission OWNER TO onlinejudge;

--
-- Name: user; Type: TABLE; Schema: public; Owner: onlinejudge
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    username text NOT NULL,
    email text,
    create_time timestamp with time zone,
    admin_type text NOT NULL,
    reset_password_token text,
    reset_password_token_expire_time timestamp with time zone,
    auth_token text,
    two_factor_auth boolean NOT NULL,
    tfa_token text,
    open_api boolean NOT NULL,
    open_api_appkey text,
    is_disabled boolean NOT NULL,
    problem_permission text NOT NULL,
    session_keys jsonb NOT NULL
);


ALTER TABLE public."user" OWNER TO onlinejudge;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: onlinejudge
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO onlinejudge;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: onlinejudge
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- Name: user_profile; Type: TABLE; Schema: public; Owner: onlinejudge
--

CREATE TABLE public.user_profile (
    id integer NOT NULL,
    acm_problems_status jsonb NOT NULL,
    avatar text NOT NULL,
    blog character varying(200),
    mood text,
    accepted_number integer NOT NULL,
    submission_number integer NOT NULL,
    github text,
    school text,
    major text,
    user_id integer NOT NULL,
    total_score bigint NOT NULL,
    oi_problems_status jsonb NOT NULL,
    real_name text,
    language text
);


ALTER TABLE public.user_profile OWNER TO onlinejudge;

--
-- Name: user_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: onlinejudge
--

CREATE SEQUENCE public.user_profile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_profile_id_seq OWNER TO onlinejudge;

--
-- Name: user_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: onlinejudge
--

ALTER SEQUENCE public.user_profile_id_seq OWNED BY public.user_profile.id;


--
-- Name: acm_contest_rank id; Type: DEFAULT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.acm_contest_rank ALTER COLUMN id SET DEFAULT nextval('public.acm_contest_rank_id_seq'::regclass);


--
-- Name: announcement id; Type: DEFAULT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.announcement ALTER COLUMN id SET DEFAULT nextval('public.announcement_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: contest id; Type: DEFAULT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.contest ALTER COLUMN id SET DEFAULT nextval('public.contest_id_seq'::regclass);


--
-- Name: contest_announcement id; Type: DEFAULT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.contest_announcement ALTER COLUMN id SET DEFAULT nextval('public.contest_announcement_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: judge_server id; Type: DEFAULT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.judge_server ALTER COLUMN id SET DEFAULT nextval('public.judge_server_id_seq'::regclass);


--
-- Name: oi_contest_rank id; Type: DEFAULT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.oi_contest_rank ALTER COLUMN id SET DEFAULT nextval('public.oi_contest_rank_id_seq'::regclass);


--
-- Name: options_sysoptions id; Type: DEFAULT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.options_sysoptions ALTER COLUMN id SET DEFAULT nextval('public.options_sysoptions_id_seq'::regclass);


--
-- Name: problem id; Type: DEFAULT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.problem ALTER COLUMN id SET DEFAULT nextval('public.problem_id_seq'::regclass);


--
-- Name: problem_tag id; Type: DEFAULT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.problem_tag ALTER COLUMN id SET DEFAULT nextval('public.problem_tag_id_seq'::regclass);


--
-- Name: problem_tags id; Type: DEFAULT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.problem_tags ALTER COLUMN id SET DEFAULT nextval('public.problem_tags_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Name: user_profile id; Type: DEFAULT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.user_profile ALTER COLUMN id SET DEFAULT nextval('public.user_profile_id_seq'::regclass);


--
-- Data for Name: acm_contest_rank; Type: TABLE DATA; Schema: public; Owner: onlinejudge
--

COPY public.acm_contest_rank (id, submission_number, accepted_number, total_time, submission_info, contest_id, user_id) FROM stdin;
\.


--
-- Data for Name: announcement; Type: TABLE DATA; Schema: public; Owner: onlinejudge
--

COPY public.announcement (id, title, content, create_time, last_update_time, visible, created_by_id) FROM stdin;
1	test	<p>test</p>	2022-03-14 02:22:18.24151+00	2022-03-14 02:22:18.241553+00	t	1
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: onlinejudge
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: onlinejudge
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: onlinejudge
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add permission	1	add_permission
2	Can change permission	1	change_permission
3	Can delete permission	1	delete_permission
4	Can view permission	1	view_permission
5	Can add group	2	add_group
6	Can change group	2	change_group
7	Can delete group	2	delete_group
8	Can view group	2	view_group
9	Can add session	3	add_session
10	Can change session	3	change_session
11	Can delete session	3	delete_session
12	Can view session	3	view_session
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add task	5	add_task
18	Can change task	5	change_task
19	Can delete task	5	delete_task
20	Can view task	5	view_task
21	Can add user	6	add_user
22	Can change user	6	change_user
23	Can delete user	6	delete_user
24	Can view user	6	view_user
25	Can add user profile	7	add_userprofile
26	Can change user profile	7	change_userprofile
27	Can delete user profile	7	delete_userprofile
28	Can view user profile	7	view_userprofile
29	Can add announcement	8	add_announcement
30	Can change announcement	8	change_announcement
31	Can delete announcement	8	delete_announcement
32	Can view announcement	8	view_announcement
33	Can add judge server	9	add_judgeserver
34	Can change judge server	9	change_judgeserver
35	Can delete judge server	9	delete_judgeserver
36	Can view judge server	9	view_judgeserver
37	Can add problem	10	add_problem
38	Can change problem	10	change_problem
39	Can delete problem	10	delete_problem
40	Can view problem	10	view_problem
41	Can add problem tag	11	add_problemtag
42	Can change problem tag	11	change_problemtag
43	Can delete problem tag	11	delete_problemtag
44	Can view problem tag	11	view_problemtag
45	Can add acm contest rank	12	add_acmcontestrank
46	Can change acm contest rank	12	change_acmcontestrank
47	Can delete acm contest rank	12	delete_acmcontestrank
48	Can view acm contest rank	12	view_acmcontestrank
49	Can add contest	13	add_contest
50	Can change contest	13	change_contest
51	Can delete contest	13	delete_contest
52	Can view contest	13	view_contest
53	Can add contest announcement	14	add_contestannouncement
54	Can change contest announcement	14	change_contestannouncement
55	Can delete contest announcement	14	delete_contestannouncement
56	Can view contest announcement	14	view_contestannouncement
57	Can add oi contest rank	15	add_oicontestrank
58	Can change oi contest rank	15	change_oicontestrank
59	Can delete oi contest rank	15	delete_oicontestrank
60	Can view oi contest rank	15	view_oicontestrank
61	Can add submission	16	add_submission
62	Can change submission	16	change_submission
63	Can delete submission	16	delete_submission
64	Can view submission	16	view_submission
65	Can add sys options	17	add_sysoptions
66	Can change sys options	17	change_sysoptions
67	Can delete sys options	17	delete_sysoptions
68	Can view sys options	17	view_sysoptions
\.


--
-- Data for Name: contest; Type: TABLE DATA; Schema: public; Owner: onlinejudge
--

COPY public.contest (id, title, description, real_time_rank, password, rule_type, start_time, end_time, create_time, last_update_time, visible, created_by_id, allowed_ip_ranges) FROM stdin;
\.


--
-- Data for Name: contest_announcement; Type: TABLE DATA; Schema: public; Owner: onlinejudge
--

COPY public.contest_announcement (id, title, content, create_time, contest_id, created_by_id, visible) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: onlinejudge
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	auth	permission
2	auth	group
3	sessions	session
4	contenttypes	contenttype
5	django_dramatiq	task
6	account	user
7	account	userprofile
8	announcement	announcement
9	conf	judgeserver
10	problem	problem
11	problem	problemtag
12	contest	acmcontestrank
13	contest	contest
14	contest	contestannouncement
15	contest	oicontestrank
16	submission	submission
17	options	sysoptions
\.


--
-- Data for Name: django_dramatiq_task; Type: TABLE DATA; Schema: public; Owner: onlinejudge
--

COPY public.django_dramatiq_task (id, status, created_at, updated_at, message_data) FROM stdin;
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: onlinejudge
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	account	0001_initial	2022-03-11 05:27:31.785851+00
2	account	0002_auto_20170209_1028	2022-03-11 05:27:31.812232+00
3	account	0003_userprofile_total_score	2022-03-11 05:27:31.833343+00
4	account	0005_auto_20170830_1154	2022-03-11 05:27:31.867376+00
5	account	0006_user_session_keys	2022-03-11 05:27:31.900591+00
6	account	0008_auto_20171011_1214	2022-03-11 05:27:32.026637+00
7	account	0009_auto_20171125_1514	2022-03-11 05:27:32.031986+00
8	account	0010_auto_20180501_0436	2022-03-11 05:27:32.087713+00
9	account	0011_auto_20180501_0456	2022-03-11 05:27:32.093887+00
10	account	0012_userprofile_language	2022-03-11 05:27:32.099982+00
11	announcement	0001_initial	2022-03-11 05:27:32.114728+00
12	announcement	0002_auto_20171011_1214	2022-03-11 05:27:32.125568+00
13	announcement	0003_auto_20180501_0436	2022-03-11 05:27:32.13247+00
14	contenttypes	0001_initial	2022-03-11 05:27:32.143376+00
15	contenttypes	0002_remove_content_type_name	2022-03-11 05:27:32.155301+00
16	auth	0001_initial	2022-03-11 05:27:32.188222+00
17	auth	0002_alter_permission_name_max_length	2022-03-11 05:27:32.19462+00
18	auth	0003_alter_user_email_max_length	2022-03-11 05:27:32.201459+00
19	auth	0004_alter_user_username_opts	2022-03-11 05:27:32.208264+00
20	auth	0005_alter_user_last_login_null	2022-03-11 05:27:32.215082+00
21	auth	0006_require_contenttypes_0002	2022-03-11 05:27:32.216905+00
22	auth	0007_alter_validators_add_error_messages	2022-03-11 05:27:32.223762+00
23	auth	0008_alter_user_username_max_length	2022-03-11 05:27:32.230669+00
24	auth	0009_alter_user_last_name_max_length	2022-03-11 05:27:32.237493+00
25	conf	0001_initial	2022-03-11 05:27:32.259748+00
26	conf	0002_auto_20171011_1214	2022-03-11 05:27:32.277846+00
27	conf	0003_judgeserver_is_disabled	2022-03-11 05:27:32.285002+00
28	conf	0004_auto_20180501_0436	2022-03-11 05:27:32.325135+00
29	problem	0001_initial	2022-03-11 05:27:32.357125+00
30	contest	0001_initial	2022-03-11 05:27:32.48161+00
31	contest	0002_auto_20170209_0845	2022-03-11 05:27:32.533504+00
32	contest	0003_auto_20170217_0820	2022-03-11 05:27:32.606+00
33	contest	0004_auto_20170717_1324	2022-03-11 05:27:32.624719+00
34	contest	0005_auto_20170823_0918	2022-03-11 05:27:32.655951+00
35	contest	0006_auto_20171011_1214	2022-03-11 05:27:32.69739+00
36	contest	0007_contestannouncement_visible	2022-03-11 05:27:32.715646+00
37	contest	0008_contest_allowed_ip_ranges	2022-03-11 05:27:32.732814+00
38	contest	0009_auto_20180501_0436	2022-03-11 05:27:32.773227+00
39	contest	0010_auto_20190326_0201	2022-03-11 05:27:32.821376+00
40	django_dramatiq	0001_initial	2022-03-11 05:27:32.831497+00
41	options	0001_initial	2022-03-11 05:27:32.84312+00
42	options	0002_auto_20180501_0436	2022-03-11 05:27:32.852773+00
43	options	0003_migrate_languages_options	2022-03-11 05:27:32.857126+00
44	submission	0001_initial	2022-03-11 05:27:33.057427+00
45	submission	0002_auto_20170509_1203	2022-03-11 05:27:33.073854+00
46	submission	0005_submission_username	2022-03-11 05:27:33.290243+00
47	submission	0006_auto_20170830_1154	2022-03-11 05:27:33.302371+00
48	submission	0007_auto_20170923_1318	2022-03-11 05:27:33.480077+00
49	submission	0008_submission_ip	2022-03-11 05:27:33.493684+00
50	submission	0009_delete_user_output	2022-03-11 05:27:33.513953+00
51	problem	0002_problem__id	2022-03-11 05:27:33.537784+00
52	problem	0003_auto_20170217_0820	2022-03-11 05:27:33.593142+00
53	problem	0004_auto_20170501_0637	2022-03-11 05:27:34.256633+00
54	problem	0005_auto_20170815_1258	2022-03-11 05:27:34.324959+00
55	problem	0006_auto_20170823_0918	2022-03-11 05:27:34.436487+00
56	problem	0008_auto_20170923_1318	2022-03-11 05:27:34.6472+00
57	problem	0009_auto_20171011_1214	2022-03-11 05:27:34.781262+00
58	problem	0010_problem_spj_compile_ok	2022-03-11 05:27:34.806797+00
59	problem	0011_fix_problem_ac_count	2022-03-11 05:27:34.831234+00
60	problem	0012_auto_20180501_0436	2022-03-11 05:27:35.009141+00
61	problem	0013_problem_io_mode	2022-03-11 05:27:35.03999+00
62	problem	0014_problem_share_submission	2022-03-11 05:27:35.068697+00
63	sessions	0001_initial	2022-03-11 05:27:35.083298+00
64	submission	0011_fix_submission_number	2022-03-11 05:27:35.111995+00
65	submission	0012_auto_20180501_0436	2022-03-11 05:27:35.166961+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: onlinejudge
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: judge_server; Type: TABLE DATA; Schema: public; Owner: onlinejudge
--

COPY public.judge_server (id, hostname, ip, judger_version, cpu_core, memory_usage, cpu_usage, last_heartbeat, create_time, task_number, service_url, is_disabled) FROM stdin;
1	53200f767121	172.18.0.4	2.1.1	6	24.6999999999999993	0	2022-03-14 04:52:19.941479+00	2022-03-11 05:27:51.804363+00	0	http://judge-server:8080	f
\.


--
-- Data for Name: oi_contest_rank; Type: TABLE DATA; Schema: public; Owner: onlinejudge
--

COPY public.oi_contest_rank (id, submission_number, total_score, submission_info, contest_id, user_id) FROM stdin;
\.


--
-- Data for Name: options_sysoptions; Type: TABLE DATA; Schema: public; Owner: onlinejudge
--

COPY public.options_sysoptions (id, key, value) FROM stdin;
1	website_base_url	"http://127.0.0.1"
2	website_name	"Online Judge"
3	website_name_shortcut	"oj"
4	website_footer	"Online Judge Footer"
5	allow_register	true
6	submission_list_show_all	true
7	smtp_config	{}
9	throttling	{"ip": {"capacity": 100, "fill_rate": 0.1, "default_capacity": 50}, "user": {"capacity": 20, "fill_rate": 0.03, "default_capacity": 10}}
10	languages	[{"spj": {"config": {"command": "{exe_path} {in_file_path} {user_out_file_path}", "exe_name": "spj-{spj_version}", "seccomp_rule": "c_cpp"}, "compile": {"exe_name": "spj-{spj_version}", "src_name": "spj-{spj_version}.c", "max_memory": 1073741824, "max_cpu_time": 3000, "max_real_time": 10000, "compile_command": "/usr/bin/gcc -DONLINE_JUDGE -O2 -w -fmax-errors=3 -std=c11 {src_path} -lm -o {exe_path}"}}, "name": "C", "config": {"run": {"env": ["LANG=en_US.UTF-8", "LANGUAGE=en_US:en", "LC_ALL=en_US.UTF-8"], "command": "{exe_path}", "seccomp_rule": {"File IO": "c_cpp_file_io", "Standard IO": "c_cpp"}}, "compile": {"exe_name": "main", "src_name": "main.c", "max_memory": 268435456, "max_cpu_time": 3000, "max_real_time": 10000, "compile_command": "/usr/bin/gcc -DONLINE_JUDGE -O2 -w -fmax-errors=3 -std=c11 {src_path} -lm -o {exe_path}"}, "template": "//PREPEND BEGIN\\n#include <stdio.h>\\n//PREPEND END\\n\\n//TEMPLATE BEGIN\\nint add(int a, int b) {\\n  // Please fill this blank\\n  return ___________;\\n}\\n//TEMPLATE END\\n\\n//APPEND BEGIN\\nint main() {\\n  printf(\\"%d\\", add(1, 2));\\n  return 0;\\n}\\n//APPEND END"}, "description": "GCC 9.4", "content_type": "text/x-csrc"}, {"spj": {"config": {"command": "{exe_path} {in_file_path} {user_out_file_path}", "exe_name": "spj-{spj_version}", "seccomp_rule": "c_cpp"}, "compile": {"exe_name": "spj-{spj_version}", "src_name": "spj-{spj_version}.cpp", "max_memory": 1073741824, "max_cpu_time": 10000, "max_real_time": 20000, "compile_command": "/usr/bin/g++ -DONLINE_JUDGE -O2 -w -fmax-errors=3 -std=c++14 {src_path} -lm -o {exe_path}"}}, "name": "C++", "config": {"run": {"env": ["LANG=en_US.UTF-8", "LANGUAGE=en_US:en", "LC_ALL=en_US.UTF-8"], "command": "{exe_path}", "seccomp_rule": {"File IO": "c_cpp_file_io", "Standard IO": "c_cpp"}}, "compile": {"exe_name": "main", "src_name": "main.cpp", "max_memory": 1073741824, "max_cpu_time": 10000, "max_real_time": 20000, "compile_command": "/usr/bin/g++ -DONLINE_JUDGE -O2 -w -fmax-errors=3 -std=c++14 {src_path} -lm -o {exe_path}"}, "template": "//PREPEND BEGIN\\n#include <iostream>\\n//PREPEND END\\n\\n//TEMPLATE BEGIN\\nint add(int a, int b) {\\n  // Please fill this blank\\n  return ___________;\\n}\\n//TEMPLATE END\\n\\n//APPEND BEGIN\\nint main() {\\n  std::cout << add(1, 2);\\n  return 0;\\n}\\n//APPEND END"}, "description": "G++ 9.4", "content_type": "text/x-c++src"}, {"name": "Java", "config": {"run": {"env": ["LANG=en_US.UTF-8", "LANGUAGE=en_US:en", "LC_ALL=en_US.UTF-8"], "command": "/usr/bin/java -cp {exe_dir} -XX:MaxRAM={max_memory}k -Djava.security.manager -Dfile.encoding=UTF-8 -Djava.security.policy==/etc/java_policy -Djava.awt.headless=true Main", "seccomp_rule": null, "memory_limit_check_only": 1}, "compile": {"exe_name": "Main", "src_name": "Main.java", "max_memory": -1, "max_cpu_time": 5000, "max_real_time": 10000, "compile_command": "/usr/bin/javac {src_path} -d {exe_dir} -encoding UTF8"}, "template": "//PREPEND BEGIN\\n//PREPEND END\\n\\n//TEMPLATE BEGIN\\n//TEMPLATE END\\n\\n//APPEND BEGIN\\n//APPEND END"}, "description": "OpenJDK 11", "content_type": "text/x-java"}, {"name": "Python2", "config": {"run": {"env": ["LANG=en_US.UTF-8", "LANGUAGE=en_US:en", "LC_ALL=en_US.UTF-8"], "command": "/usr/bin/python {exe_path}", "seccomp_rule": "general"}, "compile": {"exe_name": "solution.pyc", "src_name": "solution.py", "max_memory": 134217728, "max_cpu_time": 3000, "max_real_time": 10000, "compile_command": "/usr/bin/python -m py_compile {src_path}"}, "template": "//PREPEND BEGIN\\n//PREPEND END\\n\\n//TEMPLATE BEGIN\\n//TEMPLATE END\\n\\n//APPEND BEGIN\\n//APPEND END"}, "description": "Python 2.7", "content_type": "text/x-python"}, {"name": "Python3", "config": {"run": {"env": ["LANG=en_US.UTF-8", "LANGUAGE=en_US:en", "LC_ALL=en_US.UTF-8", "PYTHONIOENCODING=utf-8"], "command": "/usr/bin/python3 {exe_path}", "seccomp_rule": "general"}, "compile": {"exe_name": "__pycache__/solution.cpython-36.pyc", "src_name": "solution.py", "max_memory": 134217728, "max_cpu_time": 3000, "max_real_time": 10000, "compile_command": "/usr/bin/python3 -m py_compile {src_path}"}, "template": "//PREPEND BEGIN\\n//PREPEND END\\n\\n//TEMPLATE BEGIN\\n//TEMPLATE END\\n\\n//APPEND BEGIN\\n//APPEND END"}, "description": "Python 3.6", "content_type": "text/x-python"}, {"name": "Golang", "config": {"run": {"env": ["GODEBUG=madvdontneed=1", "GOMAXPROCS=1", "LANG=en_US.UTF-8", "LANGUAGE=en_US:en", "LC_ALL=en_US.UTF-8"], "command": "{exe_path}", "seccomp_rule": "golang", "memory_limit_check_only": 1}, "compile": {"env": ["GOCACHE=/tmp", "GOPATH=/tmp", "GOMAXPROCS=1", "LANG=en_US.UTF-8", "LANGUAGE=en_US:en", "LC_ALL=en_US.UTF-8"], "exe_name": "main", "src_name": "main.go", "max_memory": 1073741824, "max_cpu_time": 3000, "max_real_time": 5000, "compile_command": "/usr/bin/go build -o {exe_path} {src_path}"}, "template": "//PREPEND BEGIN\\n//PREPEND END\\n\\n//TEMPLATE BEGIN\\n//TEMPLATE END\\n\\n//APPEND BEGIN\\n//APPEND END"}, "description": "Golang 1.17", "content_type": "text/x-go"}, {"name": "JavaScript", "config": {"run": {"env": ["LANG=en_US.UTF-8", "LANGUAGE=en_US:en", "LC_ALL=en_US.UTF-8"], "command": "/usr/bin/node {exe_path}", "seccomp_rule": "node", "memory_limit_check_only": 1}, "compile": {"env": ["LANG=en_US.UTF-8", "LANGUAGE=en_US:en", "LC_ALL=en_US.UTF-8"], "exe_name": "main.js", "src_name": "main.js", "max_memory": 1073741824, "max_cpu_time": 3000, "max_real_time": 5000, "compile_command": "/usr/bin/node --check {src_path}"}, "template": "//PREPEND BEGIN\\n//PREPEND END\\n\\n//TEMPLATE BEGIN\\n//TEMPLATE END\\n\\n//APPEND BEGIN\\n//APPEND END"}, "description": "Node 14", "content_type": "text/javascript"}]
8	judge_server_token	"CHANGE_THIS"
\.


--
-- Data for Name: problem; Type: TABLE DATA; Schema: public; Owner: onlinejudge
--

COPY public.problem (id, title, description, input_description, output_description, samples, test_case_id, test_case_score, hint, languages, template, create_time, last_update_time, time_limit, memory_limit, spj, spj_language, spj_code, spj_version, rule_type, visible, difficulty, source, submission_number, accepted_number, created_by_id, _id, statistic_info, total_score, contest_id, is_public, spj_compile_ok, io_mode, share_submission) FROM stdin;
1	test	<p>test</p>	<p>test</p>	<p>test</p>	[{"input": "test", "output": "test"}]	6084069d295befd9c45194c9d1125460	[{"score": 100, "input_name": "1.in", "output_name": "1.out"}]		["C", "C++", "Golang", "Java", "JavaScript", "Python2", "Python3"]	{}	2022-03-14 02:37:02.500076+00	\N	1000	256	f	\N	\N	\N	ACM	t	Low		0	0	1	test	{}	0	\N	f	f	{"input": "input.txt", "output": "output.txt", "io_mode": "Standard IO"}	f
\.


--
-- Data for Name: problem_tag; Type: TABLE DATA; Schema: public; Owner: onlinejudge
--

COPY public.problem_tag (id, name) FROM stdin;
1	test
\.


--
-- Data for Name: problem_tags; Type: TABLE DATA; Schema: public; Owner: onlinejudge
--

COPY public.problem_tags (id, problem_id, problemtag_id) FROM stdin;
1	1	1
\.


--
-- Data for Name: submission; Type: TABLE DATA; Schema: public; Owner: onlinejudge
--

COPY public.submission (id, contest_id, problem_id, create_time, user_id, code, result, info, language, shared, statistic_info, username, ip) FROM stdin;
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: onlinejudge
--

COPY public."user" (id, password, last_login, username, email, create_time, admin_type, reset_password_token, reset_password_token_expire_time, auth_token, two_factor_auth, tfa_token, open_api, open_api_appkey, is_disabled, problem_permission, session_keys) FROM stdin;
2	pbkdf2_sha256$120000$Fwe9HxAv81wD$7XPxcG5rBMsvQyY9nwN1PwFCn3wO3BA3rQR8R70ud9Y=	2022-03-11 05:53:18.504991+00	shineruei	shining1487@gmail.com	2022-03-11 05:31:14.784985+00	Regular User	4511cbd990b9fbda5aedca52292167ff	2022-03-11 05:57:15.289075+00	\N	f	\N	f	\N	f	None	["we2nqybtbgc89phlqrogdz3p42p2pgwo", "v39z5is6q977cxei2652fj68yhan085x"]
3	pbkdf2_sha256$120000$crcbkutXwukF$E0AMX6k2eiCUWgwx0Uw/lCsOymegbh1WhiLdAi83bEg=	2022-03-11 06:16:39.713769+00	chemhuang	bobbinhuang@gmail.com	2022-03-11 05:55:36.970185+00	Regular User	\N	\N	\N	f	\N	f	\N	f	None	["vjbyg2mif1eb7e5fzg1v3cj5ve9ymtjy", "8b1fi2xgr5zcyj82imy1qqv4237dqspq"]
4	pbkdf2_sha256$120000$NzqYCicBdStG$+RBIzathOnMNJdMN2R9JuG9kOf26V9BTWVzBQDQJiDw=	2022-03-12 13:35:47.239462+00	angelliu	liuangel1717@gmail.com	2022-03-12 13:35:21.998478+00	Regular User	\N	\N	\N	f	52d7cd73a3d25a86e08bddbcb98b1949	f	\N	f	None	["0wpe9xqs8jw13r6c9ck9aedw2wazv7zb"]
1	pbkdf2_sha256$120000$lJOn9OzSCcYF$C+IoVPVrFboGM/pt6fa5CBNLbJz3K1kByXvDMCZ1CVQ=	2022-03-14 02:21:48.865207+00	root	\N	2022-03-11 05:27:36.072126+00	Super Admin	\N	\N	\N	f	\N	f	\N	f	All	["iy7ez8zhbqdzzn2ughjgxh156otse03u"]
\.


--
-- Data for Name: user_profile; Type: TABLE DATA; Schema: public; Owner: onlinejudge
--

COPY public.user_profile (id, acm_problems_status, avatar, blog, mood, accepted_number, submission_number, github, school, major, user_id, total_score, oi_problems_status, real_name, language) FROM stdin;
2	{}	/public/avatar/default.png	\N	\N	0	0	\N	\N	\N	2	0	{}	\N	\N
3	{}	/public/avatar/default.png	\N	\N	0	0	\N	\N	\N	3	0	{}	\N	\N
4	{}	/public/avatar/default.png	\N	\N	0	0	\N	\N	\N	4	0	{}	\N	\N
1	{}	/public/avatar/default.png	\N	\N	0	0	\N	\N	\N	1	0	{}	\N	zh-TW
\.


--
-- Name: acm_contest_rank_id_seq; Type: SEQUENCE SET; Schema: public; Owner: onlinejudge
--

SELECT pg_catalog.setval('public.acm_contest_rank_id_seq', 1, false);


--
-- Name: announcement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: onlinejudge
--

SELECT pg_catalog.setval('public.announcement_id_seq', 1, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: onlinejudge
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: onlinejudge
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: onlinejudge
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 68, true);


--
-- Name: contest_announcement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: onlinejudge
--

SELECT pg_catalog.setval('public.contest_announcement_id_seq', 1, false);


--
-- Name: contest_id_seq; Type: SEQUENCE SET; Schema: public; Owner: onlinejudge
--

SELECT pg_catalog.setval('public.contest_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: onlinejudge
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 17, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: onlinejudge
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 65, true);


--
-- Name: judge_server_id_seq; Type: SEQUENCE SET; Schema: public; Owner: onlinejudge
--

SELECT pg_catalog.setval('public.judge_server_id_seq', 1, true);


--
-- Name: oi_contest_rank_id_seq; Type: SEQUENCE SET; Schema: public; Owner: onlinejudge
--

SELECT pg_catalog.setval('public.oi_contest_rank_id_seq', 1, false);


--
-- Name: options_sysoptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: onlinejudge
--

SELECT pg_catalog.setval('public.options_sysoptions_id_seq', 10, true);


--
-- Name: problem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: onlinejudge
--

SELECT pg_catalog.setval('public.problem_id_seq', 1, true);


--
-- Name: problem_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: onlinejudge
--

SELECT pg_catalog.setval('public.problem_tag_id_seq', 1, true);


--
-- Name: problem_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: onlinejudge
--

SELECT pg_catalog.setval('public.problem_tags_id_seq', 1, true);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: onlinejudge
--

SELECT pg_catalog.setval('public.user_id_seq', 4, true);


--
-- Name: user_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: onlinejudge
--

SELECT pg_catalog.setval('public.user_profile_id_seq', 4, true);


--
-- Name: acm_contest_rank acm_contest_rank_pkey; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.acm_contest_rank
    ADD CONSTRAINT acm_contest_rank_pkey PRIMARY KEY (id);


--
-- Name: acm_contest_rank acm_contest_rank_user_id_contest_id_26151d10_uniq; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.acm_contest_rank
    ADD CONSTRAINT acm_contest_rank_user_id_contest_id_26151d10_uniq UNIQUE (user_id, contest_id);


--
-- Name: announcement announcement_pkey; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.announcement
    ADD CONSTRAINT announcement_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: contest_announcement contest_announcement_pkey; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.contest_announcement
    ADD CONSTRAINT contest_announcement_pkey PRIMARY KEY (id);


--
-- Name: contest contest_pkey; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.contest
    ADD CONSTRAINT contest_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_dramatiq_task django_dramatiq_task_pkey; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.django_dramatiq_task
    ADD CONSTRAINT django_dramatiq_task_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: judge_server judge_server_pkey; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.judge_server
    ADD CONSTRAINT judge_server_pkey PRIMARY KEY (id);


--
-- Name: oi_contest_rank oi_contest_rank_pkey; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.oi_contest_rank
    ADD CONSTRAINT oi_contest_rank_pkey PRIMARY KEY (id);


--
-- Name: oi_contest_rank oi_contest_rank_user_id_contest_id_fe51a302_uniq; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.oi_contest_rank
    ADD CONSTRAINT oi_contest_rank_user_id_contest_id_fe51a302_uniq UNIQUE (user_id, contest_id);


--
-- Name: options_sysoptions options_sysoptions_key_key; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.options_sysoptions
    ADD CONSTRAINT options_sysoptions_key_key UNIQUE (key);


--
-- Name: options_sysoptions options_sysoptions_pkey; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.options_sysoptions
    ADD CONSTRAINT options_sysoptions_pkey PRIMARY KEY (id);


--
-- Name: problem problem__id_contest_id_346645fe_uniq; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.problem
    ADD CONSTRAINT problem__id_contest_id_346645fe_uniq UNIQUE (_id, contest_id);


--
-- Name: problem problem_pkey; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.problem
    ADD CONSTRAINT problem_pkey PRIMARY KEY (id);


--
-- Name: problem_tag problem_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.problem_tag
    ADD CONSTRAINT problem_tag_pkey PRIMARY KEY (id);


--
-- Name: problem_tags problem_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.problem_tags
    ADD CONSTRAINT problem_tags_pkey PRIMARY KEY (id);


--
-- Name: problem_tags problem_tags_problem_id_problemtag_id_318459d1_uniq; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.problem_tags
    ADD CONSTRAINT problem_tags_problem_id_problemtag_id_318459d1_uniq UNIQUE (problem_id, problemtag_id);


--
-- Name: submission submission_pkey; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.submission
    ADD CONSTRAINT submission_pkey PRIMARY KEY (id);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: user_profile user_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.user_profile
    ADD CONSTRAINT user_profile_pkey PRIMARY KEY (id);


--
-- Name: user_profile user_profile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.user_profile
    ADD CONSTRAINT user_profile_user_id_key UNIQUE (user_id);


--
-- Name: user user_username_key; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key UNIQUE (username);


--
-- Name: acm_contest_rank_contest_id_21030ccd; Type: INDEX; Schema: public; Owner: onlinejudge
--

CREATE INDEX acm_contest_rank_contest_id_21030ccd ON public.acm_contest_rank USING btree (contest_id);


--
-- Name: acm_contest_rank_user_id_40391ab2; Type: INDEX; Schema: public; Owner: onlinejudge
--

CREATE INDEX acm_contest_rank_user_id_40391ab2 ON public.acm_contest_rank USING btree (user_id);


--
-- Name: announcement_created_by_id_359ccf50; Type: INDEX; Schema: public; Owner: onlinejudge
--

CREATE INDEX announcement_created_by_id_359ccf50 ON public.announcement USING btree (created_by_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: onlinejudge
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: onlinejudge
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: onlinejudge
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: onlinejudge
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: contest_announcement_contest_id_a8cb419f; Type: INDEX; Schema: public; Owner: onlinejudge
--

CREATE INDEX contest_announcement_contest_id_a8cb419f ON public.contest_announcement USING btree (contest_id);


--
-- Name: contest_announcement_created_by_id_469a14ce; Type: INDEX; Schema: public; Owner: onlinejudge
--

CREATE INDEX contest_announcement_created_by_id_469a14ce ON public.contest_announcement USING btree (created_by_id);


--
-- Name: contest_created_by_id_a763ca7e; Type: INDEX; Schema: public; Owner: onlinejudge
--

CREATE INDEX contest_created_by_id_a763ca7e ON public.contest USING btree (created_by_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: onlinejudge
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: onlinejudge
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: oi_contest_rank_contest_id_171fcdaf; Type: INDEX; Schema: public; Owner: onlinejudge
--

CREATE INDEX oi_contest_rank_contest_id_171fcdaf ON public.oi_contest_rank USING btree (contest_id);


--
-- Name: oi_contest_rank_user_id_0ba36852; Type: INDEX; Schema: public; Owner: onlinejudge
--

CREATE INDEX oi_contest_rank_user_id_0ba36852 ON public.oi_contest_rank USING btree (user_id);


--
-- Name: problem__id_919b1d80; Type: INDEX; Schema: public; Owner: onlinejudge
--

CREATE INDEX problem__id_919b1d80 ON public.problem USING btree (_id);


--
-- Name: problem_contest_id_328e013a; Type: INDEX; Schema: public; Owner: onlinejudge
--

CREATE INDEX problem_contest_id_328e013a ON public.problem USING btree (contest_id);


--
-- Name: problem_created_by_id_cb362143; Type: INDEX; Schema: public; Owner: onlinejudge
--

CREATE INDEX problem_created_by_id_cb362143 ON public.problem USING btree (created_by_id);


--
-- Name: problem_tags_problem_id_866ecb8d; Type: INDEX; Schema: public; Owner: onlinejudge
--

CREATE INDEX problem_tags_problem_id_866ecb8d ON public.problem_tags USING btree (problem_id);


--
-- Name: problem_tags_problemtag_id_72d20571; Type: INDEX; Schema: public; Owner: onlinejudge
--

CREATE INDEX problem_tags_problemtag_id_72d20571 ON public.problem_tags USING btree (problemtag_id);


--
-- Name: submission_contest_id_775716d5; Type: INDEX; Schema: public; Owner: onlinejudge
--

CREATE INDEX submission_contest_id_775716d5 ON public.submission USING btree (contest_id);


--
-- Name: submission_problem_id_76847b55; Type: INDEX; Schema: public; Owner: onlinejudge
--

CREATE INDEX submission_problem_id_76847b55 ON public.submission USING btree (problem_id);


--
-- Name: submission_result_37e2f67a; Type: INDEX; Schema: public; Owner: onlinejudge
--

CREATE INDEX submission_result_37e2f67a ON public.submission USING btree (result);


--
-- Name: submission_user_id_3779a8c1; Type: INDEX; Schema: public; Owner: onlinejudge
--

CREATE INDEX submission_user_id_3779a8c1 ON public.submission USING btree (user_id);


--
-- Name: acm_contest_rank acm_contest_rank_contest_id_21030ccd_fk_contest_id; Type: FK CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.acm_contest_rank
    ADD CONSTRAINT acm_contest_rank_contest_id_21030ccd_fk_contest_id FOREIGN KEY (contest_id) REFERENCES public.contest(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: acm_contest_rank acm_contest_rank_user_id_40391ab2_fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.acm_contest_rank
    ADD CONSTRAINT acm_contest_rank_user_id_40391ab2_fk_user_id FOREIGN KEY (user_id) REFERENCES public."user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: announcement announcement_created_by_id_359ccf50_fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.announcement
    ADD CONSTRAINT announcement_created_by_id_359ccf50_fk_user_id FOREIGN KEY (created_by_id) REFERENCES public."user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contest_announcement contest_announcement_contest_id_a8cb419f_fk_contest_id; Type: FK CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.contest_announcement
    ADD CONSTRAINT contest_announcement_contest_id_a8cb419f_fk_contest_id FOREIGN KEY (contest_id) REFERENCES public.contest(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contest_announcement contest_announcement_created_by_id_469a14ce_fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.contest_announcement
    ADD CONSTRAINT contest_announcement_created_by_id_469a14ce_fk_user_id FOREIGN KEY (created_by_id) REFERENCES public."user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contest contest_created_by_id_a763ca7e_fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.contest
    ADD CONSTRAINT contest_created_by_id_a763ca7e_fk_user_id FOREIGN KEY (created_by_id) REFERENCES public."user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oi_contest_rank oi_contest_rank_contest_id_171fcdaf_fk_contest_id; Type: FK CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.oi_contest_rank
    ADD CONSTRAINT oi_contest_rank_contest_id_171fcdaf_fk_contest_id FOREIGN KEY (contest_id) REFERENCES public.contest(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oi_contest_rank oi_contest_rank_user_id_0ba36852_fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.oi_contest_rank
    ADD CONSTRAINT oi_contest_rank_user_id_0ba36852_fk_user_id FOREIGN KEY (user_id) REFERENCES public."user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: problem problem_contest_id_328e013a_fk_contest_id; Type: FK CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.problem
    ADD CONSTRAINT problem_contest_id_328e013a_fk_contest_id FOREIGN KEY (contest_id) REFERENCES public.contest(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: problem problem_created_by_id_cb362143_fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.problem
    ADD CONSTRAINT problem_created_by_id_cb362143_fk_user_id FOREIGN KEY (created_by_id) REFERENCES public."user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: problem_tags problem_tags_problem_id_866ecb8d_fk_problem_id; Type: FK CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.problem_tags
    ADD CONSTRAINT problem_tags_problem_id_866ecb8d_fk_problem_id FOREIGN KEY (problem_id) REFERENCES public.problem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: problem_tags problem_tags_problemtag_id_72d20571_fk_problem_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.problem_tags
    ADD CONSTRAINT problem_tags_problemtag_id_72d20571_fk_problem_tag_id FOREIGN KEY (problemtag_id) REFERENCES public.problem_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: submission submission_contest_id_775716d5_fk_contest_id; Type: FK CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.submission
    ADD CONSTRAINT submission_contest_id_775716d5_fk_contest_id FOREIGN KEY (contest_id) REFERENCES public.contest(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: submission submission_problem_id_76847b55_fk_problem_id; Type: FK CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.submission
    ADD CONSTRAINT submission_problem_id_76847b55_fk_problem_id FOREIGN KEY (problem_id) REFERENCES public.problem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_profile user_profile_user_id_8fdce8e2_fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.user_profile
    ADD CONSTRAINT user_profile_user_id_8fdce8e2_fk_user_id FOREIGN KEY (user_id) REFERENCES public."user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

\connect postgres

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.18
-- Dumped by pg_dump version 10.18

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

--
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: onlinejudge
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- PostgreSQL database dump complete
--

\connect template1

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.18
-- Dumped by pg_dump version 10.18

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

--
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: onlinejudge
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

