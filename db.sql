--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
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


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO admin;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO admin;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO admin;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO admin;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO admin;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO admin;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE auth_user OWNER TO admin;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE auth_user_groups OWNER TO admin;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_groups_id_seq OWNER TO admin;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_id_seq OWNER TO admin;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_user_user_permissions OWNER TO admin;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_user_permissions_id_seq OWNER TO admin;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: cart_cartorder_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE cart_cartorder_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cart_cartorder_id_seq OWNER TO admin;

--
-- Name: cart_cartorder; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE cart_cartorder (
    id integer DEFAULT nextval('cart_cartorder_id_seq'::regclass) NOT NULL,
    quantity integer NOT NULL,
    item_id_id integer NOT NULL,
    order_id integer
);


ALTER TABLE cart_cartorder OWNER TO admin;

--
-- Name: category_category_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE category_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE category_category_id_seq OWNER TO admin;

--
-- Name: category_category; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE category_category (
    id integer DEFAULT nextval('category_category_id_seq'::regclass) NOT NULL,
    name character varying(50) NOT NULL,
    slug character varying(50),
    sort_order character varying(50),
    image character varying(100),
    parent_category_id integer
);


ALTER TABLE category_category OWNER TO admin;

--
-- Name: contact_contact; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE contact_contact (
    id integer NOT NULL,
    topis character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(254) NOT NULL,
    message text NOT NULL
);


ALTER TABLE contact_contact OWNER TO admin;

--
-- Name: contact_contact_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE contact_contact_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE contact_contact_id_seq OWNER TO admin;

--
-- Name: contact_contact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE contact_contact_id_seq OWNED BY contact_contact.id;


--
-- Name: delivery_delivery_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE delivery_delivery_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE delivery_delivery_id_seq OWNER TO admin;

--
-- Name: delivery_delivery; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE delivery_delivery (
    id integer DEFAULT nextval('delivery_delivery_id_seq'::regclass) NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE delivery_delivery OWNER TO admin;

--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE django_admin_log OWNER TO admin;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO admin;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO admin;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO admin;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO admin;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO admin;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO admin;

--
-- Name: item_item_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE item_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE item_item_id_seq OWNER TO admin;

--
-- Name: item_item; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE item_item (
    id integer DEFAULT nextval('item_item_id_seq'::regclass) NOT NULL,
    name character varying(255) NOT NULL,
    description text NOT NULL,
    size character varying(20),
    options text,
    quantity integer NOT NULL,
    price integer NOT NULL,
    category_id_id integer NOT NULL,
    image character varying(100),
    slug character varying(255),
    amazon_id character varying(255),
    color character varying(255),
    thumbnail_image character varying(100),
    brand character varying(255)
);


ALTER TABLE item_item OWNER TO admin;

--
-- Name: newsletters_newsletter; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE newsletters_newsletter (
    id integer NOT NULL,
    email character varying(254) NOT NULL
);


ALTER TABLE newsletters_newsletter OWNER TO admin;

--
-- Name: newsletters_newsletter_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE newsletters_newsletter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE newsletters_newsletter_id_seq OWNER TO admin;

--
-- Name: newsletters_newsletter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE newsletters_newsletter_id_seq OWNED BY newsletters_newsletter.id;


--
-- Name: order_userorder_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE order_userorder_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE order_userorder_id_seq OWNER TO admin;

--
-- Name: order_userorder; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE order_userorder (
    id integer DEFAULT nextval('order_userorder_id_seq'::regclass) NOT NULL,
    status character varying(255),
    summary integer NOT NULL,
    cart_id integer,
    delivery_id_id integer NOT NULL,
    payment_id_id integer NOT NULL,
    user_id_id integer,
    city character varying(100),
    country character varying(100),
    first_line_adress character varying(255),
    postal_code character varying(10),
    first_name character varying(255),
    email character varying(255)
);


ALTER TABLE order_userorder OWNER TO admin;

--
-- Name: payment_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE payment_payment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE payment_payment_id_seq OWNER TO admin;

--
-- Name: payment_payment; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE payment_payment (
    id integer DEFAULT nextval('payment_payment_id_seq'::regclass) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE payment_payment OWNER TO admin;

--
-- Name: profiles_profile; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE profiles_profile (
    id integer NOT NULL,
    first_name character varying(100),
    second_name character varying(100),
    city character varying(100),
    first_line_adress character varying(255),
    second_line_adress character varying(255),
    country character varying(100),
    postal_code character varying(10),
    personal_sale integer,
    sex character varying(10),
    forgot_key character varying(255),
    user_id integer NOT NULL,
    company_name character varying(255),
    email character varying(254),
    phone integer
);


ALTER TABLE profiles_profile OWNER TO admin;

--
-- Name: profiles_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE profiles_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE profiles_profile_id_seq OWNER TO admin;

--
-- Name: profiles_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE profiles_profile_id_seq OWNED BY profiles_profile.id;


--
-- Name: user_user_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE user_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_user_id_seq OWNER TO admin;

--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: contact_contact id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY contact_contact ALTER COLUMN id SET DEFAULT nextval('contact_contact_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: newsletters_newsletter id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY newsletters_newsletter ALTER COLUMN id SET DEFAULT nextval('newsletters_newsletter_id_seq'::regclass);


--
-- Name: profiles_profile id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY profiles_profile ALTER COLUMN id SET DEFAULT nextval('profiles_profile_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO auth_permission VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO auth_permission VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO auth_permission VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO auth_permission VALUES (4, 'Can add permission', 2, 'add_permission');
INSERT INTO auth_permission VALUES (5, 'Can change permission', 2, 'change_permission');
INSERT INTO auth_permission VALUES (6, 'Can delete permission', 2, 'delete_permission');
INSERT INTO auth_permission VALUES (7, 'Can add group', 3, 'add_group');
INSERT INTO auth_permission VALUES (8, 'Can change group', 3, 'change_group');
INSERT INTO auth_permission VALUES (9, 'Can delete group', 3, 'delete_group');
INSERT INTO auth_permission VALUES (10, 'Can add user', 4, 'add_user');
INSERT INTO auth_permission VALUES (11, 'Can change user', 4, 'change_user');
INSERT INTO auth_permission VALUES (12, 'Can delete user', 4, 'delete_user');
INSERT INTO auth_permission VALUES (13, 'Can add content type', 5, 'add_contenttype');
INSERT INTO auth_permission VALUES (14, 'Can change content type', 5, 'change_contenttype');
INSERT INTO auth_permission VALUES (15, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO auth_permission VALUES (16, 'Can add session', 6, 'add_session');
INSERT INTO auth_permission VALUES (17, 'Can change session', 6, 'change_session');
INSERT INTO auth_permission VALUES (18, 'Can delete session', 6, 'delete_session');
INSERT INTO auth_permission VALUES (19, 'Can add user', 7, 'add_user');
INSERT INTO auth_permission VALUES (20, 'Can change user', 7, 'change_user');
INSERT INTO auth_permission VALUES (21, 'Can delete user', 7, 'delete_user');
INSERT INTO auth_permission VALUES (22, 'Can add delivery', 8, 'add_delivery');
INSERT INTO auth_permission VALUES (23, 'Can change delivery', 8, 'change_delivery');
INSERT INTO auth_permission VALUES (24, 'Can delete delivery', 8, 'delete_delivery');
INSERT INTO auth_permission VALUES (25, 'Can add payment', 9, 'add_payment');
INSERT INTO auth_permission VALUES (26, 'Can change payment', 9, 'change_payment');
INSERT INTO auth_permission VALUES (27, 'Can delete payment', 9, 'delete_payment');
INSERT INTO auth_permission VALUES (28, 'Can add category', 10, 'add_category');
INSERT INTO auth_permission VALUES (29, 'Can change category', 10, 'change_category');
INSERT INTO auth_permission VALUES (30, 'Can delete category', 10, 'delete_category');
INSERT INTO auth_permission VALUES (31, 'Can add item', 11, 'add_item');
INSERT INTO auth_permission VALUES (32, 'Can change item', 11, 'change_item');
INSERT INTO auth_permission VALUES (33, 'Can delete item', 11, 'delete_item');
INSERT INTO auth_permission VALUES (34, 'Can add cart order', 12, 'add_cartorder');
INSERT INTO auth_permission VALUES (35, 'Can change cart order', 12, 'change_cartorder');
INSERT INTO auth_permission VALUES (36, 'Can delete cart order', 12, 'delete_cartorder');
INSERT INTO auth_permission VALUES (37, 'Can add user order', 13, 'add_userorder');
INSERT INTO auth_permission VALUES (38, 'Can change user order', 13, 'change_userorder');
INSERT INTO auth_permission VALUES (39, 'Can delete user order', 13, 'delete_userorder');
INSERT INTO auth_permission VALUES (40, 'Can add contact', 14, 'add_contact');
INSERT INTO auth_permission VALUES (41, 'Can change contact', 14, 'change_contact');
INSERT INTO auth_permission VALUES (42, 'Can delete contact', 14, 'delete_contact');
INSERT INTO auth_permission VALUES (43, 'Can add newsletter', 15, 'add_newsletter');
INSERT INTO auth_permission VALUES (44, 'Can change newsletter', 15, 'change_newsletter');
INSERT INTO auth_permission VALUES (45, 'Can delete newsletter', 15, 'delete_newsletter');
INSERT INTO auth_permission VALUES (46, 'Can add profile', 16, 'add_profile');
INSERT INTO auth_permission VALUES (47, 'Can change profile', 16, 'change_profile');
INSERT INTO auth_permission VALUES (48, 'Can delete profile', 16, 'delete_profile');


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('auth_permission_id_seq', 48, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO auth_user VALUES (2, 'pbkdf2_sha256$30000$EBaIKhErtzhQ$4n8iTg6x7Npa+fce/4jujCFABJLLFn63iwIGy2qZdg0=', '2017-03-18 15:37:19.365828+03', false, 'karavaev', '', '', '', false, true, '2017-03-12 02:29:02.188552+03');
INSERT INTO auth_user VALUES (4, '123123123', NULL, false, 'andrey1', '', '', '', false, true, '2017-03-20 22:00:53.062303+03');
INSERT INTO auth_user VALUES (5, '123123', NULL, false, 'andrey2', '', '', '', false, true, '2017-03-20 22:03:39.55737+03');
INSERT INTO auth_user VALUES (6, '123123', NULL, false, 'andrey3', '', '', '', false, true, '2017-03-20 22:04:38.883011+03');
INSERT INTO auth_user VALUES (7, '123123', NULL, false, 'andrey4', '', '', '', false, true, '2017-03-20 22:05:22.326424+03');
INSERT INTO auth_user VALUES (8, '', NULL, false, 'andrey5', '', '', '', false, true, '2017-03-20 22:09:59.904868+03');
INSERT INTO auth_user VALUES (9, 'pbkdf2_sha256$30000$ZWSSgtkiQlqi$klhtL8EFt1nkcjFWA4NyL3OBw0lguNm1uwd3dVu5sIE=', '2017-03-20 22:13:03.809927+03', false, 'andrey6', '', '', '', false, true, '2017-03-20 22:12:55.4589+03');
INSERT INTO auth_user VALUES (10, 'pbkdf2_sha256$30000$W2n0mChTEMJk$lzt3GmqyW0pn4w/QbVv83sGHKVNcGIV7wzPowlzCP0I=', '2017-03-20 22:13:57.201343+03', false, 'andrey7', '', '', '', false, true, '2017-03-20 22:13:57.112438+03');
INSERT INTO auth_user VALUES (1, 'pbkdf2_sha256$30000$EBaIKhErtzhQ$4n8iTg6x7Npa+fce/4jujCFABJLLFn63iwIGy2qZdg0=', '2017-03-22 23:46:30.108241+03', true, 'admin', 'Andrey', 'Karavaev', 'karava3v@gmail.com', true, true, '2017-03-01 16:43:47.863332+03');


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('auth_user_id_seq', 10, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: cart_cartorder; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO cart_cartorder VALUES (7, 1, 3835, 10);
INSERT INTO cart_cartorder VALUES (8, 1, 3836, 11);
INSERT INTO cart_cartorder VALUES (9, 1, 4815, 11);
INSERT INTO cart_cartorder VALUES (10, 1, 4823, 11);
INSERT INTO cart_cartorder VALUES (11, 1, 5055, 11);
INSERT INTO cart_cartorder VALUES (12, 1, 4086, 12);
INSERT INTO cart_cartorder VALUES (13, 1, 4549, 13);


--
-- Name: cart_cartorder_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('cart_cartorder_id_seq', 13, true);


--
-- Data for Name: category_category; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO category_category VALUES (1, 'Men', 'men', '1', 'dist/img/830b5257d4692ba.png', NULL);
INSERT INTO category_category VALUES (2, 'Women', 'women', '', 'Фото_11.03.17_12.53_ДП_3.jpg', NULL);
INSERT INTO category_category VALUES (3, 'Shoes', 'shoes', '', '', 1);
INSERT INTO category_category VALUES (4, 'Shirts', 'shirts', '', '', 1);
INSERT INTO category_category VALUES (5, 'Jackets', 'jackets', '', '', 1);
INSERT INTO category_category VALUES (6, 'Pants', 'pants', '', '', 1);
INSERT INTO category_category VALUES (7, 'Shoes', 'shoes', '', '', 2);
INSERT INTO category_category VALUES (8, 'Dresses', 'dresses', '', '', 2);
INSERT INTO category_category VALUES (9, 'Tights', 'tights', '', '', 2);
INSERT INTO category_category VALUES (10, 'Shorts', 'shorts', '', '', 2);
INSERT INTO category_category VALUES (11, 'Home&Garden', 'homegarden', NULL, NULL, NULL);
INSERT INTO category_category VALUES (13, 'Garden', 'garden', NULL, NULL, 11);
INSERT INTO category_category VALUES (12, 'Kitchen', 'Kitchen', NULL, NULL, 11);
INSERT INTO category_category VALUES (14, 'Bath', 'bath', NULL, NULL, 11);
INSERT INTO category_category VALUES (15, 'Decor', 'decor', NULL, NULL, 11);
INSERT INTO category_category VALUES (17, 'Wine', 'wine', NULL, NULL, 16);
INSERT INTO category_category VALUES (18, 'Vinyl', 'vinyl', NULL, NULL, 16);
INSERT INTO category_category VALUES (16, 'Other', 'other', '', '', NULL);


--
-- Name: category_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('category_category_id_seq', 10, true);


--
-- Data for Name: contact_contact; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO contact_contact VALUES (1, 'Product', '123', 'andrewnyash@gmail.com', '123');
INSERT INTO contact_contact VALUES (2, 'Shipment', 'Andrey Moiseenko', 'andrewnyash@gmail.com', '23123');


--
-- Name: contact_contact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('contact_contact_id_seq', 2, true);


--
-- Data for Name: delivery_delivery; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO delivery_delivery VALUES (2, 'DHL Express');
INSERT INTO delivery_delivery VALUES (3, 'FedEx');
INSERT INTO delivery_delivery VALUES (4, 'Belpost');


--
-- Name: delivery_delivery_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('delivery_delivery_id_seq', 4, true);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO django_admin_log VALUES (1, '2017-03-12 02:29:02.228401+03', '2', 'karavaev', 1, '[{"added": {}}]', 4, 1);
INSERT INTO django_admin_log VALUES (2, '2017-03-12 18:37:31.95683+03', '1', 'Men', 1, '[{"added": {}}]', 10, 1);
INSERT INTO django_admin_log VALUES (3, '2017-03-12 18:37:54.388053+03', '2', 'women', 1, '[{"added": {}}]', 10, 1);
INSERT INTO django_admin_log VALUES (4, '2017-03-12 18:38:00.514371+03', '2', 'Women', 2, '[{"changed": {"fields": ["name"]}}]', 10, 1);
INSERT INTO django_admin_log VALUES (5, '2017-03-12 18:49:16.834989+03', '1', 'Item object', 1, '[{"added": {}}]', 11, 1);
INSERT INTO django_admin_log VALUES (6, '2017-03-12 18:50:36.021495+03', '2', 'Item object', 1, '[{"added": {}}]', 11, 1);
INSERT INTO django_admin_log VALUES (7, '2017-03-12 19:40:04.444574+03', '2', 'Women', 2, '[{"changed": {"fields": ["image"]}}]', 10, 1);
INSERT INTO django_admin_log VALUES (8, '2017-03-12 19:41:18.08396+03', '2', 'T-shirt', 2, '[{"changed": {"fields": ["image"]}}]', 11, 1);
INSERT INTO django_admin_log VALUES (9, '2017-03-12 19:41:38.273325+03', '1', 'Pants', 2, '[{"changed": {"fields": ["image"]}}]', 11, 1);
INSERT INTO django_admin_log VALUES (10, '2017-03-12 19:42:20.888506+03', '2', 'T-shirt', 2, '[{"changed": {"fields": ["image"]}}]', 11, 1);
INSERT INTO django_admin_log VALUES (11, '2017-03-20 11:12:40.079794+03', '3', 'Shoes, parent: Men, parent: None', 1, '[{"added": {}}]', 10, 1);
INSERT INTO django_admin_log VALUES (12, '2017-03-20 16:06:08.948423+03', '4', 'Shirts, parent: Men, parent: None', 1, '[{"added": {}}]', 10, 1);
INSERT INTO django_admin_log VALUES (13, '2017-03-20 17:24:30.031944+03', '5', 'Jackets, parent: Men, parent: None', 1, '[{"added": {}}]', 10, 1);
INSERT INTO django_admin_log VALUES (14, '2017-03-20 17:24:55.462065+03', '6', 'Pants, parent: Men, parent: None', 1, '[{"added": {}}]', 10, 1);
INSERT INTO django_admin_log VALUES (15, '2017-03-20 17:25:21.294752+03', '7', 'Shoes, parent: Women, parent: None', 1, '[{"added": {}}]', 10, 1);
INSERT INTO django_admin_log VALUES (16, '2017-03-20 17:25:41.179665+03', '8', 'Dresses, parent: Women, parent: None', 1, '[{"added": {}}]', 10, 1);
INSERT INTO django_admin_log VALUES (17, '2017-03-20 17:26:46.59257+03', '9', 'Tights, parent: Women, parent: None', 1, '[{"added": {}}]', 10, 1);
INSERT INTO django_admin_log VALUES (18, '2017-03-20 17:27:04.978792+03', '10', 'Shorts, parent: Women, parent: None', 1, '[{"added": {}}]', 10, 1);
INSERT INTO django_admin_log VALUES (19, '2017-03-23 11:09:34.431504+03', '16', 'Other, parent: None', 2, '[{"changed": {"fields": ["name", "slug"]}}]', 10, 1);
INSERT INTO django_admin_log VALUES (20, '2017-03-23 12:14:19.003288+03', '1', 'Payment object', 1, '[{"added": {}}]', 9, 1);
INSERT INTO django_admin_log VALUES (21, '2017-03-23 12:26:06.28195+03', '2', 'Cash, id: 2', 1, '[{"added": {}}]', 9, 1);
INSERT INTO django_admin_log VALUES (22, '2017-03-23 12:26:15.125234+03', '1', 'Credit card, id: 1', 2, '[{"changed": {"fields": ["name"]}}]', 9, 1);
INSERT INTO django_admin_log VALUES (23, '2017-03-23 12:26:52.610726+03', '2', 'DHL Express, id: 2', 1, '[{"added": {}}]', 8, 1);
INSERT INTO django_admin_log VALUES (24, '2017-03-23 12:27:04.716087+03', '3', 'FedEx, id: 3', 1, '[{"added": {}}]', 8, 1);
INSERT INTO django_admin_log VALUES (25, '2017-03-23 12:27:09.325932+03', '4', 'Belpost, id: 4', 1, '[{"added": {}}]', 8, 1);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 25, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO django_content_type VALUES (1, 'admin', 'logentry');
INSERT INTO django_content_type VALUES (2, 'auth', 'permission');
INSERT INTO django_content_type VALUES (3, 'auth', 'group');
INSERT INTO django_content_type VALUES (4, 'auth', 'user');
INSERT INTO django_content_type VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO django_content_type VALUES (6, 'sessions', 'session');
INSERT INTO django_content_type VALUES (7, 'user', 'user');
INSERT INTO django_content_type VALUES (8, 'delivery', 'delivery');
INSERT INTO django_content_type VALUES (9, 'payment', 'payment');
INSERT INTO django_content_type VALUES (10, 'category', 'category');
INSERT INTO django_content_type VALUES (11, 'item', 'item');
INSERT INTO django_content_type VALUES (12, 'cart', 'cartorder');
INSERT INTO django_content_type VALUES (13, 'order', 'userorder');
INSERT INTO django_content_type VALUES (14, 'contact', 'contact');
INSERT INTO django_content_type VALUES (15, 'newsletters', 'newsletter');
INSERT INTO django_content_type VALUES (16, 'profiles', 'profile');


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('django_content_type_id_seq', 16, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO django_migrations VALUES (1, 'contenttypes', '0001_initial', '2017-03-01 16:34:51.604699+03');
INSERT INTO django_migrations VALUES (2, 'auth', '0001_initial', '2017-03-01 16:34:51.661492+03');
INSERT INTO django_migrations VALUES (3, 'admin', '0001_initial', '2017-03-01 16:34:51.681681+03');
INSERT INTO django_migrations VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2017-03-01 16:34:51.694114+03');
INSERT INTO django_migrations VALUES (5, 'contenttypes', '0002_remove_content_type_name', '2017-03-01 16:34:51.733352+03');
INSERT INTO django_migrations VALUES (6, 'auth', '0002_alter_permission_name_max_length', '2017-03-01 16:34:51.744424+03');
INSERT INTO django_migrations VALUES (7, 'auth', '0003_alter_user_email_max_length', '2017-03-01 16:34:51.754023+03');
INSERT INTO django_migrations VALUES (8, 'auth', '0004_alter_user_username_opts', '2017-03-01 16:34:51.762988+03');
INSERT INTO django_migrations VALUES (9, 'auth', '0005_alter_user_last_login_null', '2017-03-01 16:34:51.775887+03');
INSERT INTO django_migrations VALUES (10, 'auth', '0006_require_contenttypes_0002', '2017-03-01 16:34:51.777779+03');
INSERT INTO django_migrations VALUES (11, 'auth', '0007_alter_validators_add_error_messages', '2017-03-01 16:34:51.786279+03');
INSERT INTO django_migrations VALUES (12, 'auth', '0008_alter_user_username_max_length', '2017-03-01 16:34:51.798035+03');
INSERT INTO django_migrations VALUES (13, 'category', '0001_initial', '2017-03-01 16:34:51.803761+03');
INSERT INTO django_migrations VALUES (14, 'item', '0001_initial', '2017-03-01 16:34:51.814112+03');
INSERT INTO django_migrations VALUES (15, 'cart', '0001_initial', '2017-03-01 16:34:51.824038+03');
INSERT INTO django_migrations VALUES (16, 'cart', '0002_auto_20170301_1309', '2017-03-01 16:34:51.833972+03');
INSERT INTO django_migrations VALUES (17, 'category', '0002_auto_20170301_1301', '2017-03-01 16:34:51.843869+03');
INSERT INTO django_migrations VALUES (18, 'category', '0003_category_image', '2017-03-01 16:34:51.84987+03');
INSERT INTO django_migrations VALUES (19, 'category', '0004_auto_20170301_1307', '2017-03-01 16:34:51.884524+03');
INSERT INTO django_migrations VALUES (20, 'category', '0005_auto_20170301_1533', '2017-03-01 16:34:51.895815+03');
INSERT INTO django_migrations VALUES (21, 'delivery', '0001_initial', '2017-03-01 16:34:51.901234+03');
INSERT INTO django_migrations VALUES (22, 'delivery', '0002_auto_20170301_1309', '2017-03-01 16:34:51.909373+03');
INSERT INTO django_migrations VALUES (23, 'item', '0002_remove_item_image', '2017-03-01 16:34:51.915479+03');
INSERT INTO django_migrations VALUES (24, 'item', '0003_item_image', '2017-03-01 16:34:51.921688+03');
INSERT INTO django_migrations VALUES (25, 'item', '0004_auto_20170301_1309', '2017-03-01 16:34:51.951862+03');
INSERT INTO django_migrations VALUES (26, 'user', '0001_initial', '2017-03-01 16:34:51.959779+03');
INSERT INTO django_migrations VALUES (27, 'payment', '0001_initial', '2017-03-01 16:34:51.965172+03');
INSERT INTO django_migrations VALUES (28, 'order', '0001_initial', '2017-03-01 16:34:51.988331+03');
INSERT INTO django_migrations VALUES (29, 'order', '0002_auto_20170301_1309', '2017-03-01 16:34:52.001904+03');
INSERT INTO django_migrations VALUES (30, 'payment', '0002_auto_20170301_1310', '2017-03-01 16:34:52.038086+03');
INSERT INTO django_migrations VALUES (31, 'sessions', '0001_initial', '2017-03-01 16:34:52.047503+03');
INSERT INTO django_migrations VALUES (32, 'user', '0002_auto_20170301_1312', '2017-03-01 16:34:52.101551+03');
INSERT INTO django_migrations VALUES (33, 'contact', '0001_initial', '2017-03-06 23:25:50.720568+03');
INSERT INTO django_migrations VALUES (34, 'contact', '0002_auto_20170305_2236', '2017-03-06 23:25:50.735357+03');
INSERT INTO django_migrations VALUES (35, 'category', '0006_auto_20170306_2357', '2017-03-12 00:37:27.451685+03');
INSERT INTO django_migrations VALUES (36, 'category', '0007_auto_20170307_0013', '2017-03-12 00:37:27.487721+03');
INSERT INTO django_migrations VALUES (37, 'item', '0005_auto_20170307_0016', '2017-03-12 00:37:27.50592+03');
INSERT INTO django_migrations VALUES (38, 'user', '0003_auto_20170311_2325', '2017-03-12 00:37:27.698235+03');
INSERT INTO django_migrations VALUES (39, 'user', '0004_auto_20170312_0135', '2017-03-12 02:14:44.243456+03');
INSERT INTO django_migrations VALUES (40, 'newsletters', '0001_initial', '2017-03-12 14:12:44.887343+03');
INSERT INTO django_migrations VALUES (41, 'newsletters', '0002_auto_20170312_1506', '2017-03-12 15:35:41.656547+03');
INSERT INTO django_migrations VALUES (42, 'newsletters', '0003_auto_20170312_1252', '2017-03-12 15:53:05.788244+03');
INSERT INTO django_migrations VALUES (43, 'item', '0006_item_slug', '2017-03-12 18:36:55.207199+03');
INSERT INTO django_migrations VALUES (44, 'category', '0008_auto_20170315_1200', '2017-03-18 15:33:19.408381+03');
INSERT INTO django_migrations VALUES (45, 'item', '0007_auto_20170315_1200', '2017-03-18 15:33:19.42356+03');
INSERT INTO django_migrations VALUES (46, 'order', '0003_auto_20170315_1200', '2017-03-18 15:33:19.520968+03');
INSERT INTO django_migrations VALUES (47, 'profiles', '0001_initial', '2017-03-18 15:33:19.555381+03');
INSERT INTO django_migrations VALUES (48, 'user', '0005_auto_20170315_1200', '2017-03-18 15:33:19.587484+03');
INSERT INTO django_migrations VALUES (49, 'user', '0006_auto_20170315_2030', '2017-03-18 15:33:19.609705+03');
INSERT INTO django_migrations VALUES (50, 'user', '0007_auto_20170315_2032', '2017-03-18 15:33:19.646476+03');
INSERT INTO django_migrations VALUES (51, 'category', '0009_category_parent_category', '2017-03-20 10:37:07.291138+03');
INSERT INTO django_migrations VALUES (52, 'category', '0010_auto_20170319_2055', '2017-03-20 10:37:07.311427+03');
INSERT INTO django_migrations VALUES (53, 'item', '0008_auto_20170319_1905', '2017-03-20 10:37:07.341331+03');
INSERT INTO django_migrations VALUES (54, 'item', '0009_auto_20170319_2039', '2017-03-20 10:37:07.359616+03');
INSERT INTO django_migrations VALUES (55, 'item', '0010_auto_20170319_2053', '2017-03-20 10:37:07.377605+03');
INSERT INTO django_migrations VALUES (56, 'item', '0011_item_amazon_id', '2017-03-20 10:37:07.396266+03');
INSERT INTO django_migrations VALUES (57, 'item', '0012_auto_20170319_2119', '2017-03-20 10:37:07.416632+03');
INSERT INTO django_migrations VALUES (58, 'item', '0013_item_color', '2017-03-20 11:06:38.321212+03');
INSERT INTO django_migrations VALUES (59, 'category', '0011_auto_20170320_0845', '2017-03-20 11:45:08.164789+03');
INSERT INTO django_migrations VALUES (60, 'profiles', '0002_auto_20170320_1333', '2017-03-20 20:45:23.861056+03');
INSERT INTO django_migrations VALUES (61, 'profiles', '0003_profile_email', '2017-03-20 20:45:23.878426+03');
INSERT INTO django_migrations VALUES (62, 'profiles', '0004_auto_20170320_1951', '2017-03-20 20:45:23.929479+03');
INSERT INTO django_migrations VALUES (63, 'profiles', '0005_auto_20170320_2003', '2017-03-20 20:45:23.989169+03');
INSERT INTO django_migrations VALUES (64, 'profiles', '0006_auto_20170320_2003', '2017-03-20 20:45:24.026893+03');
INSERT INTO django_migrations VALUES (65, 'profiles', '0007_profile_type', '2017-03-20 20:45:24.054327+03');
INSERT INTO django_migrations VALUES (66, 'profiles', '0008_remove_profile_type', '2017-03-20 20:45:24.072379+03');
INSERT INTO django_migrations VALUES (67, 'item', '0014_item_medium_image', '2017-03-20 22:57:14.377593+03');
INSERT INTO django_migrations VALUES (68, 'item', '0015_auto_20170320_1957', '2017-03-20 22:57:43.349689+03');
INSERT INTO django_migrations VALUES (69, 'item', '0016_item_brand', '2017-03-21 20:07:58.839543+03');
INSERT INTO django_migrations VALUES (70, 'delivery', '0003_auto_20170322_2025', '2017-03-22 23:45:39.839176+03');
INSERT INTO django_migrations VALUES (71, 'payment', '0003_auto_20170322_2026', '2017-03-22 23:45:39.858083+03');
INSERT INTO django_migrations VALUES (72, 'profiles', '0009_profile_phone', '2017-03-22 23:45:39.880064+03');
INSERT INTO django_migrations VALUES (73, 'delivery', '0004_auto_20170323_0917', '2017-03-23 12:26:50.184682+03');
INSERT INTO django_migrations VALUES (74, 'payment', '0004_auto_20170323_0917', '2017-03-23 12:26:50.20039+03');
INSERT INTO django_migrations VALUES (75, 'order', '0004_auto_20170323_0952', '2017-03-23 12:52:46.840073+03');
INSERT INTO django_migrations VALUES (76, 'cart', '0003_cartorder_order_id', '2017-03-23 13:44:48.511002+03');
INSERT INTO django_migrations VALUES (77, 'order', '0005_auto_20170323_1044', '2017-03-23 13:44:48.651485+03');
INSERT INTO django_migrations VALUES (78, 'order', '0006_auto_20170323_1048', '2017-03-23 13:48:05.279345+03');
INSERT INTO django_migrations VALUES (79, 'order', '0007_auto_20170323_1126', '2017-03-23 14:26:04.83613+03');
INSERT INTO django_migrations VALUES (80, 'order', '0008_userorder_email', '2017-03-23 14:29:12.774233+03');


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('django_migrations_id_seq', 80, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO django_session VALUES ('u8s2u1dxvbxrlwi909xdtta86t9gx6pj', 'YTFhNzIwODNhNmE4YjUxZjNlMzkzYmYzZjE5MzU2MGQ2ZDEzZGI1ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1M2U1ZmVmYTYxNDY1NjI1Yjg5Mzc0M2RmYzc5OTlhZmRkOGFkMmVlIn0=', '2017-04-01 15:46:40.807978+03');
INSERT INTO django_session VALUES ('qsvxc0qlp36mj7cijva7uezjzctpbfqs', 'YzRkNTJlNDM4OWRmMzBmNTRiY2U5YzRlY2FjYzZiMDU0NzNiY2M4ZTp7Il9hdXRoX3VzZXJfaWQiOiI5IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxYjBiYjU2MTQxZTc0YzIxNzJkNjQ5ZGJmMmVmNTY5ZTQwMTZjNzE4In0=', '2017-04-03 22:13:03.820316+03');
INSERT INTO django_session VALUES ('b6hz2m82g0o1k5xuid0qkiv2szpf19zs', 'YjY0MmRlZjIxNThmZGZmOGU2YTA1Yjg5ZTI0OWFlNDlmMTI0NWJmZDp7IkNBUlQiOnt9fQ==', '2017-04-06 14:29:23.779771+03');
INSERT INTO django_session VALUES ('gdkvq89yiqils6i8c4om1u69fl04uuib', 'NGE4OTViYjMyYjk5ZTk0NzQwMThkNTU1ZDcxZGM2MjdlZTZkMDU0MTp7Il9hdXRoX3VzZXJfaWQiOiIxMCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNjM5ZDg3ZjY1OTVlZWJmMTczODAyODA1N2U1OTM4N2E5ZTk3OGM0ZSJ9', '2017-04-03 22:13:57.211716+03');
INSERT INTO django_session VALUES ('ap3ef9pyf4jhd6mrb1r8vm7393lp2yjq', 'ZmM4NTI4MDMxOWVhODQ5NmNlMzk4NjU5N2E4YWJhZjFkY2ZmZjUxMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1M2U1ZmVmYTYxNDY1NjI1Yjg5Mzc0M2RmYzc5OTlhZmRkOGFkMmVlIiwiQ0FSVCI6e319', '2017-04-06 14:50:15.693522+03');
INSERT INTO django_session VALUES ('emx0rng9egm00m50duwppjecgorlqdsc', 'ODM3MGQwMDJmNTYwYzE4OTY5NGNkOGVhMzc5MjIwMjNiMTEyN2E2Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1M2U1ZmVmYTYxNDY1NjI1Yjg5Mzc0M2RmYzc5OTlhZmRkOGFkMmVlIiwiQ0FSVCI6eyIzMDI5Ijp7InByb2R1Y3RfcGsiOjMwMjksInF1YW50aXR5IjoxLCJwcmljZSI6IjI3In19fQ==', '2017-04-05 10:56:28.160359+03');


--
-- Data for Name: item_item; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO item_item VALUES (3828, 'Adidas Yeezy Boost 350 AQ4832 "Turtle Dove" (8, turtle/ grey/ white)', 'The YEEZY Boost 350 is Kanye West''s second model developed with adidas Originals. The limited-edition sneaker is exquisitely designed featuring beautiful yet simple materials. The forward combination of Primeknit, premium leathers, and full length BOOSTTM midsole into a moccasin style construction transcends current sneaker trends.', NULL, NULL, 5, 5000, 3, '51N4MNBVwvL.jpg', 'adidas-yeezy-boost-350-aq4832-turtle-dove-8-turtle-grey-white', 'B010ITVZ3I', 'Turtle/ Grey/ White', '51N4MNBVwvL.SL160.jpg', 'adidas');
INSERT INTO item_item VALUES (3829, 'Adidas Mens Yeezy Boost 350 Black Fabric', 'Men Yeezy Boost 350 Black Fabric US 12', NULL, NULL, 10, 3799, 3, '41pDdnfEpKL.jpg', 'adidas-mens-yeezy-boost-350-black-fabric', 'B018AVV1SU', 'Black', '41pDdnfEpKL.SL160.jpg', 'adidas');
INSERT INTO item_item VALUES (3830, 'Adidas Men Yeezy Boost 350- Limited stock Black Fabric US 11.5', 'Men Yeezy Boost 350 Black Fabric US 11.5', NULL, NULL, 8, 3399, 3, '415gTsPxWoL.jpg', 'adidas-men-yeezy-boost-350-limited-stock-black-fabric-us-115', 'B018AVV10I', 'Full Black', '415gTsPxWoL.SL160.jpg', 'adidas');
INSERT INTO item_item VALUES (3831, 'Adidas Yeezy Boost 350 - 8 "Moonrock" - AQ2660', 'adidas Yeezy Boost 350 MoonRock AQ2660', NULL, NULL, 12, 2615, 3, '41r2BFsDHhwL.jpg', 'adidas-yeezy-boost-350-8-moonrock-aq2660', 'B01849474I', 'Agagra/Moonrock', '41r2BFsDHhwL.SL160.jpg', 'adidas');
INSERT INTO item_item VALUES (3832, 'Adidas Mens Yeezy Boost 750 "Triple Black" Black/Cblack Suede Size 7', 'Adidas Mens Yeezy Boost 750 "Triple Black" Black/Cblack Suede Size 7', NULL, NULL, 11, 2550, 3, '41hpbaEm52L.jpg', 'adidas-mens-yeezy-boost-750-triple-black-blackcblack-suede-size-7', 'B019EAN7FQ', 'Black/Cblack', '41hpbaEm52L.SL160.jpg', 'adidas');
INSERT INTO item_item VALUES (3833, 'Adidas Mens Yeezy Boost 750 "Triple Black" Black/Cblack Suede Size 8', 'New in box with original receipt.', NULL, NULL, 4, 2162, 3, '41BATpgOhEL.jpg', 'adidas-mens-yeezy-boost-750-triple-black-blackcblack-suede-size-8', 'B019PDE864', 'Black', '41BATpgOhEL.SL160.jpg', 'adidas');
INSERT INTO item_item VALUES (3834, 'Adidas Mens Yeezy Boost 350 "Oxford Tan" Light Stone/Oxford Tan Fabric Size 5.5', 'Adidas Mens Yeezy Boost 350 "Oxford Tan" Light Stone/Oxford Tan Fabric Size 5.5', NULL, NULL, 15, 2096, 3, '51JFPKAeXuL.jpg', 'adidas-mens-yeezy-boost-350-oxford-tan-light-stoneoxford-tan-fabric-size-55', 'B01AV2BFJG', 'Light Stone/Oxford Tan', '51JFPKAeXuL.SL160.jpg', 'adidas');
INSERT INTO item_item VALUES (3837, 'adidas Yeezy 750 Boost Light Grey "Glow in the Dark" BB1840 (10 D(M) US)', 'THE YEEZY BOOST 750 IS KANYE WEST''S PREMIER FOOTWEAR MODEL DEVELOPED WITH ADIDAS ORIGINALS. THE SNEAKER IS EXQUISITELY DESIGNED FEATURING BEAUTIFUL YET SIMPLE MATERIALS. PREMIUM SUEDE AND A FULL LENGTH BOOSTTM MIDSOLE COMBINE TO CREATE THE YEEZY BOOST 750.', NULL, NULL, 18, 1635, 3, '41pV6EKyv9L.jpg', 'adidas-yeezy-750-boost-light-grey-glow-in-the-dark-bb1840-10-dm-us', 'B01GQRMUDK', 'Light Grey/Gum-Glow in the Dark', '41pV6EKyv9L.SL160.jpg', 'adidas');
INSERT INTO item_item VALUES (3838, 'Adidas Men''s Yeezy Boost 350, AGATE GRAY/MOONROCK/AGATE GRAY, 7.5 M US', 'Adidas Men''s Yeezy Boost 350, AGATE GRAY/MOONROCK/AGATE GRAY, 7.5 M US', NULL, NULL, 20, 1514, 3, '51HAc4FhMPL.jpg', 'adidas-mens-yeezy-boost-350-agate-graymoonrockagate-gray-75-m-us', 'B0182JZ0QE', 'Grey', '51HAc4FhMPL.SL160.jpg', 'adidas');
INSERT INTO item_item VALUES (3839, 'Adidas Ultra Boost - SNS - 8.5 "Tee Time" - AF5756', '', NULL, NULL, 3, 1380, 3, '419aNkoxfWL.jpg', 'adidas-ultra-boost-sns-85-tee-time-af5756', 'B06WWKX1PH', 'Black/White', '419aNkoxfWL.SL160.jpg', 'adidas');
INSERT INTO item_item VALUES (3840, 'Adidas Mens Yeezy Boost 350 V2 (5 D(M) US)', 'YEEZY BOOST 350 V2.', NULL, NULL, 14, 1365, 3, '41lmW0H7gL.jpg', 'adidas-mens-yeezy-boost-350-v2-5-dm-us', 'B06W2M2RWZ', 'Black', '41lmW0H7gL.SL160.jpg', 'adidas');
INSERT INTO item_item VALUES (3841, 'Adidas Mens Yeezy Boost 350 V2 "Beluga" Grey/Beluga-Solar Red Fabric Size 9.5', 'Back with another installment, Kanye has released version 2 of his renowned Yeezy Boost 350 collaboration with adidas. The Yeezy Boost 350 V2 features a color stripe and a new sleek enahnced design.', NULL, NULL, 17, 1277, 3, '41gcwnlYLL.jpg', 'adidas-mens-yeezy-boost-350-v2-beluga-greybeluga-solar-red-fabric-size-95', 'B01M17QMUW', 'Stegry/Beluga/Solred', '41gcwnlYLL.SL160.jpg', 'adidas');
INSERT INTO item_item VALUES (3842, 'adidas Men''s Team Crew Socks (Pack of 2), Vista Grey-Light Onix Marl/Semi Solar Yellow/Dark Grey - Base Green/Semi Solar Yellow/Dark Grey, One Size', 'The CAMO CREW 2-Pack sock is designed with the athlete in mind. Features anatomically shaped ''Left/Right'' foot bed to enhance natural movement of the foot as well as a cushioned foot bed to provide stability and comfort. ClimaLite construction wicks moisture. Extended arch compression zone and a ribbed leg provide the ultimate support.', NULL, NULL, 20, 1274, 3, '51fL6uLhxbL.jpg', 'adidas-mens-team-crew-socks-pack-of-2-vista-grey-light-onix-marlsemi-solar-yellowdark-grey-base-greensemi-solar-yellowdark-grey-one-size', 'B00LUN047U', 'Vista Grey-light Onix Marl/Semi Solar Yellow/Dark Grey - Base Green/Semi Solar Yellow/Dark Grey', '51fL6uLhxbL.SL160.jpg', 'adidas');
INSERT INTO item_item VALUES (3843, 'Nike Air Monarch IV Training Shoe (4E) - White/Black/Varsity Red, Size 11.5 US', 'Men''s Nike Air Monarch IV (4E) Training Shoe sets you up for comfortable training with durable leather on top for support. A lightweight foam midsole with a full-length encapsulated Air-Sole unit cushions every stride.', NULL, NULL, 6, 75, 3, '41PP5CMShjL.jpg', 'nike-air-monarch-iv-training-shoe-4e-whiteblackvarsity-red-size-115-us', 'B004WQARFG', 'White / Black / Varsity Red', '41PP5CMShjL.SL160.jpg', 'Nike');
INSERT INTO item_item VALUES (3844, 'Nike Mens Revolution 3 Running Shoes (8 D(M) US, University Red/Black/White/Metallic Silver)', 'Start the day on the right note by breaking a sweat in the Nike Revolution 3 running shoe..', NULL, NULL, 19, 59, 3, '41r41F2B7HNL.jpg', 'nike-mens-revolution-3-running-shoes-8-dm-us-university-redblackwhitemetallic-silver', 'B010OAPGMC', 'University Red/Black/White/Metallic Silver', '41r41F2B7HNL.SL160.jpg', 'Nike');
INSERT INTO item_item VALUES (3845, 'Nike Mens Free Rn Black/Black/Anthracite Running Shoe 11 Men US', 'Lightweight, breathable, and flexible, the Nike Free Run complements and encourages your natural running stride while keeping feet comfortable all day long..', NULL, NULL, 19, 98, 3, '41SYt3Ah2BaL.jpg', 'nike-mens-free-rn-blackblackanthracite-running-shoe-11-men-us', 'B01GADULSQ', 'Black/Black-anthracite', '41SYt3Ah2BaL.SL160.jpg', 'Nike');
INSERT INTO item_item VALUES (3846, 'Nike Air Max 2017 Running Shoe', 'Fashion And New Nike Air Max 2017 Running Shoe', NULL, NULL, 18, 23, 3, '41bchgcdowL.jpg', 'nike-air-max-2017-running-shoe', 'B06XFTC7TL', 'Black Orange', '41bchgcdowL.SL160.jpg', 'Nike  ');
INSERT INTO item_item VALUES (3847, 'Nike Air Max 2017', 'New fashion and Nike Air Max 2017 shoes', NULL, NULL, 19, 23, 3, '414MApoWzjL.jpg', 'nike-air-max-2017', 'B06XDN63JR', 'Blue Gray Shoes', '414MApoWzjL.SL160.jpg', 'Nike ');
INSERT INTO item_item VALUES (3848, 'Nike Men''s Sb Dunk Low Pro Legion Green/legion Green Skate Shoe (6)', 'Nike Men''s SB Zoom Dunk Low Pro, LEGION GREEN/LEGION GREEN, 6 M US', NULL, NULL, 18, 89, 3, '41DkMmSHLPL.jpg', 'nike-mens-sb-dunk-low-pro-legion-greenlegion-green-skate-shoe-6', 'B01NATF7QQ', 'Legion Green/Legion Green', '41DkMmSHLPL.SL160.jpg', 'Nike');
INSERT INTO item_item VALUES (3835, 'AQ2661 MEN YEEZY BOOST 350 ADIDAS LGTSTO/OXFTAN/LGTSTO', 'YEEZY BOOST 350.', NULL, NULL, 10, 1972, 3, '51JFPKAeXuL.jpg', 'aq2661-men-yeezy-boost-350-adidas-lgtstooxftanlgtsto', 'B01AV2BAFK', 'LGTSTO/OXFTAN/LGTSTO', '51JFPKAeXuL.SL160.jpg', 'adidas');
INSERT INTO item_item VALUES (3836, 'Adidas Mens Yeezy Boost 350 "2016 Pirate Black" Black/Grey-Red Fabric Size 9', 'Adidas Mens Yeezy Boost 350 "2016 Pirate Black" Black/Grey-Red Fabric Size 9', NULL, NULL, 7, 1815, 3, '51RSyJteXrL.jpg', 'adidas-mens-yeezy-boost-350-2016-pirate-black-blackgrey-red-fabric-size-9', 'B01BZ9NXS0', 'Black/Grey-red', '51RSyJteXrL.SL160.jpg', 'adidas');
INSERT INTO item_item VALUES (3850, 'Nike Men''s Free 5.0+ Breathe Running Black / Metallic Dark Grey / White Synthetic Shoe - 10 D(M) US', 'The Nike Free 5.0+ Men''s Running Shoe provides the foot strengthening benefits of natural motion, along with the cushioning, traction and underfoot protection of a traditional shoe..', NULL, NULL, 18, 78, 3, '416yuIyKOL.jpg', 'nike-mens-free-50-breathe-running-black-metallic-dark-grey-white-synthetic-shoe-10-dm-us', 'B0098G8EN2', 'Black / Metallic Dark Grey / White', '416yuIyKOL.SL160.jpg', 'Nike');
INSERT INTO item_item VALUES (3851, 'Nike Mens FS Lite Run 3 Running Shoe Black/White 10.5 D(M) US', 'Turn up the heat on the street in the explosive performance of the Nike FS Lite Run 3 running shoe!.', NULL, NULL, 7, 69, 3, '41DSeEi8lHL.jpg', 'nike-mens-fs-lite-run-3-running-shoe-blackwhite-105-dm-us', 'B00V3WXVBE', 'Black/White', '41DSeEi8lHL.SL160.jpg', 'Nike');
INSERT INTO item_item VALUES (3852, 'Nike Mens Air Max Dynasty Prem Running Shoe (12 D(M) US, Black/Metallic Cool Gray/Electric Green/Photo Blue)', 'NIKE AIRMAX DYNASTY PE#829711-007', NULL, NULL, 20, 73, 3, '51WX5IBLarL.jpg', 'nike-mens-air-max-dynasty-prem-running-shoe-12-dm-us-blackmetallic-cool-grayelectric-greenphoto-blue', 'B019DMQXA6', 'Black/Metallic Cool Gray/Electric Green/Photo Blue', '51WX5IBLarL.SL160.jpg', 'Nike');
INSERT INTO item_item VALUES (3853, 'Nike Air Jordan Academy Mens Hi Top Trainers 844515 Sneakers Shoes (US 9.5, black anthracite gum medium brown 011)', 'Nike Mens JORDAN ACADEMY, BLACK/ANTHRACITE-GUM MED BROWN, 9.5', NULL, NULL, 12, 79, 3, '51Q6ae63ikL.jpg', 'nike-air-jordan-academy-mens-hi-top-trainers-844515-sneakers-shoes-us-95-black-anthracite-gum-medium-brown-011', 'B01M0CLZMM', 'Black', '51Q6ae63ikL.SL160.jpg', 'Nike');
INSERT INTO item_item VALUES (3854, 'Nike Men''s Downshifter 7 Black/Mtlc Hematite/Anthracite Running Shoe 10 Men US', 'Break into new habits one mile at a time in the Nike Downshifter 7 running shoe..', NULL, NULL, 2, 82, 3, '41kcYPmh2B5L.jpg', 'nike-mens-downshifter-7-blackmtlc-hematiteanthracite-running-shoe-10-men-us', 'B01H4XAKJG', 'Black/Mtlc Hematite/Anthracite', '41kcYPmh2B5L.SL160.jpg', 'Nike');
INSERT INTO item_item VALUES (3855, 'Nike Mens Free Rn Flyknit Running Shoe White/Black 13 D(M) US', 'Blending a sock-like fit and the foot-strengthening benefits of barefoot running, the Nike Free Flyknit+ promises to deliver a running experience like no other. The comfortable one-piece upper offers a smooth, seamless design and features Flyknit technology that wraps the foot for a secured fit, reducing foot slippage. The FREE Flyknit offers a truly revolutionary fit..', NULL, NULL, 12, 159, 3, '51hLOhpYaWL.jpg', 'nike-mens-free-rn-flyknit-running-shoe-whiteblack-13-dm-us', 'B01FIKJ944', 'White/Black', '51hLOhpYaWL.SL160.jpg', 'Nike');
INSERT INTO item_item VALUES (3856, 'Nike Men''s FS Lite Run 4 Black/Mtlc Cool Grey/Cool Grey Running Shoe 9 Men US', 'Turn up the heat on the street in the explosive performance of the Nike FS Lite Run 4 running shoe!.', NULL, NULL, 1, 63, 3, '4108F4aR2BzL.jpg', 'nike-mens-fs-lite-run-4-blackmtlc-cool-greycool-grey-running-shoe-9-men-us', 'B01NH7LYD0', 'Black/Mtlc Cool Grey/Cool Grey', '4108F4aR2BzL.SL160.jpg', 'Nike');
INSERT INTO item_item VALUES (3857, 'Vans Adult Authentic Core Classics, Black/Black, 8', 'Vans keeps it classic with the Authentic skate shoes. This skate-inspired low-top shoe will add that perfect touch of casual cool to any outfit..', NULL, NULL, 12, 33, 3, '41AFxW2BDXpL.jpg', 'vans-adult-authentic-core-classics-blackblack-8', 'B0011XC594', 'Black/Black', '41AFxW2BDXpL.SL160.jpg', 'Vans');
INSERT INTO item_item VALUES (3858, 'Vans Unisex Classic Slip-On (Rainbow Geo) True White Skate Shoe 6.5 Men US / 8 Women US', 'The shoe that started it all. The iconic Vans Classic Slip-On keeps it simple and classic..', NULL, NULL, 10, 59, 3, '31M9zBtrwLL.jpg', 'vans-unisex-classic-slip-on-rainbow-geo-true-white-skate-shoe-65-men-us-8-women-us', 'B01I2I42Q4', 'True White', '31M9zBtrwLL.SL160.jpg', 'Vans');
INSERT INTO item_item VALUES (3859, 'Vans Men''s Chukka Low (Oxford) Black/Gum Skate Shoe 8.5 Men US', 'Designed by the Vans skate team, the Chukka Low blends the classic skate style of the Authentic with the timeless style of the chukka boot..', NULL, NULL, 20, 64, 3, '41ZT8Hbh6oL.jpg', 'vans-mens-chukka-low-oxford-blackgum-skate-shoe-85-men-us', 'B01I0L0OFQ', 'Black/Gum', '41ZT8Hbh6oL.SL160.jpg', 'Vans');
INSERT INTO item_item VALUES (3860, 'Vans Unisex Old Skool Black/White Skate Shoe 6.5 Men US / 8 Women US', 'Old Skool lives on! A skate classic from Vans, the Old Skool represents timeless skate style with durability that keeps on giving. Features a synthetic upper, signature side stripe, and padded tongue and collar for comfort and protection..', NULL, NULL, 8, 49, 3, '415KP18CK5L.jpg', 'vans-unisex-old-skool-blackwhite-skate-shoe-65-men-us-8-women-us', 'B000R3WC9W', 'Black/White', '415KP18CK5L.SL160.jpg', 'Vans');
INSERT INTO item_item VALUES (3861, 'Vans Men''s Atwood (Canvas) Pewter/White Skate Shoe 9.5 Men US', 'Keep your style looking fresh in the Atwood skate shoes by Vans. This skate-inspired low-top shoe will add that perfect touch of casual cool to any outfit..', NULL, NULL, 13, 44, 3, '419bOwFbC9L.jpg', 'vans-mens-atwood-canvas-pewterwhite-skate-shoe-95-men-us', 'B00K5OWXRY', 'Pewter/White', '419bOwFbC9L.SL160.jpg', 'Vans');
INSERT INTO item_item VALUES (3862, 'Vans Era Skate Shoes - navy 9.5', 'Some things remain constant. The Era from Vans, with its clean an uncomplicated style, is one of them..', NULL, NULL, 19, 39, 3, '41qZ5AajQL.jpg', 'vans-era-skate-shoes-navy-95', 'B001CEQNH2', 'Navy', '41qZ5AajQL.SL160.jpg', 'Vans');
INSERT INTO item_item VALUES (3863, 'Vans Authentic Mens Trainers (12 B(M) US Women / 10.5 D(M) US Men, Black/Black)', 'Vans Mens Authentic Core Classic Sneakers', NULL, NULL, 1, 44, 3, '31L4mCEBLTL.jpg', 'vans-authentic-mens-trainers-12-bm-us-women-105-dm-us-men-blackblack', 'B01LKZKY3Q', 'Black/Black', '31L4mCEBLTL.SL160.jpg', 'Vans');
INSERT INTO item_item VALUES (3864, 'Vans Unisex Classic Slip-On Metallic Silver Skate Shoe 7.5 Men US / 9 Women US', 'The Metallic Classic Slip-On features low profile slip-on uppers made with metallic leather, padded collars, elastic side accents, and signature rubber waffle outsoles', NULL, NULL, 15, 59, 3, '316wvBUiMmL.jpg', 'vans-unisex-classic-slip-on-metallic-silver-skate-shoe-75-men-us-9-women-us', 'B01JJCQHG0', '(Metallic) Silver/White', '316wvBUiMmL.SL160.jpg', 'Vans');
INSERT INTO item_item VALUES (3865, 'Vans Unisex SK8-Hi Black/White Mens 6, Womens 7.5', 'Vans Unisex SK8-Hi Black/White Mens 6, Womens 7.5', NULL, NULL, 12, 65, 3, '41CrtWtxaL.jpg', 'vans-unisex-sk8-hi-blackwhite-mens-6-womens-75', 'B01MTPNG0L', 'Black/Black/White Canvas', '41CrtWtxaL.SL160.jpg', 'Vans');
INSERT INTO item_item VALUES (3866, 'Vans Men''s Kyle Walker Pro Skateboarding Shoes Black/Blue Fog 12 D(M) US', 'Kyle Walker has his first signature shoe and we couldn''t be more excited. More than anything, this shoe is a glimpse into the future of Vans.', NULL, NULL, 2, 75, 3, '41uN2A5c3L.jpg', 'vans-mens-kyle-walker-pro-skateboarding-shoes-blackblue-fog-12-dm-us', 'B01I0HQJLS', 'Black/Blue Fog', '41uN2A5c3L.SL160.jpg', 'Vans');
INSERT INTO item_item VALUES (3867, 'Vans Unisex Authentic Black/Rubber Skate Shoe 5.5 Men US / 7 Women US', 'Vans keeps it classic with the Authentic skate shoes..', NULL, NULL, 6, 36, 3, '41QAy6iZlnL.jpg', 'vans-unisex-authentic-blackrubber-skate-shoe-55-men-us-7-women-us', 'B00AM4JE60', 'Black/Rubber', '41QAy6iZlnL.SL160.jpg', 'Vans');
INSERT INTO item_item VALUES (3868, 'Vans Men''s Chukka Low (10 Oz. Canvas) Black/White Skate Shoe 12', 'Find an optimal balance between performance and construction in the Vans Chukka Low..', NULL, NULL, 8, 94, 3, '41gU82BynmL.jpg', 'vans-mens-chukka-low-10-oz-canvas-blackwhite-skate-shoe-12', 'B01I0KQPDW', 'Black/White', '41gU82BynmL.SL160.jpg', 'Vans');
INSERT INTO item_item VALUES (3869, 'Vans Primary Mono AUTHENTIC mens skateboarding-shoes VN-A38EMMQA_10 - Red/Silver', 'The Primary Mono Authentic combines the original and now iconic Vans low top style with sturdy canvas uppers, metal eyelets, and signature rubber waffle outsoles.', NULL, NULL, 16, 49, 3, '31UpmrLoXrL.jpg', 'vans-primary-mono-authentic-mens-skateboarding-shoes-vn-a38emmqa_10-redsilver', 'B01I2B2ZEW', 'Red/Silver', '31UpmrLoXrL.SL160.jpg', 'Vans');
INSERT INTO item_item VALUES (3871, 'Fred Perry Men''s Twin Tipped Shirt-M3600, Blood/White/Carbon Blue, X-Large', 'The modern twin-tipped Fred Perry shirt. Made in inconic colourway in a cotton pique. Twin tipped collar and cuff, complete with a two button placket and straight hem at the waist.', NULL, NULL, 6, 85, 4, '410FuLB2B5KL.jpg', 'fred-perry-mens-twin-tipped-shirt-m3600-bloodwhitecarbon-blue-x-large', 'B01NBP518S', 'Blood/White/Carbon Blue', '410FuLB2B5KL.SL160.jpg', 'Fred Perry');
INSERT INTO item_item VALUES (3872, 'Fred Perry Men''s Twin Tipped Polo Shirt-M1200, BLACK/PORC/PORCE, Medium', 'Twin tipped polo shirt', NULL, NULL, 2, 76, 4, '41NT2p2B7zL.jpg', 'fred-perry-mens-twin-tipped-polo-shirt-m1200-blackporcporce-medium', 'B003TV487S', 'Black/Porc/Porce', '41NT2p2B7zL.SL160.jpg', 'Fred Perry');
INSERT INTO item_item VALUES (3873, 'Fred Perry Men''s Camouflage Pique Shirt, Twill, X-Small', 'Our original Fred Perry twin tipped shirt has been reinterpreted with our subcultural roots. Applying a British disruptive pattern camouflage print to the body and sleeve to our classic pique shirt', NULL, NULL, 9, 125, 4, '51a18T7rQDL.jpg', 'fred-perry-mens-camouflage-pique-shirt-twill-x-small', 'B01N9MAVQX', 'Twill', '51a18T7rQDL.SL160.jpg', 'Fred Perry');
INSERT INTO item_item VALUES (3874, 'Fred Perry Men''s Plain Shirt, Glacier, X-Large', 'The one-color Fred Perry shirt; designed in-line with the original tennis shirts worn by Fred in the 50s. The M6000 was designed with a focus on lightweight functionality. Cut with a slim silhouette and definitive two-button placket made in our regular cotton pique. No extras, just the laurel wreath at the chest.', NULL, NULL, 8, 85, 4, '41poxxvhL3L.jpg', 'fred-perry-mens-plain-shirt-glacier-x-large', 'B01MT3R0SR', 'Glacier', '41poxxvhL3L.SL160.jpg', 'Fred Perry');
INSERT INTO item_item VALUES (3875, 'Fred Perry Men''s Twin Tipped Polo Shirt, Steel Marl/Black, Medium', 'The twin tipped shirt was the first piece to carry our legendary 5-4-4 tipping, and it remains at the core of everything we do. It comes with a history, and each new generation adds to its legacy. The m3600 has our trademark twin tipping running across the collar and cuffs. Made from soft cotton pique in a series of iconic colourways, it features the definitive two-button placket and embroidered laurel wreath.', NULL, NULL, 9, 85, 4, '51JC2BpW2M9L.jpg', 'fred-perry-mens-twin-tipped-polo-shirt-steel-marlblack-medium', 'B01MFE3VGC', 'Steel Marl/Black', '51JC2BpW2M9L.SL160.jpg', 'Fred Perry');
INSERT INTO item_item VALUES (3876, 'Fred Perry Men''s Tramline Tipped Pique Shirt, French Navy, X-Large', 'Our classic cotton pique shirt with a slight variation to the stripe. Made in new colorways for the season, this version is constructed in our classic pique. Detailing includes our trademark two-button placket, with a bomber stripe added to the inside of the back-neck', NULL, NULL, 12, 95, 4, '41mOpg08tgL.jpg', 'fred-perry-mens-tramline-tipped-pique-shirt-french-navy-x-large', 'B01M737KSB', 'French Navy', '41mOpg08tgL.SL160.jpg', 'Fred Perry');
INSERT INTO item_item VALUES (3877, 'Fred Perry Men''s Colour Block Pique Shirt, White, X-Large', 'Our classic cotton pique shirt with a contrast collar and cuff. Made in new colourway for the season, this version is constructed in the same oxford weave as our woven shirt. Detailing includes our trademark two-button packet with a bomber stripe added to the inside of the back-neck.', NULL, NULL, 13, 95, 4, '41scyK9sZEL.jpg', 'fred-perry-mens-colour-block-pique-shirt-white-x-large', 'B01MT3KD7W', 'White', '41scyK9sZEL.SL160.jpg', 'Fred Perry');
INSERT INTO item_item VALUES (3878, 'Fred Perry Slim Fit Twin Tipped Polo Shirt Navy & White XL', 'Give your off-duty look a true British flavour with a Fred Perry polo shirt.', NULL, NULL, 7, 68, 4, '41Xh891wVDL.jpg', 'fred-perry-slim-fit-twin-tipped-polo-shirt-navy-white-xl', 'B01L9E7TK4', 'Navy & White', '41Xh891wVDL.SL160.jpg', 'Fred Perry');
INSERT INTO item_item VALUES (3879, 'Fred Perry Men''s Slim Fit Plain Shirt, Navy, Small', 'Fred Perry Slim Fit Shirt Mens', NULL, NULL, 9, 56, 4, '314VF0qpdL.jpg', 'fred-perry-mens-slim-fit-plain-shirt-navy-small', 'B0059LG6NK', 'Navy', '314VF0qpdL.SL160.jpg', 'Fred Perry');
INSERT INTO item_item VALUES (3880, 'Fred Perry Men''s Silver Blue Tramline Polo Shirt XXL', 'Fred Perry men''s silver blue tramline polo shirt. Complete with Fred Perry Laurel Wreath embroidered on chest and two buttoned placket. Textured tramline tipping on collar and cuffs. Made from 100% cotton.', NULL, NULL, 5, 74, 4, '41hwevdPkkL.jpg', 'fred-perry-mens-silver-blue-tramline-polo-shirt-xxl', 'B06XDNQB4W', 'Blue', '41hwevdPkkL.SL160.jpg', 'Fred Perry');
INSERT INTO item_item VALUES (3881, 'Fred Perry Men''s Long Sleeve Tipped Slim Fit Pique Polo Shirt, Hunting Black/Green Oxford/White/Black, Large', 'The long-sleeve twin-tipped Fred Perry shirt. Made from a combed cotton pique with our trademark 5-4-4 twin-tipping at the collar, and definitive two-button placket. Signed off with our laurel wreath embroidery at the chest.', NULL, NULL, 1, 54, 4, '41kVZxapbdL.jpg', 'fred-perry-mens-long-sleeve-tipped-slim-fit-pique-polo-shirt-hunting-blackgreen-oxfordwhiteblack-large', 'B01F3ELS80', 'Hunting Black/Green Oxford/White/Black', '41kVZxapbdL.SL160.jpg', 'Fred Perry');
INSERT INTO item_item VALUES (3882, 'Fred Perry Men''s Fine Shirt, White/Ivy Stripe, Large', 'A jersey cotton fine stripe polo done in our classic body, lightweight and breathable. Perfect as a layering item or all by itself.', NULL, NULL, 8, 51, 4, '511NAZoLytL.jpg', 'fred-perry-mens-fine-shirt-whiteivy-stripe-large', 'B01AOQX20Y', 'White/Ivy Stripe', '511NAZoLytL.SL160.jpg', 'Fred Perry');
INSERT INTO item_item VALUES (3883, 'Fred Perry Men''s Tipped Knitted Polo Shirt Clay XXL', 'Originally designed to bridge sports and leisurewear in the ''60s, the Fred Perry knitted polo shirt will keep you looking smart during downtime.', NULL, NULL, 12, 86, 4, '41cYPnSJlCL.jpg', 'fred-perry-mens-tipped-knitted-polo-shirt-clay-xxl', 'B06VWBBYRS', 'Clay', '41cYPnSJlCL.SL160.jpg', 'Fred Perry');
INSERT INTO item_item VALUES (3884, 'Fred Perry Men''s Plain Polo, White/Navy, Large', 'Plain polo shirt', NULL, NULL, 17, 85, 4, '41xxSWSzogL.jpg', 'fred-perry-mens-plain-polo-whitenavy-large', 'B0026OL71E', 'White', '41xxSWSzogL.SL160.jpg', 'Fred Perry');
INSERT INTO item_item VALUES (3885, 'Fred Perry Men''s Blue Colour Block Shirt Blue Marl Polo Shirt LG', 'Cotton pique polo shirt sports color blocking pieced throughout. Striped rib trim featured at fold-over collar and sleeves. Short sleeves. Straight back yoke. Button-front placket. Signature embroidery at left chest pocket. Straight hemline. 100% cotton. Machine wash cold, hang dry.', NULL, NULL, 2, 77, 4, '414fciowdL.jpg', 'fred-perry-mens-blue-colour-block-shirt-blue-marl-polo-shirt-lg', 'B01ALIL53G', 'Blue Marl', '414fciowdL.SL160.jpg', 'Fred Perry');
INSERT INTO item_item VALUES (3886, 'Van Heusen Men''s Poplin Regular Fit Solid Point Collar Dress Shirt, White, 16.5" Neck 34"-35" Sleeve', 'Regular fit poplin dress shirt', NULL, NULL, 14, 24, 4, '31xhCjYXsUL.jpg', 'van-heusen-mens-poplin-regular-fit-solid-point-collar-dress-shirt-white-165-neck-34-35-sleeve', 'B009ESZFFO', 'White', '31xhCjYXsUL.SL160.jpg', 'Van Heusen');
INSERT INTO item_item VALUES (3887, 'Van Heusen Men''s Herringbone Regular Fit Solid Spread Collar Dress Shirt, Peach Glaze, 17" Neck 36"-37" Sleeve', 'Long sleeve blend fabric dress shirt for durability and a clean crisp finish', NULL, NULL, 4, 26, 4, '411TddBWdL.jpg', 'van-heusen-mens-herringbone-regular-fit-solid-spread-collar-dress-shirt-peach-glaze-17-neck-36-37-sleeve', 'B01MT13KEJ', 'Peach Glaze', '411TddBWdL.SL160.jpg', 'Van Heusen');
INSERT INTO item_item VALUES (3888, 'Van Heusen Men''s Poplin Fitted Solid Point Collar Dress Shirt, White, 17.5" Neck 34"-35" Sleeve', 'Van heusen white fitted poplin dress shirt', NULL, NULL, 18, 19, 4, '310H0hqbbPL.jpg', 'van-heusen-mens-poplin-fitted-solid-point-collar-dress-shirt-white-175-neck-34-35-sleeve', 'B00BM48FP0', 'White', '310H0hqbbPL.SL160.jpg', 'Van Heusen');
INSERT INTO item_item VALUES (3889, 'Van Heusen Men''s Short Sleeve Oxford Dress Shirt, White, Medium', 'Van Heusen Men''s Short Sleeve Oxford Dress Shirt Alpha Sized', NULL, NULL, 5, 18, 4, '31Y32BAorKXL.jpg', 'van-heusen-mens-short-sleeve-oxford-dress-shirt-white-medium', 'B000PHG4US', 'White', '31Y32BAorKXL.SL160.jpg', 'Van Heusen');
INSERT INTO item_item VALUES (3890, 'Van Heusen Men''s Pinpoint Regular Fit Solid Button Down Collar Dress Shirt, White, 17" Neck 34"-35" Sleeve', 'Pinpoint solid', NULL, NULL, 4, 26, 4, '31uEpB84lrL.jpg', 'van-heusen-mens-pinpoint-regular-fit-solid-button-down-collar-dress-shirt-white-17-neck-34-35-sleeve', 'B009AYMEE2', 'White', '31uEpB84lrL.SL160.jpg', 'Van Heusen');
INSERT INTO item_item VALUES (3891, 'Van Heusen Men''s Big and Tall Printed Rayon Short Sleeve Shirt, Black, 3X-Large Tall', 'Perfect shirt to pack for your next trip. Can be worn during your journey or when you go for a run after you''ve arrived', NULL, NULL, 3, 29, 4, '41fTdTDp9gL.jpg', 'van-heusen-mens-big-and-tall-printed-rayon-short-sleeve-shirt-black-3x-large-tall', 'B01LZK4O1A', 'Black', '41fTdTDp9gL.SL160.jpg', 'Van Heusen');
INSERT INTO item_item VALUES (3892, 'Van Heusen Men''s Lux Sateen Regular Fit Solid Spread Collar Dress Shirt, Hyacinth, 18.5" Neck 34"-35" Sleeve', 'Long sleeve blend fabric dress shirt for durability and a clean crisp finish', NULL, NULL, 10, 26, 4, '41HIL3YZL.jpg', 'van-heusen-mens-lux-sateen-regular-fit-solid-spread-collar-dress-shirt-hyacinth-185-neck-34-35-sleeve', 'B01NBMNFRP', 'Hyacinth', '41HIL3YZL.SL160.jpg', 'Van Heusen');
INSERT INTO item_item VALUES (3893, 'Van Heusen Men''s Flex Collar Regular Fit Solid Spread Collar Dress Shirt, White, 17.5" Neck 36"-37" Sleeve', 'Van Heusen regular fit flex collar long sleeve dress shirt', NULL, NULL, 8, 25, 4, '412BauktxulL.jpg', 'van-heusen-mens-flex-collar-regular-fit-solid-spread-collar-dress-shirt-white-175-neck-36-37-sleeve', 'B01709A1IO', 'White', '412BauktxulL.SL160.jpg', 'Van Heusen');
INSERT INTO item_item VALUES (3894, 'Van Heusen Men''s Pinpoint Regular Fit Stripe Button Down Collar Dress Shirt, Blue, 17.5" Neck 34"-35" Sleeve', 'Regular Fit Pinpoint Dress Shirt', NULL, NULL, 17, 22, 4, '51TrRxxljzL.jpg', 'van-heusen-mens-pinpoint-regular-fit-stripe-button-down-collar-dress-shirt-blue-175-neck-34-35-sleeve', 'B00D1SQBSI', 'Blue', '51TrRxxljzL.SL160.jpg', 'Van Heusen');
INSERT INTO item_item VALUES (3895, 'Van Heusen Men''s Long Sleeve Oxford Dress Shirt, Blue, Small', 'Van Heusen Men''s Long Sleeve Oxford Dress Shirt Alpha Sized', NULL, NULL, 18, 10, 4, '310N4Q2BCQjL.jpg', 'van-heusen-mens-long-sleeve-oxford-dress-shirt-blue-small', 'B000PHG4G2', 'Blue', '310N4Q2BCQjL.SL160.jpg', 'Van Heusen');
INSERT INTO item_item VALUES (3896, 'Van Heusen Men''s Big and Tall Flex Stretch Short Sleeve Non Iron Shirt, Faded Cadet, 2X-Large', 'Can be worn with a blazer and dress pant or more casually with collar open and a pair of jeans or shorts.', NULL, NULL, 6, 29, 4, '51VskMzMr0L.jpg', 'van-heusen-mens-big-and-tall-flex-stretch-short-sleeve-non-iron-shirt-faded-cadet-2x-large', 'B01LXLTYQN', 'Faded Cadet', '51VskMzMr0L.SL160.jpg', 'Van Heusen');
INSERT INTO item_item VALUES (3897, 'Van Heusen Men''s Short Sleeve Feeder Stripe Polo Shirt, Mirage Gray, X-Large', 'Micro stripe upper body and collar with solid sleeves and lower body', NULL, NULL, 14, 7, 4, '41iesWjyhoL.jpg', 'van-heusen-mens-short-sleeve-feeder-stripe-polo-shirt-mirage-gray-x-large', 'B01LYC12PT', 'Mirage Gray', '41iesWjyhoL.SL160.jpg', 'Van Heusen');
INSERT INTO item_item VALUES (3898, 'Van Heusen Mens Aviator Pilot Shirt - Short Sleeve - 16 1/2', 'The Van Heusen Aviator is a classic professional pilot shirt worn by more commercial pilots than any other shirt. Its affordability makes it an unbeatable choice for crewmembers.  Made with 65% wrinkle free polyester and 35% combed cotton, this military weight poplin fabric looks great and is easy to care for and launder. Two flap pockets with a pen slot, and tuck in tails make this an easy to wear professional pilot shirt. The Aviator Pilot Shirt will more than meet your expectations!', NULL, NULL, 12, 23, 4, '41UeGUCYJ6L.jpg', 'van-heusen-mens-aviator-pilot-shirt-short-sleeve-16-12', 'B005CQRA1O', 'White', '41UeGUCYJ6L.SL160.jpg', 'Van Heusen');
INSERT INTO item_item VALUES (3899, 'Van Heusen Men''s Twill Dress Shirt, Black, XX-Large', 'Van Heusen Men''s Long Sleeve Twill Dress Shirt Alpha Sized', NULL, NULL, 2, 18, 4, '31EUP3QAKUL.jpg', 'van-heusen-mens-twill-dress-shirt-black-xx-large', 'B004OWJE4S', 'Black', '31EUP3QAKUL.SL160.jpg', 'Van Heusen');
INSERT INTO item_item VALUES (3900, 'Van Heusen Men''s Long-Sleeve Oxford Dress Shirt, White, 16.5" Neck 34"-35" Sleeve', 'Van Heusen men''s oxford dress shirt numeric sized', NULL, NULL, 18, 2, 4, '31ISPbe2yfL.jpg', 'van-heusen-mens-long-sleeve-oxford-dress-shirt-white-165-neck-34-35-sleeve', 'B00J9XAJI2', 'White', '31ISPbe2yfL.SL160.jpg', 'Van Heusen');
INSERT INTO item_item VALUES (3901, 'Colgate Supreme Inspired T Shirt L White', 'This T Shirt is pre-shrunk and pre-washed. We use 100% cotton t-shirts. All of our shirts are custom-made for you, and made in North America.', NULL, NULL, 4, 19, 4, '31OzsPtFbL.jpg', 'colgate-supreme-inspired-t-shirt-l-white', 'B06XNT3WHD', 'White', '31OzsPtFbL.SL160.jpg', 'Tee So Dope');
INSERT INTO item_item VALUES (3902, 'Supreme Icon Unisex T-Shirt S White', '', NULL, NULL, 2, 5, 4, '31tH13YpPNL.jpg', 'supreme-icon-unisex-t-shirt-s-white', 'B01MQF7XW3', 'Small', '31tH13YpPNL.SL160.jpg', 'Final Exchange');
INSERT INTO item_item VALUES (3903, 'O''Neill Men''s Supreme Long Sleeve T-Shirt, Navy, Large', 'The O''Neill men''s supreme l/s is a premium fit cotton long sleeved tee with soft hand reverse screen-print.', NULL, NULL, 12, 2, 4, '41CPmWRCs2BL.jpg', 'oneill-mens-supreme-long-sleeve-t-shirt-navy-large', 'B01GX28P82', 'Navy', '41CPmWRCs2BL.SL160.jpg', 'O''Neill');
INSERT INTO item_item VALUES (3904, 'Supreme Logo Red Box Medium Mens T-Shirt', 'In order to provide best service - we exceptionally decided to make t-shirts and sweatshirts. This allows to concentrate our attenton for the best price/quality deal for consumer. 100% cotton t-shirts and sweatshirts (80% cotton, 20% polyester), do not couse sweating, more than 5 times durable compared to other t-shirt made from whool or mohair. We appreciate your choice. We maintain high standards of excellence and strive for 100% customer satisfaction! Feedback is very important to us. We request that you contact us immediately BEFORE you give us neutral or negative feedback, so that we can satisfactorily address your concerns. It is impossible to address issues if we do not know about them!', NULL, NULL, 16, 7, 4, '41Uhdr30TbL.jpg', 'supreme-logo-red-box-medium-mens-t-shirt', 'B01LT2Y8KU', 'White', '41Uhdr30TbL.SL160.jpg', 'Angry Deer');
INSERT INTO item_item VALUES (3905, 'Polo Ralph Lauren Supreme Comfort T-Shirt 2-Pack, M, White', 'Superior comfort, classic fit crew neck T-shirt, High quality, lustrous pima cotton and modal. Super-soft lightweight fabric moves with you, Save with this 2-pack deal. Polo Ralph Lauren, Style Number: L036.', NULL, NULL, 2, 29, 4, '31FNkp0Y6TL.jpg', 'polo-ralph-lauren-supreme-comfort-t-shirt-2-pack-m-white', 'B00NQW7V8S', 'White', '31FNkp0Y6TL.SL160.jpg', 'Polo Ralph Lauren');
INSERT INTO item_item VALUES (3906, 'Powell-Peralta Supreme T-Shirt (Large, Black)', 'Powell-Peralta Supreme T-Shirt Large Black', NULL, NULL, 8, 20, 4, '41HSTX0alVL.jpg', 'powell-peralta-supreme-t-shirt-large-black', 'B005NH9LHI', 'Black', '41HSTX0alVL.SL160.jpg', 'Powell-Peralta');
INSERT INTO item_item VALUES (3922, 'New The North Face Men''s Gordon Lyons Full-Zip Jacket Asphalt Grey Heather Medium', 'The North Face Gordon Lyons Full Zip is perfect for all of your fall and winter outings. It is made of 100 percent polyester sweater fleece for a look and feel you can''t resist. The Gordon Lyons features a relaxed fit, brushed back, reverse-coil center front zip, secure-zip chest pockets and hand pockets. For all-day comfort, check out The North Face Gordon Lyons Full Zip.Specs:Fit: Loose Warmth: Warm Waterproofing: Low Breathability: Moderate Insulation Type: n/a Insulation Weight: n/a', NULL, NULL, 3, 88, 5, '51AI2kv2B2mL.jpg', 'new-the-north-face-mens-gordon-lyons-full-zip-jacket-asphalt-grey-heather-medium', 'B00PKXOSIM', 'Asphalt Grey Heather', '51AI2kv2B2mL.SL160.jpg', 'The North Face');
INSERT INTO item_item VALUES (3907, 'Leather Supreme Aces And Eights Dead Mans Hand Cowboy Skull Biker T-shirt-Black-2Xl', 'If you''re a biker dude, you''ll love this cool aces and eights dead mans hand T-shirt! The tee shirt itself is a Hanes Beefy-T T-shirt, crew neck style. It is thick and soft 6.1 ounce, 100% ring spun cotton and preshrunk. Its high stitch density is great for the design and last a long time. It it a solid black color. On the back is a very large, great looking white design that features a cowboy skull in a cowboy hat, two revolver guns, a pair of eights and aces playing cards and "DEAD MAN''S HAND" around it. It looks fantastic and really stands out on the black background, very colorful. A smaller one is on the left front chest of the shirt. I have another listing for this same tee with the large design on the front, as well as other biker designs, check out my other items. This mens biker T-shirt is top quality and looks fantastic, gets yours today!', NULL, NULL, 5, 22, 4, '510JqSMLI2BL.jpg', 'leather-supreme-aces-and-eights-dead-mans-hand-cowboy-skull-biker-t-shirt-black-2xl', 'B00NPFTPCG', 'Black', '510JqSMLI2BL.SL160.jpg', 'Leather Supreme');
INSERT INTO item_item VALUES (3908, 'Supreme Icon Unisex T-Shirt M White', '', NULL, NULL, 13, 2, 4, '31tH13YpPNL.jpg', 'supreme-icon-unisex-t-shirt-m-white', 'B01M7ZUC2Z', 'Medium', '31tH13YpPNL.SL160.jpg', 'Final Exchange');
INSERT INTO item_item VALUES (3909, 'Supreme Icon Unisex T-Shirt L White', '', NULL, NULL, 3, 2, 4, '31tH13YpPNL.jpg', 'supreme-icon-unisex-t-shirt-l-white', 'B01N3OB81X', 'Large', '31tH13YpPNL.SL160.jpg', 'Final Exchange');
INSERT INTO item_item VALUES (3910, 'E1SYNDICATE GREY CAMO T-SHIRT WU TANG CLAN CREAM TEAM OL DIRTY BASTARD SUPREME S-XL', 'We strongly recommend to buy E1syndicate products only from following 2 Amazon.com online-shops: <b> E1Syndicate Originals </b> and <b> E1SYNDICATE OFFICIAL </b> - to get only authentic products!', NULL, NULL, 19, 19, 4, '51VzPQeO2B6L.jpg', 'e1syndicate-grey-camo-t-shirt-wu-tang-clan-cream-team-ol-dirty-bastard-supreme-s-xl', 'B01MTD7PID', 'Grey', '51VzPQeO2B6L.SL160.jpg', 'E1SYNDICATE');
INSERT INTO item_item VALUES (3911, 'a bape supreme logo vr for White men T shirt', 'Super comfortable, super cool, 100% preshrunk cotton T-Shirt. We have 100''s of T-Shirt designs to choose from and offer discounted combined shipping. Find out why we are one of the best online T-Shirt shops around! You''ll love the feel and fit of our tees', NULL, NULL, 5, 2, 4, '51tx2xWcD8L.jpg', 'a-bape-supreme-logo-vr-for-white-men-t-shirt', 'B01KF402K8', 'Medium', '51tx2xWcD8L.SL160.jpg', 'A Bathing Ape');
INSERT INTO item_item VALUES (3912, 'E1SYNDICATE V-NECK T-SHIRT IRON MIKE TYSON DOPE SUPREME ELEVEN N65 BOXEN S-XL', '', NULL, NULL, 4, 19, 4, '41SAkwkWg6L.jpg', 'e1syndicate-v-neck-t-shirt-iron-mike-tyson-dope-supreme-eleven-n65-boxen-s-xl', 'B01N674J1N', 'White', '41SAkwkWg6L.SL160.jpg', 'E1SYNDICATE');
INSERT INTO item_item VALUES (3913, 'Men''s Printed SUPREME Poster T Shirts By Anedreabe XL Black', 'Features SUPREME on front.Double stitched.', NULL, NULL, 2, 12, 4, '41VtRXD5kL.jpg', 'mens-printed-supreme-poster-t-shirts-by-anedreabe-xl-black', 'B01LQ5SNHY', 'X-large,black,x-large,black', '41VtRXD5kL.SL160.jpg', 'Anedreabe');
INSERT INTO item_item VALUES (3914, 'The North Face Men''s Venture Jacket TNF Black/TNF Black LG', 'Ready for back country storms or everyday excursions, this waterproof, windproof hooded men''s jacket is designed to protect you from rain, year round. The breathable Dryventâ"¢ 2.5L soft-shell exterior is finished with a dry-touch coating that eliminates the need for a mesh lining. WATERPROOF: Impenetrable moisture barrier to guarantee dryness. PACKABLE/STOWABLE: Highly-compressible layer for emergency use or travel. WIND PROTECTION: Limiting air penetration reduces the windchill factor.', NULL, NULL, 9, 92, 5, '415yuPXXSEL.jpg', 'the-north-face-mens-venture-jacket-tnf-blacktnf-black-lg', 'B00DGF8N78', 'Tnf Black/Tnf Black', '415yuPXXSEL.SL160.jpg', 'The North Face');
INSERT INTO item_item VALUES (3915, 'Men''s The North Face Thermoball Full Zip Jacket TNF Black Size Large', 'Updated with streamlined baffles contoured to fit your body, our PrimaLoft ThermoBall jacket offers ultralight, highly compressible synthetic insulation to keep you warm in a variety of winter conditions. Our new insulation technology features round ThermoBall clusters that trap and retain heat to achieve phenomenal warmth in cold, wet weather. Wear or pack this ultralight jacket for reliable thermal insulation while winter camping in the backcountry.', NULL, NULL, 2, 197, 5, '51K7o7pFqoL.jpg', 'mens-the-north-face-thermoball-full-zip-jacket-tnf-black-size-large', 'B00KXILGPC', 'TNF Black', '51K7o7pFqoL.SL160.jpg', 'The North Face');
INSERT INTO item_item VALUES (3916, 'The North Face Apex Bionic 2 Jacket - Men''s TNF Black X-Large', 'If it''s cold, and it''s time to drop the clutch, this is the jacket. Water-resistant, breathable, stretchy and ready to rock. Cedar Wright, The North Face Athlete, Rock Climber. For windy, cold weather activities, this coveted soft shell keeps you warm and windchill-free beneath its windproof exterior and comfortable fleece backer.', NULL, NULL, 14, 119, 5, '41JmlK5dUmL.jpg', 'the-north-face-apex-bionic-2-jacket-mens-tnf-black-x-large', 'B01AHT9ZWM', 'TNF Black', '41JmlK5dUmL.SL160.jpg', 'The North Face');
INSERT INTO item_item VALUES (3917, 'The North Face Venture 2 Jacket Mens (Medium, TNF Black/TNF Black)', 'Be prepared for extreme backcountry weather with this lightweight, waterproof and windproof jacket that features a durable yet breathable ripstop exterior, Relaxed Fit and adjustable hood that leaves room for a helmet and extra layers.', NULL, NULL, 16, 71, 5, '41a9yhxCY8L.jpg', 'the-north-face-venture-2-jacket-mens-medium-tnf-blacktnf-black', 'B01HQSBBVA', 'Tnf Black', '41a9yhxCY8L.SL160.jpg', 'The North Face');
INSERT INTO item_item VALUES (3918, 'The North Face Men Denali 2 Jacket - Recycled TNF Black (M)', 'Witness the evolution of a legend. This iconic jacket is constructed with recycled fleece for unmatched warmth, comfort and durability.', NULL, NULL, 7, 116, 5, '41BPX2ie8xL.jpg', 'the-north-face-men-denali-2-jacket-recycled-tnf-black-m', 'B01AHVLKKK', 'Recycled TNF Black', '41BPX2ie8xL.SL160.jpg', 'The North Face');
INSERT INTO item_item VALUES (3919, 'Men''s The North Face Resolve 2 Jacket TNF Black Size Medium', 'Revel in the deluge with this weatherproof rain jacket that features a breathable mesh lining and adjustable hood that stows inside the collar.', NULL, NULL, 12, 78, 5, '41p1yjdNVyL.jpg', 'mens-the-north-face-resolve-2-jacket-tnf-black-size-medium', 'B01HQSWHYA', 'Tnf Black', '41p1yjdNVyL.SL160.jpg', 'The North Face');
INSERT INTO item_item VALUES (3920, 'The North Face Mens Khumbu 2 Jacket 2015,TNF Black/TNF Black,US L', 'Camp out with the protection of this midweight fleece jacket that can be worn as an exterior layer on crisp fall days or zipped into compatible shell jackets from The North Face for additional protection.', NULL, NULL, 15, 104, 5, '31FWiNHisHL.jpg', 'the-north-face-mens-khumbu-2-jacket-2015tnf-blacktnf-blackus-l', 'B00NQGOWEA', 'TNF Black/TNF Black', '31FWiNHisHL.SL160.jpg', 'The North Face');
INSERT INTO item_item VALUES (3921, 'The North Face 611C757 Apex Bionic Jacket for Men, TNF Black & TNF Black - 2XL', 'Features. The North Face Apex Bionic Jacket for Men. Material - 96 polyester4 elastane. TNF Apex Climate Block fabric is windproof and water-resistant. Wind rated at 0 CFM 100 windproof. Soft fleece backer. Internal and chest zip media pockets. 2 secure zip hand pockets. Hem cinch cord adjustment inside pockets. Length from center back - 28 in. Color - TNF BlackTNF Black. Size - 2XL', NULL, NULL, 15, 119, 5, '41igLYmc9L.jpg', 'the-north-face-611c757-apex-bionic-jacket-for-men-tnf-black-tnf-black-2xl', 'B00FJEQ4YI', 'Tnf Black', '41igLYmc9L.SL160.jpg', 'The North Face');
INSERT INTO item_item VALUES (3947, 'Tommy Hilfiger Men''s Poly Twill Stand Collar Zip Front Jacket, Navy, XX-Large', '', NULL, NULL, 18, 52, 5, '41ip81ogH3L.jpg', 'tommy-hilfiger-mens-poly-twill-stand-collar-zip-front-jacket-navy-xx-large', 'B00ZX84JQA', 'Navy', '41ip81ogH3L.SL160.jpg', 'Tommy Hilfiger');
INSERT INTO item_item VALUES (3984, 'Levi''s Men''s Chino Jogger Pant, Black, 29x30', 'Chino jogger pant', NULL, NULL, 15, 28, 6, '41X2BtwRTHJL.jpg', 'levis-mens-chino-jogger-pant-black-29x30', 'B00OTRQ8G0', 'Black', '41X2BtwRTHJL.SL160.jpg', 'Levi''s');
INSERT INTO item_item VALUES (3923, 'The North Face Resolve Jacket Men''s Coffee Bean Brown Large', 'By choice or by necessity, we know you venture outdoors in the rain. Because of this, we''ve designed this waterproof, windproof seam-sealed rain jacket to keep you dry on your treks when it''s raining cats and dogs. Not literally of course.  Attached, adjustable hood stows in its own collar.', NULL, NULL, 8, 87, 5, '41TPq7KhTL.jpg', 'the-north-face-resolve-jacket-mens-coffee-bean-brown-large', 'B01AHXDVIC', 'Coffee Bean Brown', '41TPq7KhTL.SL160.jpg', 'The North Face');
INSERT INTO item_item VALUES (3924, 'The North Face Mens Bombay Jacket (XL)', 'Classic, insulated mid-layer ski jacket Relaxed fit adds ease of movement with more room in the body and sleeves Zip hand pockets POLYESTER', NULL, NULL, 12, 109, 5, '51p6nXNtnqL.jpg', 'the-north-face-mens-bombay-jacket-xl', 'B06WGPGRZ4', 'Urban Navy', '51p6nXNtnqL.SL160.jpg', 'The North Face');
INSERT INTO item_item VALUES (3925, 'The North Face Men''s Millerton Jacket TNF Black Tigrid Camo (Large)', 'A streamlined rain jacket that delivers year-round technical performance on the trails, this waterproof, windproof two-layer shell provides the reliable protection you need during outdoor excursions in wet weather.', NULL, NULL, 6, 99, 5, '51fLHK87ckL.jpg', 'the-north-face-mens-millerton-jacket-tnf-black-tigrid-camo-large', 'B01HQR1UFS', 'Tnf Black Tigrid Camo', '51fLHK87ckL.SL160.jpg', 'The North Face');
INSERT INTO item_item VALUES (3926, 'North Face Pneumatic Jacket (TNF BLack) (M)', 'Get outside and enjoy a wide range of high-energy endeavors with the additional protection of this weather-resistant jacket. Versatile TNFTM Apex Universal stretch soft-shell technology remains breathable during aerobic activities in moderate weather conditions. A DWR (durable water resistant) finish sheds light precipitation until you can take cover from the rain.', NULL, NULL, 13, 95, 5, '41Cmh0faseL.jpg', 'north-face-pneumatic-jacket-tnf-black-m', 'B00KXIV4NG', 'TNF Black', '41Cmh0faseL.SL160.jpg', 'The North Face');
INSERT INTO item_item VALUES (3927, 'Men''s The North Face Canyonlands Triclimate Jacket TNF Black Size Large', 'Be better prepared for changing conditions with this customizable 3-in-1 jacket that pairs a warm, insulated shell that features a waterproof exterior with a zip-in midweight fleece jacket. Wear both together in wet, cold conditions or separately as weather permits.', NULL, NULL, 17, 196, 5, '41ssDW13B5L.jpg', 'mens-the-north-face-canyonlands-triclimate-jacket-tnf-black-size-large', 'B01AHR14KK', 'Tnf Black', '41ssDW13B5L.SL160.jpg', 'The North Face');
INSERT INTO item_item VALUES (3928, 'The North Face 300 Tundra Full zip Mens Feece Jacket (L)', 'The North Face 300 Tundra Full zip Mens Feece Jacket', NULL, NULL, 19, 69, 5, '41NlD0tJcaL.jpg', 'the-north-face-300-tundra-full-zip-mens-feece-jacket-l', 'B01MXI7GLT', 'Black', '41NlD0tJcaL.SL160.jpg', 'The North Face');
INSERT INTO item_item VALUES (3929, 'Calvin Klein Men''s Faux Lamb Leather Moto Jacket with Hoodie, Brown, Medium', 'Men''s faux leather hoody', NULL, NULL, 10, 89, 5, '51gEhgJvRAL.jpg', 'calvin-klein-mens-faux-lamb-leather-moto-jacket-with-hoodie-brown-medium', 'B00JGEGY6K', 'Brown', '51gEhgJvRAL.SL160.jpg', 'Calvin Klein');
INSERT INTO item_item VALUES (3930, 'Calvin Klein Men''s Flight Jacket, Black, XX-Large', 'Calvin Klein classic flight jacket bomber with removable key chain.', NULL, NULL, 2, 74, 5, '41LSAhh0HrL.jpg', 'calvin-klein-mens-flight-jacket-black-xx-large', 'B01N7JXW6J', 'Black', '41LSAhh0HrL.SL160.jpg', 'Calvin Klein');
INSERT INTO item_item VALUES (3931, 'Calvin Klein Men''s Soft Shell Jacket, Black, XX-Large', 'Calvin Klein men''s outerwear soft shell jacket weather features', NULL, NULL, 19, 39, 5, '41lIAr9dJkL.jpg', 'calvin-klein-mens-soft-shell-jacket-black-xx-large', 'B01FVYL08A', 'Black', '41lIAr9dJkL.SL160.jpg', 'Calvin Klein');
INSERT INTO item_item VALUES (3932, 'Calvin Klein Men''s Classic Packable Down Jacket, Electric Blue/Metallic, Large', 'Calvin Klein men''s outerwear premium down packable down jacket with chevron cut lines', NULL, NULL, 16, 53, 5, '411LlO2BmuNL.jpg', 'calvin-klein-mens-classic-packable-down-jacket-electric-bluemetallic-large', 'B01FVYMQ1K', 'Electric Blue/Metallic', '411LlO2BmuNL.SL160.jpg', 'Calvin Klein');
INSERT INTO item_item VALUES (3933, 'Calvin Klein Men''s Wool Bomber, Black, S', 'Calvin Klein men''s outerwear traditional wool bomber with zipper front', NULL, NULL, 17, 41, 5, '41qnBMYNYoL.jpg', 'calvin-klein-mens-wool-bomber-black-s', 'B01COK8YZQ', 'Black', '41qnBMYNYoL.SL160.jpg', 'Calvin Klein');
INSERT INTO item_item VALUES (3934, 'Calvin Klein Men''s Packable Down Jacket, Black, Large', 'Men''s packable down jacket', NULL, NULL, 16, 45, 5, '41uc0ovz6wL.jpg', 'calvin-klein-mens-packable-down-jacket-black-large', 'B00KDXSKJM', 'Black', '41uc0ovz6wL.SL160.jpg', 'Calvin Klein');
INSERT INTO item_item VALUES (3935, 'Calvin Klein Men''s Smooth Faux Leather Jacket, Black, Medium', 'Calvin Klein men''s outerwear smooth faux leather jacket', NULL, NULL, 8, 31, 5, '41OtL8F83tL.jpg', 'calvin-klein-mens-smooth-faux-leather-jacket-black-medium', 'B01FVYK5WM', 'Black', '41OtL8F83tL.SL160.jpg', 'Calvin Klein');
INSERT INTO item_item VALUES (3936, 'Calvin Klein Men''s Poly Bonded Military Jacket, Black, Small', 'Calvin Klein men''s outerwear military jacket with pocket and button detail', NULL, NULL, 4, 36, 5, '410t862l2EL.jpg', 'calvin-klein-mens-poly-bonded-military-jacket-black-small', 'B01FUQPTBI', 'Black', '410t862l2EL.SL160.jpg', 'Calvin Klein');
INSERT INTO item_item VALUES (3937, 'Calvin Klein Men''s Moto Faux Fur-Lined Jacket', 'Men''s smooth faux leather jacket', NULL, NULL, 13, 41, 5, '41xU6Rk8R7L.jpg', 'calvin-klein-mens-moto-faux-fur-lined-jacket', 'B00ZZO1VJA', 'Black', '41xU6Rk8R7L.SL160.jpg', 'Calvin Klein');
INSERT INTO item_item VALUES (3938, 'Calvin Klein Men''s Faux Leather Punk Moto Jacket, Black, X-SMALL', 'This faux leather jacket features an asymmetrical zip closure. When you add this piece to your closet, you''re instantly getting a modern punk feel.', NULL, NULL, 15, 82, 5, '41OFnWXQPzL.jpg', 'calvin-klein-mens-faux-leather-punk-moto-jacket-black-x-small', 'B01NBHE0EG', 'Black', '41OFnWXQPzL.SL160.jpg', 'Calvin Klein');
INSERT INTO item_item VALUES (3939, 'Calvin Klein Jeans Men''s Floral Bomber Jacket, Classic Navy, MEDIUM', 'This floral surplus jacket features a full zip front with front pockets.', NULL, NULL, 16, 148, 5, '51F2g2pyxDL.jpg', 'calvin-klein-jeans-mens-floral-bomber-jacket-classic-navy-medium', 'B01N7TEI0C', 'Classic Navy', '51F2g2pyxDL.SL160.jpg', 'Calvin Klein');
INSERT INTO item_item VALUES (3940, 'Calvin Klein Men''s Faux Leather Basic Hoody, Black, S', 'Calvin Klein men''s outerwear classic faux leather hoody', NULL, NULL, 15, 31, 5, '41ayKq1a2kL.jpg', 'calvin-klein-mens-faux-leather-basic-hoody-black-s', 'B01COK9G9Y', 'Black', '41ayKq1a2kL.SL160.jpg', 'Calvin Klein');
INSERT INTO item_item VALUES (3941, 'Calvin Klein Men''s Short Parka, Black Melange, M', 'Calvin Klein men''s outerwear artic short parka with faux fur hood', NULL, NULL, 6, 44, 5, '41DCB4bM5GL.jpg', 'calvin-klein-mens-short-parka-black-melange-m', 'B01G6MIG92', 'Black Melange', '41DCB4bM5GL.SL160.jpg', 'Calvin Klein');
INSERT INTO item_item VALUES (3942, 'Calvin Klein Men''s Faux Leather Jacket with Perforation Detail, Black, M', 'This faux leather jacket with perforation detail is a great piece to add to your closet. It''s modern aesthetic instantly elevates any outfit.', NULL, NULL, 12, 131, 5, '412w8WK7gnL.jpg', 'calvin-klein-mens-faux-leather-jacket-with-perforation-detail-black-m', 'B01NBHOXQZ', 'Black', '412w8WK7gnL.SL160.jpg', 'Calvin Klein');
INSERT INTO item_item VALUES (3943, 'Tommy Hilfiger Men''s Performance Barracuda Bomber Jacket, Navy, L', 'Performance faux memory stand collar rib knit bomber with center front zipper closure. Zip through collar with double button closure', NULL, NULL, 20, 79, 5, '41SFdv0JlhL.jpg', 'tommy-hilfiger-mens-performance-barracuda-bomber-jacket-navy-l', 'B01MR7757B', 'Navy', '41SFdv0JlhL.SL160.jpg', 'Tommy Hilfiger');
INSERT INTO item_item VALUES (3945, 'Tommy Hilfiger Men''s Soft Shell Classic Zip Front Jacket, Black, XX-Large', 'Soft shell classic zip front jacket', NULL, NULL, 12, 33, 5, '41XtzZsG56L.jpg', 'tommy-hilfiger-mens-soft-shell-classic-zip-front-jacket-black-xx-large', 'B00Q2GQLFE', 'Black', '41XtzZsG56L.SL160.jpg', 'Tommy Hilfiger');
INSERT INTO item_item VALUES (4125, 'Converse Unisex Chuck Taylor All Star Low Top Sneakers -  Optical White - 7.5 B(M) US Women / 5.5 D(M) US Men', 'Old school never looked so fly. Rep your era to the fullest in a pair of these classic Chucks from Converse..', NULL, NULL, 14, 46, 7, '31zcSlCqGPL.jpg', 'converse-unisex-chuck-taylor-all-star-low-top-sneakers-optical-white-75-bm-us-women-55-dm-us-men', 'B000EDMSEE', 'Optical White', '31zcSlCqGPL.SL160.jpg', 'Converse');
INSERT INTO item_item VALUES (4105, 'Converse Chuck All Star Black Sneaker - Black 8 B(M) US Women / 6 D(M) US Men', 'Converse''s M9166  classic design that hasn''t changed in years and years .It has die-hard canvas and durable rubber outsole .These two things makes it long lasting and insanely popular. Moreover its low top oxford style gives it unique look and better breathability. This is a kind of shoe which you can wear with any dress', NULL, NULL, 14, 39, 7, '41flckPGNxL.jpg', 'converse-chuck-all-star-black-sneaker-black-8-bm-us-women-6-dm-us-men', 'B000KUDKO8', 'Black', '41flckPGNxL.SL160.jpg', 'Converse');
INSERT INTO item_item VALUES (4107, 'Converse Unisex Chuck Taylor Classic Pink Sneaker - 5 Men - 7 Women', 'Converse Chuck Taylor All Star Core Ox Pink M9007 Mens 5', NULL, NULL, 4, 46, 7, '417rPQlO6kL.jpg', 'converse-unisex-chuck-taylor-classic-pink-sneaker-5-men-7-women', 'B00019LF8G', 'Pink', '417rPQlO6kL.SL160.jpg', 'Converse');
INSERT INTO item_item VALUES (4109, 'Converse Unisex Chuck Taylor All Star Ox Low Top Black Sneakers - 7 B(M) US Women / 5 D(M) US Men', 'Classic Chucks! Converse Chuck Taylor All Star Low shoes. Canvas upper. Padded insole. Rubber toe cap. Vulcanized rubber outsole. Rubber Converse All Star heel badge. Converse All Star label woven on tongue. Imported.', NULL, NULL, 10, 44, 7, '41yCaAH04sL.jpg', 'converse-unisex-chuck-taylor-all-star-ox-low-top-black-sneakers-7-bm-us-women-5-dm-us-men', 'B0000AFSXF', 'Black', '41yCaAH04sL.SL160.jpg', 'Converse');
INSERT INTO item_item VALUES (4111, 'Converse Chuck Taylor All Star Lo Top Black Canvas Shoes men''s 7.5/ women''s 9.5', 'Old school never looked so fly. Rep your era to the fullest in a pair of these classic Chucks from Converse..', NULL, NULL, 10, 39, 7, '418kbDMpR6L.jpg', 'converse-chuck-taylor-all-star-lo-top-black-canvas-shoes-mens-75-womens-95', 'B000EDMRX6', 'Black', '418kbDMpR6L.SL160.jpg', 'Converse');
INSERT INTO item_item VALUES (4113, 'Converse CT All Star Ox Black Canvas Womens Trainers Size 6 UK', 'Converse Chuck Taylor All Star Core Low Top Black M9166 Mens 6', NULL, NULL, 15, 39, 7, '51HJhW11kQL.jpg', 'converse-ct-all-star-ox-black-canvas-womens-trainers-size-6-uk', 'B005LVKQI4', 'Black', '51HJhW11kQL.SL160.jpg', 'Converse');
INSERT INTO item_item VALUES (4116, 'Converse Chuck Taylor All Star Lux Mid Fashion Sneaker Wedge Shoe - White - Womens - 7', 'Get some fashionable height with our hidden wedge All Star sneakers that are both comfy and stylish..', NULL, NULL, 4, 66, 7, '418B9CL8tqL.jpg', 'converse-chuck-taylor-all-star-lux-mid-fashion-sneaker-wedge-shoe-white-womens-7', 'B00LVDPKZK', 'White', '418B9CL8tqL.SL160.jpg', 'Converse');
INSERT INTO item_item VALUES (4118, 'Converse Men''s Chuck Taylor All Star Low Top Sneaker Optical White 6.5 M', 'Please note: Converse shoes tend to run big. You may want to consider ordering a half-size smaller than you normally wear.  This particular style is unisex size but it is listed as men''s size. For women''s size, you will need to add 2 size to the men''s size.   Unisex sizes as follows: (M= mens/W= womens)  3M - 5W  4M - 6W  5M - 7W  6M - 8W  7M - 9W  8M - 10W  9M - 11W  10M - 12W  11M - 13W  12M - 14W', NULL, NULL, 1, 39, 7, '417kyji11XL.jpg', 'converse-mens-chuck-taylor-all-star-low-top-sneaker-optical-white-65-m', 'B000EDIMU8', 'Optical White', '417kyji11XL.SL160.jpg', 'Converse');
INSERT INTO item_item VALUES (4119, 'Converse Unisex Chuck Taylor All Star Leather Ox Fashion Sneaker - White - 5.5', 'Burnished leather provides a cool update for a sporty retro sneaker..', NULL, NULL, 17, 79, 7, '411FwP2HA6L.jpg', 'converse-unisex-chuck-taylor-all-star-leather-ox-fashion-sneaker-white-55', 'B006M6AYHA', 'White', '411FwP2HA6L.SL160.jpg', 'Converse');
INSERT INTO item_item VALUES (4121, 'Converse Unisex Chuck Taylor All Star Ox Low Top Red Sneakers - 10 B(M) US Women / 8 D(M) US Men', 'Old school never looked so fly. Rep your era to the fullest in a pair of these classic Chucks from Converse..', NULL, NULL, 8, 39, 7, '51Jnq9YFzEL.jpg', 'converse-unisex-chuck-taylor-all-star-ox-low-top-red-sneakers-10-bm-us-women-8-dm-us-men', 'B000072UN2', 'Red', '51Jnq9YFzEL.SL160.jpg', 'Converse');
INSERT INTO item_item VALUES (4123, 'Converse Women''s Chuck Taylor All Star Shoreline Sneaker Back Alley Brick/Black/White 7.5 M', 'Enjoy the waves without having to lace-up in these Converse Women''s Chuck Taylor Shoreline Slip-On sneakers.', NULL, NULL, 17, 69, 7, '51bo9YzbXRL.jpg', 'converse-womens-chuck-taylor-all-star-shoreline-sneaker-back-alley-brickblackwhite-75-m', 'B011JJTUAG', 'Brick/Black/White', '51bo9YzbXRL.SL160.jpg', 'Converse');
INSERT INTO item_item VALUES (4130, 'Stuart Weitzman Women''s Mary Adobe Kid Shoe', 'The Mary is sleek and sophisticated, you can''t go wrong! Smooth leather upper. Slip-on construction. Square toe. Leather lining. Lightly-padded leather insole. Covered, block heel. Synthetic outsole. Made in Spain. Measurements: Heel Height: 3 in Weight: 9 oz Product measurements were taken using size 8.5, width M. Please note that measurements may vary by size.', NULL, NULL, 8, 375, 7, '41rCQdAYb3L.jpg', 'stuart-weitzman-womens-mary-adobe-kid-shoe', 'B01MF62L33', 'Adobe Kid', '41rCQdAYb3L.SL160.jpg', 'Stuart Weitzman');
INSERT INTO item_item VALUES (4131, 'Stuart Weitzman Two Much Women US 11 Black Wedge Sandal', 'The Stuart Weitzman Two Much Sandals feature a Patent Leather upper with a . The Man-Made outsole lends lasting traction and wear.', NULL, NULL, 7, 81, 7, '512BcRSEulbL.jpg', 'stuart-weitzman-two-much-women-us-11-black-wedge-sandal', 'B01F54L05E', 'Black', '512BcRSEulbL.SL160.jpg', 'Stuart Weitzman');
INSERT INTO item_item VALUES (4132, 'Stuart Weitzman Women''s Annaform Silver Noir Shoe', 'The Stuart Weitzman™ Annaform wedges will have you dancing all night long. Shimmering textile upper. Easy slip-on wear. Peep toe. Leather lining. Lightly-padded footbed. Wedge heel. Leather outsole. Imported. Measurements: Heel Height: 2 3⁄4 in Weight: 7 oz Product measurements were taken using size 8, width M. Please note that measurements may vary by size.', NULL, NULL, 9, 279, 7, '51ny2bA2BJiL.jpg', 'stuart-weitzman-womens-annaform-silver-noir-shoe', 'B01BX0Z3IY', 'Silver Noir', '51ny2bA2BJiL.SL160.jpg', 'Stuart Weitzman');
INSERT INTO item_item VALUES (4135, 'Stuart Weitzman Women''s York Wedge Pump, Black, 9.5 M US', 'Pumps', NULL, NULL, 9, 425, 7, '41clYUlrgeL.jpg', 'stuart-weitzman-womens-york-wedge-pump-black-95-m-us', 'B01J2YYCD0', 'Black', '41clYUlrgeL.SL160.jpg', 'Stuart Weitzman');
INSERT INTO item_item VALUES (4137, 'Stuart Weitzman Women''s Pipelopez Taupe Molecular Patent Loafer 10 M', 'Slip-on design. Pointed-toe silhouette. Leather lining. Lightly padded footbed. Wrapped block heel. Synthetic sole. Made in', NULL, NULL, 1, 199, 7, '41pIfBe6pSL.jpg', 'stuart-weitzman-womens-pipelopez-taupe-molecular-patent-loafer-10-m', 'B00598168S', 'Taupe Molecular Patent', '41pIfBe6pSL.SL160.jpg', 'Stuart Weitzman');
INSERT INTO item_item VALUES (4139, 'Stuart Weitzman Women''s Freely Wedge Sandal,Oro,9 M US', 'The Stuart Weitzman Freely Sandals feature a Leather upper with a Open Toe . The Rubber outsole lends lasting traction and wear.', NULL, NULL, 7, 84, 7, '41ISGupfYL.jpg', 'stuart-weitzman-womens-freely-wedge-sandaloro9-m-us', 'B00GDEQCFO', 'Oro', '41ISGupfYL.SL160.jpg', 'Stuart Weitzman');
INSERT INTO item_item VALUES (4141, 'Stuart Weitzman Women''s Nudist Dress Sandal, Silver, 9 M US', '', NULL, NULL, 14, 97, 7, '41VNGC7vnGL.jpg', 'stuart-weitzman-womens-nudist-dress-sandal-silver-9-m-us', 'B00NC1YZ7I', 'Silver', '41VNGC7vnGL.SL160.jpg', 'Stuart Weitzman');
INSERT INTO item_item VALUES (3949, 'Tommy Hilfiger Men''s Size Micro Twill Laydown Collar Golf Jacket, Navy, 3X TALL', 'Laydown collar micro twill golf jacket with open bottom and two lower welt pockets', NULL, NULL, 12, 16, 5, '41Suy2BNaMTL.jpg', 'tommy-hilfiger-mens-size-micro-twill-laydown-collar-golf-jacket-navy-3x-tall', 'B01LR9B4GQ', 'Navy', '41Suy2BNaMTL.SL160.jpg', 'Tommy Hilfiger');
INSERT INTO item_item VALUES (3951, 'Tommy Hilfiger Men''s Packable Down Jacket, Navy, Large', 'Real down packable jacket', NULL, NULL, 20, 55, 5, '411uSt2BZMQL.jpg', 'tommy-hilfiger-mens-packable-down-jacket-navy-large', 'B0100XQS8O', 'Navy', '411uSt2BZMQL.SL160.jpg', 'Tommy Hilfiger');
INSERT INTO item_item VALUES (3953, 'Tommy Hilfiger Men''s Micro-Twill Open Bottom Zip Front Jacket, Black, Large', 'Zip front micro-twill jacket', NULL, NULL, 8, 49, 5, '41g2BOCQD0OL.jpg', 'tommy-hilfiger-mens-micro-twill-open-bottom-zip-front-jacket-black-large', 'B00N4N2LZ2', 'Black', '41g2BOCQD0OL.SL160.jpg', 'Tommy Hilfiger');
INSERT INTO item_item VALUES (3955, 'Tommy Hilfiger Men''s Stand Collar Zip Front Jacket, Army Green, Medium', 'Poly-twill stand collar zip front jacket', NULL, NULL, 17, 46, 5, '41NdcViXOOL.jpg', 'tommy-hilfiger-mens-stand-collar-zip-front-jacket-army-green-medium', 'B00Q2GQ3PW', 'Army Green', '41NdcViXOOL.SL160.jpg', 'Tommy Hilfiger');
INSERT INTO item_item VALUES (3958, 'Tommy Hilfiger Men''s Ultra Loft Quilted Packable Jacket, Black, M', 'Sweat weight ultra loft poly fill off set box quilted packable jacket with packable bag included.', NULL, NULL, 8, 59, 5, '41OQIsZ7UL.jpg', 'tommy-hilfiger-mens-ultra-loft-quilted-packable-jacket-black-m', 'B01L08YRCW', 'Black', '41OQIsZ7UL.SL160.jpg', 'Tommy Hilfiger');
INSERT INTO item_item VALUES (3960, 'Tommy Hilfiger Men''s Technical Wool Blend Hooded Stadium Jacket, Black, XL', 'Technical wool full length two pocket hooded stadium coat with nylon quilted double hood lining. Dual front closure with zipper and fly front snap placket for added warmth and function. Water resistant and breathable fabric. Box quilted nylon lining for added style.', NULL, NULL, 14, 43, 5, '41WiJjhpTcL.jpg', 'tommy-hilfiger-mens-technical-wool-blend-hooded-stadium-jacket-black-xl', 'B01L0B0ZG6', 'Black', '41WiJjhpTcL.SL160.jpg', 'Tommy Hilfiger');
INSERT INTO item_item VALUES (3962, 'Tommy Hilfiger Men''s Nylon Hooded Puffer Bomber Jacket, Black, Medium', 'Nylon hooded puffer bomber', NULL, NULL, 17, 39, 5, '41Lgfxx0rL.jpg', 'tommy-hilfiger-mens-nylon-hooded-puffer-bomber-jacket-black-medium', 'B00JBXOFMG', 'Black', '41Lgfxx0rL.SL160.jpg', 'Tommy Hilfiger');
INSERT INTO item_item VALUES (3964, 'Tommy Hilfiger Men''s Poly-Twill Performance Bomber Jacket, Port, XXL', 'Poly twill four pocket performance mid-weight rib knit zip front bomber jacket with utility collar and hidden hood. Contrast quilted poly twill lining with light poly fill insulation.', NULL, NULL, 7, 62, 5, '41Q1wVD5h2BL.jpg', 'tommy-hilfiger-mens-poly-twill-performance-bomber-jacket-port-xxl', 'B01L0AXM08', 'Port', '41Q1wVD5h2BL.SL160.jpg', 'Tommy Hilfiger');
INSERT INTO item_item VALUES (3967, 'Tommy Hilfiger Men''s Waterproof Breathable Hooded Jacket, Red, Medium', '', NULL, NULL, 12, 44, 5, '41DCGdUvdL.jpg', 'tommy-hilfiger-mens-waterproof-breathable-hooded-jacket-red-medium', 'B00YQAFBRW', 'Red', '41DCGdUvdL.SL160.jpg', 'Tommy Hilfiger');
INSERT INTO item_item VALUES (3969, 'Tommy Hilfiger Men''s Ultra Loft Insulated Packable Jacket with Contrast Hood, Ice/Midnight Bib, L', 'Ultra loft polyfill packable hooded mid weight quilted puffer jacket with contrast fixed bib and double hood. Elastic banding at cuff and waist for flexibility and added comfort. Packable bag included with purchase.', NULL, NULL, 18, 42, 5, '416oWwJYGHL.jpg', 'tommy-hilfiger-mens-ultra-loft-insulated-packable-jacket-with-contrast-hood-icemidnight-bib-l', 'B01L08W3KK', 'Ice/Midnight Bib', '416oWwJYGHL.SL160.jpg', 'Tommy Hilfiger');
INSERT INTO item_item VALUES (3971, 'Tommy Hilfiger Men''s Packable Down Jacket, Charcoal, 3X BIG', 'Down filled quilted packable jacket with lower zipper pockets', NULL, NULL, 9, 56, 5, '51gY9u1fwDL.jpg', 'tommy-hilfiger-mens-packable-down-jacket-charcoal-3x-big', 'B01LR9CQC2', 'Charcoal', '51gY9u1fwDL.SL160.jpg', 'Tommy Hilfiger');
INSERT INTO item_item VALUES (3972, 'Tommy Hilfiger Men''s Lightweight Hooded Packable Windbreaker Jacket, Navy, M', 'Lightweight hooded mini rip top nylon windbreaker with contrast center front zipper tape. Two lower zipper pockets with self contained pocket transforming jacket into fanny pack', NULL, NULL, 19, 54, 5, '41Vqo6sU2EL.jpg', 'tommy-hilfiger-mens-lightweight-hooded-packable-windbreaker-jacket-navy-m', 'B01NCVVE2V', 'Navy', '41Vqo6sU2EL.SL160.jpg', 'Tommy Hilfiger');
INSERT INTO item_item VALUES (4285, 'Moochi Women''s 8 Denier Ultra Sheer Classic Reinforce Crotch compression Tights', 'Moochi sheer pantyose - 8 D ultra sheer to invisible<br> Material: 85% nylon, 15% spandex<br> One size fits: height uner 6''1" weight 140lbs<br> make your legs invisible smooth,shinning,breathable and firm<br> compress pressure, make your legs comfortable<br>control top, classic reinforce crotch style<br>', NULL, NULL, 15, 15, 9, '31ZSvMez4PL.jpg', 'moochi-womens-8-denier-ultra-sheer-classic-reinforce-crotch-compression-tights', 'B0185OYWPG', 'Coffee', '31ZSvMez4PL.SL160.jpg', 'Moochi');
INSERT INTO item_item VALUES (3974, 'Levi''s  Men''s 569 Loose Straight Jean, Rugged, 36x32', '', NULL, NULL, 17, 39, 6, '41IM7a59PZL.jpg', 'levis-mens-569-loose-straight-jean-rugged-36x32', 'B0018OY3H8', 'Rugged', '41IM7a59PZL.SL160.jpg', 'Levi''s');
INSERT INTO item_item VALUES (4287, 'Moochi Women''s 30 Denier Ultra Sheer Flower Branch Pattern Pantyhose', 'The 30D sheer pattern pantyhose <br> Material: 85% nylon, 15% spandex <br> One size fits: height uner 6''1" weight 170lbs <br> make your legs smooth,shinning,breathable and firm <br> control top, sexy bikini crotch style <br>', NULL, NULL, 19, 19, 9, '415Gak0BmwL.jpg', 'moochi-womens-30-denier-ultra-sheer-flower-branch-pattern-pantyhose', 'B0185OYXLE', 'Black', '415Gak0BmwL.SL160.jpg', 'Moochi');
INSERT INTO item_item VALUES (4290, 'Moochi Women Sexy Intersive Fishnet Crotchless Black Bodystocking Tights', 'Good product, affordable price', NULL, NULL, 15, 4, 9, '41eYY27eBjL.jpg', 'moochi-women-sexy-intersive-fishnet-crotchless-black-bodystocking-tights', 'B015YODZDU', 'Black', '41eYY27eBjL.SL160.jpg', 'Moochi');
INSERT INTO item_item VALUES (3977, 'Levi''s Men''s Big-Tall 559 Relaxed Straight Fit Slub Twill Pant, Timberwolf, 36Wx38L', 'Relaxed fit in the seat and thigh', NULL, NULL, 11, 49, 6, '414g1OqMR2L.jpg', 'levis-mens-big-tall-559-relaxed-straight-fit-slub-twill-pant-timberwolf-36wx38l', 'B00G9XCB3Q', 'Timberwolf', '414g1OqMR2L.SL160.jpg', 'Levi''s');
INSERT INTO item_item VALUES (4293, 'Moochi Women''s 30 Denier Ultra Sheer Lined Flower Pattern Pantyhose', 'The 30D sheer pattern pantyhose 
<br> Material: 85% nylon, 15% spandex 
<br> One size fits: height uner 6''1" weight 170lbs 
<br> make your legs smooth,shinning,breathable and firm 
<br> control top, sexy bikini crotch style 
<br>', NULL, NULL, 18, 12, 9, '312c8YLyaML.jpg', 'moochi-womens-30-denier-ultra-sheer-lined-flower-pattern-pantyhose', 'B0185OZ1A6', 'Black', '312c8YLyaML.SL160.jpg', 'Moochi');
INSERT INTO item_item VALUES (3979, 'Levi''s Men''s Straight Pant, True Chino/Stretch Twill, 32Wx36L', 'More than 140 years after inventing the blue jean, one thing is clear: Levi''s clothes are loved by the people who wear them - from presidents to movie stars, farmers to fashion icons, entrepreneurs to the everyman. ''Live in Levi''s'' asserts with confidence and pride that Levi''s clothes are indeed for everybody who''s not just anybody.', NULL, NULL, 3, 39, 6, '41ds9PBqGL.jpg', 'levis-mens-straight-pant-true-chinostretch-twill-32wx36l', 'B01EJUGWJY', 'True Chino - Stretch Twill - Stretch', '41ds9PBqGL.SL160.jpg', 'Levi''s');
INSERT INTO item_item VALUES (3981, 'Levi''s Men''s 514  Straight Leg Twill Pant, Graphite, 36x32', 'Twill that fuses fashion and functionality', NULL, NULL, 9, 39, 6, '41pW0wcRx4L.jpg', 'levis-mens-514-straight-leg-twill-pant-graphite-36x32', 'B007P0HNQC', 'Graphite', '41pW0wcRx4L.SL160.jpg', 'Levi''s');
INSERT INTO item_item VALUES (4940, 'PonicsPump PP06605: 66 GPH Submersible Pump with 5'' Cord - 3W... for Quality Indoor/Outdoor/Table-Top Fountain Pump for Fountains, Statuary, Aquariums & more. Comes with 1 year limited warranty.', '<b>PONICSPUMP MODEL PP06605 66 GPH SUBMERSIBLE PUMP DESIGNED FOR LONG SERVICE LIFE</b><br> <br> We designed this 66 Gallon Per Hour (GPH) pump to have a long service life by:<br> • Using a Polished Stainless Steel #205 Impeller Shaft ,<br> • Using a powerful permanent maget wet rotor design that eliminates the need for a seal, which is a common cause of failure, and by<br> • Using a heavy duty waterproof electric cord design to resist oil, grease and moisture while providing abrasion resistance.<br> <br> Comes with a one year limited warranty.<br> <br> <b>NEED HELP IN CHOOSING A PUMP?</B><BR> Please see our guides and specifications in the photo section above.<br> If you need more help, please contact the seller.<br> <br> <b>NEED HELP IN CLEANING YOUR PUMP?</B><BR> Please see our disassembly / re-assembly guide in the photo section above.<br> <br> <b>SAFETY WARNING: USE ON GFCI CIRCUIT!</b><br> To protect against dangerous electrical shock, always use any submersible pump on an electrical circuit that has Ground Fault Circuit Interrupter (GFCI) at either the plug or the breaker. <br><br> <b>One year limited warranty only when product is purchased from FasterHarvest®.</b>', NULL, NULL, 6, 10, 15, '51nAtpeEqCL.jpg', 'ponicspump-pp06605-66-gph-submersible-pump-with-5-cord-3w-for-quality-indooroutdoortable-top-fountain-pump-for-fountains-statuary-aquariums-more-comes-with-1-year-limited-warranty', 'B006LYCYBC', 'Black', '51nAtpeEqCL.SL160.jpg', 'PonicsPumps');
INSERT INTO item_item VALUES (4944, 'SereneLife Desktop Waterfall Fountain (3-Tier) | Cascading Tabletop Water Decoration | Indoor, Outdoor, Patio or Garden Use (SLTWF10)', '<br><b>Add charm and relaxing sophistication to your home or garden with a beautiful and elegant tabletop water foundation from SereneLife. </b></br><br>When it comes to letting the days’ stresses and anxieties fall behind, sometimes you need the gentle, relaxing sounds of water to help you ease a racing mind and tense body. That’s why we created the multifunctional <b>SereneLife Desktop Water Fountain</b>; a unique 3-tier water decoration<br><b>Reach True Serenity </b></br><br>Easy to set up inside or outside the home, this unique tabletop decoration has a built-in, automatic pump that circulates water continuously. That means you can fall asleep to the dulcet, relaxing tones of water flowing down each step. Better yet, it’s perfectly sized to fit all those decorative areas inside your home! </br><br><b>Product Details:</b></br><ul><li>Tabletop Water Fountain </li><li>Built-In Water Pump </li><li>Portable and Easy to Use </li><li>Indoor/Outdoor Use </li><li>Lightweight and Compact </li><li>AC Power </li><li>Satisfaction Guaranteed </li></ul><br><b>Click ‘Add to Cart’ above to get a beautiful and decorative tabletop water fountain that helps you relax, unwind, and find inner peace. </b></br>', NULL, NULL, 16, 35, 15, '41YJlbtTCL.jpg', 'serenelife-desktop-waterfall-fountain-3-tier-cascading-tabletop-water-decoration-indoor-outdoor-patio-or-garden-use-sltwf10', 'B01LYVJZVT', '', '41YJlbtTCL.SL160.jpg', 'SereneLife');
INSERT INTO item_item VALUES (4948, 'Gifts & Decor Hand of Buddha Stone Like Indoor Table Water Fountain', 'Stone-look fountain is a fitting symbol of the source from which all blessings flow. Cascading water creates a harmonious sound, turning any surrounding into a serene retreat. Electric pump included; 120v, 60 HZ. Weight 3-pound. Polyresin. UL Recognized. Some Assembly Required. 9-inch by 7 7/8-inch by 11-1/2-inch high.', NULL, NULL, 17, 33, 15, '415Jpq87aXL.jpg', 'gifts-decor-hand-of-buddha-stone-like-indoor-table-water-fountain', 'B008YQ4AU8', 'Multicolor', '415Jpq87aXL.SL160.jpg', 'Gifts & Decor');
INSERT INTO item_item VALUES (4955, 'Triple Jug Indoor-Outdoor 8 1/4" High Tabletop Fountain', 'This indoor/outdoor tabletop fountain features three charming, chocolate speckle finish jugs in a round bowl on a bed of polished river rocks. Water flows from the tallest jug into the vessel at the bottom, powered by a recirculating pump. Makes a great tabletop accent, indoors or outdoors.<br>- 9 3/4" wide x 9 3/4" deep x 8 1/4" high.<br>- Ceramic finish tabletop fountain for home or office use. <br>- Chocolate speckle glaze with real river rock accents in the lower basin.<br>- Lightweight polyresin construction, easy to position and use. <br>- Includes pump and cord.', NULL, NULL, 5, 29, 15, '51HmrCLLyxL.jpg', 'triple-jug-indoor-outdoor-8-14-high-tabletop-fountain', 'B009SLIIIS', 'Brown', '51HmrCLLyxL.SL160.jpg', 'John Timberland');
INSERT INTO item_item VALUES (4959, 'Indoor Tabletop Home Decor Water Fountain Decoration (Hand of Buddha)', 'Create a soothing and relaxing space with this beautiful Hand of Buddha water fountain. Ideal for indoor use, the fountain will add a decorative touch to any decor. This stone-look fountain is a fitting symbol of the source from which all blessings flow. Cascading water creates a harmonious sound, turning any surrounding into a serene retreat. Electric pump included; 120v, 60 HZ. Polyresin material. Measures 8" (H) x 6" (L) x 6" (W)', NULL, NULL, 10, 16, 15, '41uwGsJpzyL.jpg', 'indoor-tabletop-home-decor-water-fountain-decoration-hand-of-buddha', 'B011PPPWOM', 'Multicolor', '41uwGsJpzyL.SL160.jpg', 'Liberty Imports');
INSERT INTO item_item VALUES (4966, 'Fountain Pump Suitable For Indoor or Outdoor Use Includes Tubing', 'Make your own dish garden, tabletop fountain or a small outdoor water feature using this reliable little pump. It raises a column of water up to 24 inches and pumps 70 GPH. Simple in construction and low in cost, it is fully submersible and requires no lubrication and almost no maintainence except for an occasional cleaning. Included with the pump is 2 feet of flexible tubing to attach to the outlet. The pump features a built-in flow control, a 4-1/2 foot, two prong cord and it only uses 6 watts of energy. It measures 2-1/8" long X 2" wide X 1-1/2" high and carries a 1 year manufacturers warranty. Suitable for use in small indoor designs, small aquariums or decorative outdoor installations, this sturdy pump will provide years of service.', NULL, NULL, 18, 12, 15, '41hb3S3gMwL.jpg', 'fountain-pump-suitable-for-indoor-or-outdoor-use-includes-tubing', 'B01DMHF0DE', '', '41hb3S3gMwL.SL160.jpg', '');
INSERT INTO item_item VALUES (4971, 'Best Choice Products Home Indoor Tabletop Fountain Waterfall With Multicolor LED Lights', 'Best Choice Products presents this new tabletop waterfall fountain. Add a soothing, natural element to your home or office décor. Earthy and natural, this tabletop fountain features a waterfall and stacked rocks design. This miniature home accent is crafted of molded poly-resin and fiberglass material. The cascading water is illuminated with multicolored LED lights. The base of the fountain is designed with soft footpads, adding stability and protecting furniture from scratches. Quiet and energy-saving water pump plugs into any standard electric outlet with a 6'' power cord with a detachable 12V UL adaptor. Add a relaxing and decorative accent to your home or office today, with a Best Choice Products Tabletop Waterfall Fountain. SPECIFICATIONS: Dimensions: 9"(L) x 11"(W) x 15"(H); Cord: 6''(L) ; Weight: 7.8 lbs.; Frequency: 60 Hz; Wattage: 12W; Input: 120V AC; Output: 12V AC; Color: Brown; Material: Polyresin, fiberglass; Assembly required (with instructions)', NULL, NULL, 6, 54, 15, '51jcDoXAtgL.jpg', 'best-choice-products-home-indoor-tabletop-fountain-waterfall-with-multicolor-led-lights', 'B01N7HZGA6', 'Brown', '51jcDoXAtgL.SL160.jpg', 'Best Choice Products');
INSERT INTO item_item VALUES (3986, 'Levi''s Men''s 541 Athletic Fit Cargo Pant, Black, 34x30', 'More than 140 years after inventing the blue jean, one thing is clear: Levi''s clothes are loved by the people who wear them - from presidents to movie stars, farmers to fashion icons, entrepreneurs to the everyman. ''Live in Levi''s'' asserts with confidence and pride that Levi''s clothes are indeed for everybody who''s not just anybody.', NULL, NULL, 18, 49, 6, '41RpTs1JtPL.jpg', 'levis-mens-541-athletic-fit-cargo-pant-black-34x30', 'B01611D4N6', 'Black', '41RpTs1JtPL.SL160.jpg', 'Levi''s');
INSERT INTO item_item VALUES (3988, 'Levi''s Men''s 541 Athletic Fit Chino Pant, Revolver/Stretch Twill, 40W x 30L', 'More than 140 years after inventing the blue jean, one thing is clear: Levi''s clothes are loved by the people who wear them - from presidents to movie stars, farmers to fashion icons, entrepreneurs to the everyman. ''Live in Levi''s'' asserts with confidence and pride that Levi''s clothes are indeed for everybody who''s not just anybody.', NULL, NULL, 19, 24, 6, '41BQ3wt2LXL.jpg', 'levis-mens-541-athletic-fit-chino-pant-revolverstretch-twill-40w-x-30l', 'B01EJUJKYS', 'Revolver/Stretch Twill', '41BQ3wt2LXL.SL160.jpg', 'Levi''s');
INSERT INTO item_item VALUES (3990, 'Levi''s Men''s 511 Slim Fit Hybrid Trouser Pant, Chino Twill, 31x30', 'Slant front pockets, smartphone pocket in left back pocket', NULL, NULL, 14, 17, 6, '414iY2BGY6uL.jpg', 'levis-mens-511-slim-fit-hybrid-trouser-pant-chino-twill-31x30', 'B0086L1DHO', 'Chino', '414iY2BGY6uL.SL160.jpg', 'Levi''s');
INSERT INTO item_item VALUES (3993, 'Levi''s Men''s 514 Straight Fit Pant, Eiffel Tower/Corduroy, 30Wx30L', 'More than 140 years after inventing the blue jean, one thing is clear: Levi''s clothes are loved by the people who wear them - from presidents to movie stars, farmers to fashion icons, entrepreneurs to the everyman. ''Live in Levi''s'' asserts with confidence and pride that Levi''s clothes are indeed for everybody who''s not just anybody.', NULL, NULL, 7, 42, 6, '41drXZUYWyL.jpg', 'levis-mens-514-straight-fit-pant-eiffel-towercorduroy-30wx30l', 'B01EJUDOQ8', 'Eiffel Tower/Corduroy - Stretch', '41drXZUYWyL.SL160.jpg', 'Levi''s');
INSERT INTO item_item VALUES (3995, 'Levi''s Men''s Cargo Jogger Pant, Steel Gray Twill, 28W x 30L', 'More than 140 years after inventing the blue jean, one thing is clear: Levi''s clothes are loved by the people who wear them - from presidents to movie stars, farmers to fashion icons, entrepreneurs to the everyman. ''Live in Levi''s'' asserts with confidence and pride that Levi''s clothes are indeed for everybody who''s not just anybody.', NULL, NULL, 11, 36, 6, '41feHFs7kKL.jpg', 'levis-mens-cargo-jogger-pant-steel-gray-twill-28w-x-30l', 'B01EBQ48BU', 'Steel Gray Twill - Stretch', '41feHFs7kKL.SL160.jpg', 'Levi''s');
INSERT INTO item_item VALUES (3997, 'Levi''s Men''s 511 Slim Fit Welt Chino Pant, Graphite/Cruz Twill, 30x32', 'More than 140 years after inventing the blue jean, one thing is clear: Levi''s clothes are loved by the people who wear them - from presidents to movie stars, farmers to fashion icons, entrepreneurs to the everyman. ''Live in Levi''s'' asserts with confidence and pride that Levi''s clothes are indeed for everybody who''s not just anybody.', NULL, NULL, 6, 24, 6, '41i0eptzJmL.jpg', 'levis-mens-511-slim-fit-welt-chino-pant-graphitecruz-twill-30x32', 'B01611RMI4', 'Graphite/Cruz Twill', '41i0eptzJmL.SL160.jpg', 'Levi''s');
INSERT INTO item_item VALUES (3998, 'Levi''s Men''s 511 Slim Fit Jean, Grey - Black 3D - Stretch, 32W x 36L', 'A modern slim with room to move, the 511 slim fit jeans are a classic since right now. These jeans sit below the waist with a slim fit through the hip and thigh and a slim leg. This pair has just the right amount of stretch for performance and all-day comfort. Cut close to the body, the 511 is a great alternative to the skinny jean - you''ll get the same lean look with added comfort. The narrow leg also means endless style options. For a laidback, daytime look, try a slightly scrunched leg and sneakers. Once night rolls around, try a 2-inch cuff with a chelsea boot.', NULL, NULL, 20, 54, 6, '41zUWOABVkL.jpg', 'levis-mens-511-slim-fit-jean-grey-black-3d-stretch-32w-x-36l', 'B01N6HS4YU', 'Grey - Black 3d - Stretch', '41zUWOABVkL.SL160.jpg', 'Levi''s');
INSERT INTO item_item VALUES (4000, 'Levi''s Men''s 505 Regular Fit Twill Pant, Timberwolf, 34x36', 'Regular fit', NULL, NULL, 6, 39, 6, '41q6XPjkMNL.jpg', 'levis-mens-505-regular-fit-twill-pant-timberwolf-34x36', 'B005PJ1MLC', 'Timberwolf', '41q6XPjkMNL.SL160.jpg', 'Levi''s');
INSERT INTO item_item VALUES (4002, 'Levi''s Men''s 550 Relaxed Fit Jean, Black, 38x34', 'The Levi''s 550 jean is a traditional fit jean with a slightly tapered leg.', NULL, NULL, 10, 39, 6, '41u1xuevgaL.jpg', 'levis-mens-550-relaxed-fit-jean-black-38x34', 'B0018OFSKY', 'Black', '41u1xuevgaL.SL160.jpg', 'Levi''s');
INSERT INTO item_item VALUES (4004, 'Signature by Levi Strauss & Co Men''s Athletic Jean, British Khaki, 34x32', 'Signature by Levi Strauss & co. Athletic fit jeans are the perfect fit solution for guys who want a modern, slim jean but need more room in the seat and thigh. Crafted from premium denim that flexes with you for comfort and shape retention, these athletic fit jeans offer a relaxed fit through the seat to thigh and are cut slim from knee to ankle.  Quality you trust from Levi Strauss & co, est. 1853.', NULL, NULL, 3, 19, 6, '41Ghrpl9ukL.jpg', 'signature-by-levi-strauss-co-mens-athletic-jean-british-khaki-34x32', 'B01H7EOZ6G', 'British Khaki', '41Ghrpl9ukL.SL160.jpg', 'Signature by Levi Strauss & Co');
INSERT INTO item_item VALUES (4008, 'Lee Men''s Total Freedom Relaxed Classic Fit Flat Front Pant, Black, 42W x 34L', 'No iron for easy care', NULL, NULL, 16, 21, 6, '313tdOK9gSL.jpg', 'lee-mens-total-freedom-relaxed-classic-fit-flat-front-pant-black-42w-x-34l', 'B00HJGKZL2', 'Black', '313tdOK9gSL.SL160.jpg', 'Lee');
INSERT INTO item_item VALUES (4010, 'Lee Men''s Performance Series Extreme Comfort Khaki Pant, Charcoal, 38W X 29L', 'Lee has unearthed new innovations in denim since 1889. The company has a rich American history in the world of fit and fashion, and now offers more fits, styles, finishes, features and choices than ever before. Whether you''re off to a weekend adventure or dressing for a day at the office.', NULL, NULL, 13, 25, 6, '41N8gOvDNL.jpg', 'lee-mens-performance-series-extreme-comfort-khaki-pant-charcoal-38w-x-29l', 'B01EFGEPXW', 'Charcoal', '41N8gOvDNL.SL160.jpg', 'Lee');
INSERT INTO item_item VALUES (4013, 'Lee Men''s Stain Resistant Relaxed Fit Flat Front Pant, Black, 40W x 34L', 'Stain Release', NULL, NULL, 20, 21, 6, '319IwfVmvhL.jpg', 'lee-mens-stain-resistant-relaxed-fit-flat-front-pant-black-40w-x-34l', 'B0008EOBFS', 'Black', '319IwfVmvhL.SL160.jpg', 'Lee');
INSERT INTO item_item VALUES (4015, 'Lee Men''s Big-Tall Comfort Waist Custom Fit Pleated Pant, Mid-Khaki, 46W x 28L', 'Relaxed fit', NULL, NULL, 14, 39, 6, '412B2BQfgIXL.jpg', 'lee-mens-big-tall-comfort-waist-custom-fit-pleated-pant-mid-khaki-46w-x-28l', 'B007KG3XRO', 'Mid-khaki', '412B2BQfgIXL.SL160.jpg', 'Lee');
INSERT INTO item_item VALUES (4019, 'Lee Uniforms Men''s Straight-Leg College Pant, Stone, 42x30', 'Classic-fit pant featuring straight leg and logo shank button closure', NULL, NULL, 17, 6, 6, '31d3vmEBwQL.jpg', 'lee-uniforms-mens-straight-leg-college-pant-stone-42x30', 'B01HOUHNAS', 'Stone', '31d3vmEBwQL.SL160.jpg', 'Lee Uniforms');
INSERT INTO item_item VALUES (4021, 'Lee Men''s Comfort Waist Custom Relaxed Fit Flat Front Pant, Mid-Khaki, 40W x 32L', 'Wrinkle resistant for easy care', NULL, NULL, 1, 24, 6, '41BVvaQ0P2L.jpg', 'lee-mens-comfort-waist-custom-relaxed-fit-flat-front-pant-mid-khaki-40w-x-32l', 'B007K48LOG', 'Authentic Mid Khaki', '41BVvaQ0P2L.SL160.jpg', 'Lee');
INSERT INTO item_item VALUES (4022, 'Lee Men''s Stain Resistant Relaxed Fit Pleated Pant, Dark Khaki, 36W x 32L', 'Pleated', NULL, NULL, 17, 21, 6, '41I0X4CaZgL.jpg', 'lee-mens-stain-resistant-relaxed-fit-pleated-pant-dark-khaki-36w-x-32l', 'B00DX4GDWE', 'Dark Khaki', '41I0X4CaZgL.SL160.jpg', 'Lee');
INSERT INTO item_item VALUES (4143, 'Stuart Weitzman Women''s Wrapsie Wedge Sandal, Haze, 9 M US', '', NULL, NULL, 12, 185, 7, '41gSTQUWlyL.jpg', 'stuart-weitzman-womens-wrapsie-wedge-sandal-haze-9-m-us', 'B01AT3LWPE', 'Haze', '41gSTQUWlyL.SL160.jpg', 'Stuart Weitzman');
INSERT INTO item_item VALUES (4456, 'Lee Women''s Active Performance Kitts Short, Black, 10', 'Just like our founder,  H.D. Lee, our passion is helping can-do people do more. We are committed to designing clothing that conforms to your body, allowing you to move through life freely. We help you chase the things that bring you joy and laughter. The things that make you fearless and hopefully because your passion is what makes you unique. And what moves you, moves us. Move your Lee.', NULL, NULL, 12, 29, 10, '313dmSfELPL.jpg', 'lee-womens-active-performance-kitts-short-black-10', 'B01M35AJG8', 'Black', '313dmSfELPL.SL160.jpg', 'Lee');
INSERT INTO item_item VALUES (4459, 'Lee Women''s Natural Fit Jenna Short, Carnation Santorini Plaid, 16', 'Lee has unearthed new innovations in denim since 1889. The company has a rich American history in the world of fit and fashion, and now offers more fits, styles, finishes, features and choices than ever before. Whether you''re off to a weekend adventure or dressing for a day at the office.', NULL, NULL, 9, 33, 10, '41EGm2Bu0zL.jpg', 'lee-womens-natural-fit-jenna-short-carnation-santorini-plaid-16', 'B015PSLL2W', 'Carnation Santorini Plaid', '41EGm2Bu0zL.SL160.jpg', 'Lee');
INSERT INTO item_item VALUES (4463, 'Lee Women''s Relaxed Fit Bermuda Short, Oxford, 10', 'At the waist', NULL, NULL, 12, 27, 10, '41PcI9zoyOL.jpg', 'lee-womens-relaxed-fit-bermuda-short-oxford-10', 'B013WBHKRO', 'Oxford', '41PcI9zoyOL.SL160.jpg', 'Lee');
INSERT INTO item_item VALUES (4466, 'Lee Women''s Relaxed Fit Avey Knit Waist Cargo Bermuda Short, White, 14', 'Lee has unearthed new innovations in denim since 1889. The company has a rich American history in the world of fit and fashion, and now offers more fits, styles, finishes, features and choices than ever before. Whether you''re off to a weekend adventure or dressing for a day at the office.', NULL, NULL, 15, 25, 10, '31UQzEmb15L.jpg', 'lee-womens-relaxed-fit-avey-knit-waist-cargo-bermuda-short-white-14', 'B013WBG57A', 'White', '31UQzEmb15L.SL160.jpg', 'Lee');
INSERT INTO item_item VALUES (4471, 'Lee Women''s Plus Size Relaxed Fit Delaney Knit Waist Cargo Bermuda Short, Coral, 20W/Medium', 'Just like our founder,  H.D. Lee, our passion is helping can-do people do more. We are committed to designing clothing that conforms to your body, allowing you to move through life freely. We help you chase the things that bring you joy and laughter. The things that make you fearless and hopefully because your passion is what makes you unique. And what moves you, moves us. Move your Lee.', NULL, NULL, 14, 33, 10, '31OGTFFlx8L.jpg', 'lee-womens-plus-size-relaxed-fit-delaney-knit-waist-cargo-bermuda-short-coral-20wmedium', 'B01M9J3CFY', 'Coral', '31OGTFFlx8L.SL160.jpg', 'Lee');
INSERT INTO item_item VALUES (4474, 'Lee Women''s Plus Size Midrise Fit Matteo Total Freedom Short, Pacifica, 20W/Medium', 'Just like our founder,  H.D. Lee, our passion is helping can-do people do more. We are committed to designing clothing that conforms to your body, allowing you to move through life freely. We help you chase the things that bring you joy and laughter. The things that make you fearless and hopefully because your passion is what makes you unique. And what moves you, moves us. Move your Lee.', NULL, NULL, 12, 34, 10, '41gOIhfU53L.jpg', 'lee-womens-plus-size-midrise-fit-matteo-total-freedom-short-pacifica-20wmedium', 'B01M5JFS08', 'Pacifica', '41gOIhfU53L.SL160.jpg', 'Lee');
INSERT INTO item_item VALUES (4477, 'Lee Women''s Relaxed Fit Beatrix Knit Waist Bermuda Short, Summit, 16', 'Just like our founder,  H.D. Lee, our passion is helping can-do people do more. We are committed to designing clothing that conforms to your body, allowing you to move through life freely. We help you chase the things that bring you joy and laughter. The things that make you fearless and hopefully because your passion is what makes you unique. And what moves you, moves us. Move your Lee.', NULL, NULL, 10, 27, 10, '41z6svsWR8L.jpg', 'lee-womens-relaxed-fit-beatrix-knit-waist-bermuda-short-summit-16', 'B01JFQ0MC0', 'Summit', '41z6svsWR8L.SL160.jpg', 'Lee');
INSERT INTO item_item VALUES (4484, 'Anolon Advanced Bronze Nonstick 9-Piece Cookware Set with 2-Piece Bakeware Bonus by Anolon', 'Set includes: 1-1/2 and 3-Quart Covered Saucepans, 8-Quart Covered Stockpot, 10-In Skillet, 3-Quart Covered Saute, Two 10-In by 15-In Cookie Pans;Restaurant-tested DuPont Autograph 2 nonstick is metal utensil safe and provides maximum food release and easy cleanup;Durable hard-anodized construction heats quickly and evenly reducing hotspots that can burn foods;Comfortable Anolon SureGrip handles are dual riveted for strength and oven safe to 400 degrees Fahrenheit;;Nonstick cookie pans offer even heat and wide Anolon SureGrip handles for a comfortable and confident grasp; oven safe to 500 degrees Fahrenheit', NULL, NULL, 14, 987, 12, '514PgbaARfL.jpg', 'anolon-advanced-bronze-nonstick-9-piece-cookware-set-with-2-piece-bakeware-bonus-by-anolon', 'B013S1WK78', '', '514PgbaARfL.SL160.jpg', 'Anolon');
INSERT INTO item_item VALUES (4488, 'Nonstick Bakeware 2-Piece Meatloaf Pan with Insert, Gray with Orange Handles', '2-Piece Meatloaf Pan with Insert The pan''s handy insert allows fats to drain away when making meatloaf, or remove the insert to bake quick breads', NULL, NULL, 18, 737, 12, '41t7HYcimRL.jpg', 'nonstick-bakeware-2-piece-meatloaf-pan-with-insert-gray-with-orange-handles', 'B01IO36RQ0', 'Gray', '41t7HYcimRL.SL160.jpg', 'Generic');
INSERT INTO item_item VALUES (4493, 'Nonstick Bakeware 9-Inch by 13-Inch Oven Lovin'' Rectangle Cake Pan, Gray with Orange Handles', '9-Inch by 13-Inch Cake Pan This nonstick cake pan is made from durable carbon steel for everyday use; sturdy construction resists warping', NULL, NULL, 17, 693, 12, '31bqjNipfWL.jpg', 'nonstick-bakeware-9-inch-by-13-inch-oven-lovin-rectangle-cake-pan-gray-with-orange-handles', 'B01IO1I7YW', 'Gray', '31bqjNipfWL.SL160.jpg', 'Generic');
INSERT INTO item_item VALUES (4498, 'Kids Bakeware w/Display Case Pack 32 Home Kitchen Furniture Decor', 'Kids Bakeware w/Display<br/>Includes 12 each of the following : 7-PC. Mini Bakeware Set , 10-PC. Mini Bakeware Set, Small Bake Pan w/Animal Cookie Cutters<br/>Premium Non-Stick Coating for Easy Clean Up<br/>Made of Carbonized Steel"" Case Pack 32 <b>Please note: If there is a color/size/type option, the option closest to the image will be shipped (Or you may receive a random color/size/type).</b>', NULL, NULL, 5, 628, 12, '51MIz1XQN5L.jpg', 'kids-bakeware-wdisplay-case-pack-32-home-kitchen-furniture-decor', 'B017JXQCTS', '', '51MIz1XQN5L.SL160.jpg', 'Entenmann''s Bakeware');
INSERT INTO item_item VALUES (4023, 'Lee Men''s Super Soft Slim Fit Chino, Original Khaki, 36W X 30L', 'Just like our founder, H.D. Lee, our passion is helping can-do people do more. We are committed to designing clothing that conforms to your body, allowing you to move through life freely. We help you chase the things that bring you joy and laughter. The things that make you fearless and hopefully because your passion is what makes you unique. And what moves you, moves us. Move your Lee.', NULL, NULL, 7, 25, 6, '41DCI0NDg4L.jpg', 'lee-mens-super-soft-slim-fit-chino-original-khaki-36w-x-30l', 'B01LHAKD1W', 'Original Khaki', '41DCI0NDg4L.SL160.jpg', 'Lee');
INSERT INTO item_item VALUES (4025, 'Lee Uniforms Men''s Slim Straight Core Pant, Black, 28Wx32L', 'Slim straight twill pant', NULL, NULL, 14, 19, 6, '31B1lmAhNfL.jpg', 'lee-uniforms-mens-slim-straight-core-pant-black-28wx32l', 'B0072J7X34', 'Black', '31B1lmAhNfL.SL160.jpg', 'Lee');
INSERT INTO item_item VALUES (4027, 'Lee Men''s Big-Tall Stain Resistant Relaxed Fit Pleated Pant, Black, 44W x 32L', 'Relaxed fit', NULL, NULL, 1, 29, 6, '41IGNAIjukL.jpg', 'lee-mens-big-tall-stain-resistant-relaxed-fit-pleated-pant-black-44w-x-32l', 'B007KG3L4O', 'Black', '41IGNAIjukL.SL160.jpg', 'Lee');
INSERT INTO item_item VALUES (4030, 'Lee Men''s Big and Tall Performance Series Extreme Comfort Khaki Pant, Navy, 44W x 32L', 'Just like our founder,  H.D. Lee, our passion is helping can-do people do more. We are committed to designing clothing that conforms to your body, allowing you to move through life freely. We help you chase the things that bring you joy and laughter. The things that make you fearless and hopefully because your passion is what makes you unique. And what moves you, moves us. Move your Lee.', NULL, NULL, 3, 42, 6, '417PKWyT1hL.jpg', 'lee-mens-big-and-tall-performance-series-extreme-comfort-khaki-pant-navy-44w-x-32l', 'B01MR585C8', 'Navy', '417PKWyT1hL.SL160.jpg', 'Lee');
INSERT INTO item_item VALUES (4032, 'Lee Men''s Performance Series 5 Pocket Stretch Straight Leg Pant, Black, 32W x 32L', 'Just like our founder,  H.D. Lee, our passion is helping can-do people do more. We are committed to designing clothing that conforms to your body, allowing you to move through life freely. We help you chase the things that bring you joy and laughter. The things that make you fearless and hopefully because your passion is what makes you unique. And what moves you, moves us. Move your Lee.', NULL, NULL, 1, 29, 6, '31FSChBRkiL.jpg', 'lee-mens-performance-series-5-pocket-stretch-straight-leg-pant-black-32w-x-32l', 'B01N21M219', 'Black', '31FSChBRkiL.SL160.jpg', 'Lee');
INSERT INTO item_item VALUES (4035, 'Lee Uniforms Men''s Skinny Leg 5 Pocket Pant, Black, 28x30', 'Twill 5 pocket skinny pant', NULL, NULL, 14, 23, 6, '412BhZSAPiML.jpg', 'lee-uniforms-mens-skinny-leg-5-pocket-pant-black-28x30', 'B00KYJOC9W', 'Black', '412BhZSAPiML.SL160.jpg', 'Lee Uniforms');
INSERT INTO item_item VALUES (4037, 'Lee Men''s Relaxed Fit Utility Belted Cargo Pants, Barley, 36W x 32L', 'Relaxed fit', NULL, NULL, 16, 29, 6, '41jVyUWpT5L.jpg', 'lee-mens-relaxed-fit-utility-belted-cargo-pants-barley-36w-x-32l', 'B00B58TZJ8', 'Barley', '41jVyUWpT5L.SL160.jpg', 'Lee');
INSERT INTO item_item VALUES (4039, 'Lee Men''s Big-Tall Performance Series Extreme Comfort Khaki Pant, Black, 46W x 30L', 'Lee has unearthed new innovations in denim since 1889. The company has a rich American history in the world of fit and fashion, and now offers more fits, styles, finishes, features and choices than ever before. Whether you''re off to a weekend adventure or dressing for a day at the office.', NULL, NULL, 8, 42, 6, '41P2upUa7HL.jpg', 'lee-mens-big-tall-performance-series-extreme-comfort-khaki-pant-black-46w-x-30l', 'B0193H24B8', 'Black', '41P2upUa7HL.SL160.jpg', 'Lee');
INSERT INTO item_item VALUES (4042, 'Levi''s Men''s 505 Regular Fit Jean, Navarro, 32x32', '505 regular fit jean', NULL, NULL, 8, 39, 6, '41zVgfQqxL.jpg', 'levis-mens-505-regular-fit-jean-navarro-32x32', 'B00V2XRXIQ', 'Navarro - Stretch', '41zVgfQqxL.SL160.jpg', 'Levi''s');
INSERT INTO item_item VALUES (4045, 'Levi''s Men''s 550 Relaxed Fit Jean, Dark Stonewash, 38x32', 'Levi''s Jeans 550 Relaxed Fit are go-to jeans for country boys and city guys Jeans sit comfortably below natural waist. Button waist and zipper fly. Authentic five-pocket styling. Quality construction includes topstitching on hip seams and back pockets. Imported. 06 - Stonewash is made of 13. 75 oz. cotton denim. C1 - Black Out is made of 13. 5 oz. cotton denim. M9 - Rinsed is made of 14. 5 oz. cotton denim. L7 - Dark Stone is made of 13. 5oz. cotton denim. As an authorized U. S. retailer of Levi Strauss and Co. products, we cannot accept orders from outside the United States for Levi''s products.', NULL, NULL, 10, 39, 6, '414s9778w3L.jpg', 'levis-mens-550-relaxed-fit-jean-dark-stonewash-38x32', 'B0018OMIZW', 'Dark Stonewash', '414s9778w3L.SL160.jpg', 'Levi''s');
INSERT INTO item_item VALUES (4048, 'Levi''s Men''s 501 Original Fit Jean, Dark Stonewash, 34x32', 'The Levi''s 501 Button Fly Jean features a straight leg with the original Levi''s fit.', NULL, NULL, 7, 39, 6, '41T2BHZfQPsL.jpg', 'levis-mens-501-original-fit-jean-dark-stonewash-34x32', 'B0018OOVPC', 'Dark Stonewash', '41T2BHZfQPsL.SL160.jpg', 'Levi''s');
INSERT INTO item_item VALUES (4050, 'Levi''s Men''s 511 Slim Fit Jean, Black Stone - Stretch, 34W x 32L', 'Levi''s most popular skinny fit, the low-rise 511 Skinny Jean sits below the waist and stays slouchy at top. Cut slim through the leg, it''s close and comfortable at the thigh and straight to the ankle.', NULL, NULL, 7, 24, 6, '41Woz5w2l1L.jpg', 'levis-mens-511-slim-fit-jean-black-stone-stretch-34w-x-32l', 'B00JWLVV9W', 'Black Stone - Stretch', '41Woz5w2l1L.SL160.jpg', 'Levi''s');
INSERT INTO item_item VALUES (4051, 'Levi''s 559 Men''s Relaxed Straight Stretch Jean - 34W x 32L - Steely Blue', 'A relaxed-fit jean that combines a comfortable fit with a stylish dark wash. Classic five-pocket styling with signature topstitching on back pockets.', NULL, NULL, 18, 39, 6, '41X9znmpfL.jpg', 'levis-559-mens-relaxed-straight-stretch-jean-34w-x-32l-steely-blue', 'B00K5PDFNY', 'Steely Blue - Stretch', '41X9znmpfL.SL160.jpg', 'Levi''s');
INSERT INTO item_item VALUES (4052, 'Levi''s Men''s 510 Skinny Fit Jean,Rigid Grey,32x32', 'Sits below the waist', NULL, NULL, 1, 47, 6, '4109PePZBiL.jpg', 'levis-mens-510-skinny-fit-jeanrigid-grey32x32', 'B003Y05IBY', 'Rigid Grey - Stretch', '4109PePZBiL.SL160.jpg', 'Levi''s');
INSERT INTO item_item VALUES (4053, 'Levi''s Men''s 541 Athletic Fit Jean, Lake Merrit, 42x30', '541 athletic straight fit jean', NULL, NULL, 3, 24, 6, '41mrDpBhy9L.jpg', 'levis-mens-541-athletic-fit-jean-lake-merrit-42x30', 'B00OTT41S0', 'Lake Merrit - Stretch', '41mrDpBhy9L.SL160.jpg', 'Levi''s');
INSERT INTO item_item VALUES (4055, 'Levi''s Men''s 514 Straight Jean, Shoestring, 32Wx30L', 'Denim that fuses fashion and functionality', NULL, NULL, 4, 39, 6, '41Hu1Tk2qLL.jpg', 'levis-mens-514-straight-jean-shoestring-32wx30l', 'B00GA7VQIM', 'Shoestring', '41Hu1Tk2qLL.SL160.jpg', 'Levi''s');
INSERT INTO item_item VALUES (4057, 'Signature by Levi Strauss & Co Men''s Regular Jean, Sterling, 38x30', 'Signature by Levi Strauss & co. Regular fit jeans provide authentic style and comfort for all occasions. Crafted from premium quality, durable denim, these regular fit jeans offer a classic fit through the seat and thigh and are cut straight from the knee to ankle. Quality you trust from Levi Strauss & co, est. 1853.', NULL, NULL, 15, 19, 6, '411JRsXLLvL.jpg', 'signature-by-levi-strauss-co-mens-regular-jean-sterling-38x30', 'B01H7EN58U', 'Sterling', '411JRsXLLvL.SL160.jpg', 'Signature by Levi Strauss & Co');
INSERT INTO item_item VALUES (4060, 'Signature by Levi Strauss & Co Men''s Straight Jean, Chief, 32x32', 'Signature by Levi Strauss & co. Straight fit jeans offer a classic straight fit that is comfortable from day to night. Crafted from premium quality, durable denim, these straight fit jeans fit easy through the seat to thigh and are cut straight from knee to ankle. Quality you trust from Levi Strauss & co, est. 1853.', NULL, NULL, 9, 19, 6, '41YtmFwFNXL.jpg', 'signature-by-levi-strauss-co-mens-straight-jean-chief-32x32', 'B01H7EO3UY', 'Chief', '41YtmFwFNXL.SL160.jpg', 'Signature by Levi Strauss & Co');
INSERT INTO item_item VALUES (4145, 'Stuart Weitzman Nuexflat Women US 9.5 Ivory Peep Toe Flats', 'The Stuart Weitzman Nuexflat Dress Shoes feature a Leather upper with a Peep-Toe . The Leather outsole lends lasting traction and wear.', NULL, NULL, 15, 40, 7, '41ZbA2IyJAL.jpg', 'stuart-weitzman-nuexflat-women-us-95-ivory-peep-toe-flats', 'B0189O1DYA', 'Turq Drop', '41ZbA2IyJAL.SL160.jpg', 'Stuart Weitzman');
INSERT INTO item_item VALUES (4148, 'Stuart Weitzman Women''s Popular Beach Suede Sandal', 'Stand out from the crowd with the Stuart Weitzman® Popular sandal. Perforated suede leather upper. Slingback ankle strap with buckle closure. Open toe. Leather lining. Lightly padded leather foodbed. Stacked block heel. Genuine leather outsole. Made in Spain. Measurements: Heel Height: 2 1⁄4 in Weight: 9 oz Platform Height: 1⁄4 in Product measurements were taken using size 7.5, width M. Please note that measurements may vary by size.', NULL, NULL, 5, 398, 7, '51u5w256k3L.jpg', 'stuart-weitzman-womens-popular-beach-suede-sandal', 'B01KUIGHI0', 'Beach Suede', '51u5w256k3L.SL160.jpg', 'Stuart Weitzman');
INSERT INTO item_item VALUES (4151, 'Stuart Weitzman Women''s Pinot Dress Pump, Adobe, 8 M US', 'Leather upper.', NULL, NULL, 13, 303, 7, '41fzutRuY5L.jpg', 'stuart-weitzman-womens-pinot-dress-pump-adobe-8-m-us', 'B00JGUXUPC', 'Adobe', '41fzutRuY5L.SL160.jpg', 'Stuart Weitzman');
INSERT INTO item_item VALUES (4153, 'Stuart Weitzman Women''s Broadband Huarache Sandal, Pecan, 8 M US', 'Hook-and-loop closure. Leather lining. Chunky stacked heel. Leather sole.', NULL, NULL, 1, 159, 7, '41uwH2unXML.jpg', 'stuart-weitzman-womens-broadband-huarache-sandal-pecan-8-m-us', 'B00MQ9INMK', 'Pecan', '41uwH2unXML.SL160.jpg', 'Stuart Weitzman');
INSERT INTO item_item VALUES (4155, 'Stuart Weitzman Women''s Nearlynude Sandals, Gold, 6.5 B(M) US', 'A subtle metallic coating lends a soft sheen to these linen Stuart Weitzman sandals. Slim ankle strap with buckle closure. Chunky, covered heel with rubber cap. Textured leather sole', NULL, NULL, 18, 398, 7, '314cKuYKioL.jpg', 'stuart-weitzman-womens-nearlynude-sandals-gold-65-bm-us', 'B06XH5HWNJ', 'Gold', '314cKuYKioL.SL160.jpg', 'Stuart Weitzman');
INSERT INTO item_item VALUES (4157, 'Stuart Weitzman Women''s Peekabow Black Suede Shoe', 'Freshen up your striking ensemble with the Stuart Weitzman® Peekabow pump. Suede leather upper. Slip-on design. Pointed toe. Bow detail at heel. Leather lining. Lightly padded footbed. Wrapped heel. Leather sole. Made in Spain. Measurements: Heel Height: 2 3⁄4 in Weight: 7 oz Product measurements were taken using size 5.5, width M. Please note that measurements may vary by size.', NULL, NULL, 6, 398, 7, '41yFbYcajVL.jpg', 'stuart-weitzman-womens-peekabow-black-suede-shoe', 'B01HI2UNCC', 'Black Suede', '41yFbYcajVL.SL160.jpg', 'Stuart Weitzman');
INSERT INTO item_item VALUES (4160, 'Adrianna Papell Women''s Petite Embroidered Fit and Flare Dress, Blue/Multi, 4P', 'Zelda fringe embroidered fit and flare dress with bateaux neckline', NULL, NULL, 15, 160, 8, '41kQBFDvNL.jpg', 'adrianna-papell-womens-petite-embroidered-fit-and-flare-dress-bluemulti-4p', 'B01N81BH1X', 'Blue/Multi', '41kQBFDvNL.SL160.jpg', 'Adrianna Papell');
INSERT INTO item_item VALUES (4162, 'Adrianna Papell Women''s Fully Beaded Long Sleevless Gown with Illusion Neckline, Platinum, 6', 'Strapless long gown with floral beading and illusion neckline', NULL, NULL, 5, 379, 8, '31rWPXHKvJL.jpg', 'adrianna-papell-womens-fully-beaded-long-sleevless-gown-with-illusion-neckline-platinum-6', 'B01MT1SVP9', 'Platinum', '31rWPXHKvJL.SL160.jpg', 'Adrianna Papell');
INSERT INTO item_item VALUES (4164, 'Adrianna Papell Women''s Turtle Neck Longsleeve Solid Pleat Dress, Grey, Small', 'Turtle neck long sleeve solid sweater dress with pleat skirt', NULL, NULL, 4, 16, 8, '31xGpoNWFbL.jpg', 'adrianna-papell-womens-turtle-neck-longsleeve-solid-pleat-dress-grey-small', 'B01HIN74MI', 'Grey', '31xGpoNWFbL.SL160.jpg', 'Adrianna Papell');
INSERT INTO item_item VALUES (4166, 'Adrianna Papell Women''s Tea Length Halter Lace Party Dress, Blush, 8', 'Halter illusion yoke seamed metallic corded lace tea length party dress', NULL, NULL, 17, 199, 8, '31J0eMGR7CL.jpg', 'adrianna-papell-womens-tea-length-halter-lace-party-dress-blush-8', 'B01N7KCTGF', 'Blush', '31J0eMGR7CL.SL160.jpg', 'Adrianna Papell');
INSERT INTO item_item VALUES (4168, 'Adrianna Papell Women''s V Neck 3/4 Sleeve Wrap Dress, Red/Multi, M', 'Printed side pleated matte jersey wrap dress with v neck', NULL, NULL, 9, 110, 8, '41V4OunjLL.jpg', 'adrianna-papell-womens-v-neck-34-sleeve-wrap-dress-redmulti-m', 'B01MREOBK7', 'Red/Multi', '41V4OunjLL.SL160.jpg', 'Adrianna Papell');
INSERT INTO item_item VALUES (4171, 'Adrianna Papell Women''s Sleeveless Beaded Cocktail Dress with Geometric Beading, Hunter, 16', 'Sleeveless beaded cocktail dress with geometric beading', NULL, NULL, 9, 152, 8, '4178AWdftbL.jpg', 'adrianna-papell-womens-sleeveless-beaded-cocktail-dress-with-geometric-beading-hunter-16', 'B01HPKOG7K', 'Hunter', '4178AWdftbL.SL160.jpg', 'Adrianna Papell');
INSERT INTO item_item VALUES (4173, 'Adrianna Papell Women''s Jewel Printed Ponte, Iris, 10', 'Long sleeve printed ponte sheath dress where the body is magnified jewel print and the sleeves are solid.', NULL, NULL, 6, 70, 8, '41sMdAfWHwL.jpg', 'adrianna-papell-womens-jewel-printed-ponte-iris-10', 'B0113OIFUS', 'Iris', '41sMdAfWHwL.SL160.jpg', 'Adrianna Papell');
INSERT INTO item_item VALUES (4176, 'Adrianna Papell Women''s One Shoulder Lace Party Dress, Coral/Nude, 10', 'One shoulder lace party fit to flare short dress with natural waist', NULL, NULL, 11, 199, 8, '41QSKzFgOlL.jpg', 'adrianna-papell-womens-one-shoulder-lace-party-dress-coralnude-10', 'B01MY0Z3M9', 'Coral/Nude', '41QSKzFgOlL.SL160.jpg', 'Adrianna Papell');
INSERT INTO item_item VALUES (4178, 'Adrianna Papell Women''s Beaded Knit Crepe Ruched Shth, Black, 8', 'Knit crepe sheath dress with halter neckline and cutout back. 3D floral embellishment along neckline.', NULL, NULL, 19, 160, 8, '31klZxUqpnL.jpg', 'adrianna-papell-womens-beaded-knit-crepe-ruched-shth-black-8', 'B01MV6GGYM', 'Black', '31klZxUqpnL.SL160.jpg', 'Adrianna Papell');
INSERT INTO item_item VALUES (4180, 'Adrianna Papell Women''s Printed Dancing Sticks Scuba Crepe No Waist Fit and Flare Dress Navy/Ivory Dress', 'Adrianna Papell Size Guide Achieve a timeless look in this Adrianna Papell® dress. Fit-and-flare silhouette. Eye-catching print allover a scuba-crepe fabrication. Bateau neckline. Short sleeves. Structured seaming throughout for a flattering fit. Concealed zipper closure at back. Lined. Straight hemline. 100% polyester;Lining: 100% polyester. Dry clean only. Imported. Measurements: Length: 38 in Product measurements were taken using size 2. Please note that measurements may vary by size.', NULL, NULL, 8, 120, 8, '41Wm2tpQdXL.jpg', 'adrianna-papell-womens-printed-dancing-sticks-scuba-crepe-no-waist-fit-and-flare-dress-navyivory-dress', 'B01M2CO6UU', 'Navy/Ivory', '41Wm2tpQdXL.SL160.jpg', 'Adrianna Papell');
INSERT INTO item_item VALUES (4182, 'Adrianna Papell Women''s Sleeveless Ggt Cocktail Dress with V-Neckline, Gunmetal, 12', 'Sleeveless beaded geometrical v-neck cocktail dress', NULL, NULL, 16, 169, 8, '41YCpJDCVL.jpg', 'adrianna-papell-womens-sleeveless-ggt-cocktail-dress-with-v-neckline-gunmetal-12', 'B01HNUY9HO', 'Gunmetal', '41YCpJDCVL.SL160.jpg', 'Adrianna Papell');
INSERT INTO item_item VALUES (4184, 'Adrianna Papell Women''s One Shoulder Jersey Halter Long Gown, Midnight, 2', 'One shoulder draped halter jersey long gown with side pleating wrap draped', NULL, NULL, 4, 169, 8, '31cYx5zDkJL.jpg', 'adrianna-papell-womens-one-shoulder-jersey-halter-long-gown-midnight-2', 'B01N1UHOJ1', 'Midnight', '31cYx5zDkJL.SL160.jpg', 'Adrianna Papell');
INSERT INTO item_item VALUES (4185, 'Adrianna Papell Women''s Beaded Long Gown with Illusion Neckline, Shell, 16', 'Elbow sleeve long covered gown with floral scroll beading and illusion neck line', NULL, NULL, 1, 349, 8, '41t081frSkL.jpg', 'adrianna-papell-womens-beaded-long-gown-with-illusion-neckline-shell-16', 'B01N0TPUEF', 'Shell', '41t081frSkL.SL160.jpg', 'Adrianna Papell');
INSERT INTO item_item VALUES (4186, 'Adrianna Papell Women''s Long Sleeve Metallic Lace Sheath Cocktail Dress, Echo Blue, 2', 'Long sleeve metallic corded lace sheath cocktail slim column dress', NULL, NULL, 3, 169, 8, '314nVZHfX7L.jpg', 'adrianna-papell-womens-long-sleeve-metallic-lace-sheath-cocktail-dress-echo-blue-2', 'B01N1UHH24', 'Echo Blue', '314nVZHfX7L.SL160.jpg', 'Adrianna Papell');
INSERT INTO item_item VALUES (4062, 'Levi''s Men''s 513 Slim Straight Fit Jean, Quincy, 36x34', 'Sits below waist', NULL, NULL, 13, 49, 6, '41hDLJZ473L.jpg', 'levis-mens-513-slim-straight-fit-jean-quincy-36x34', 'B00C7XH5GK', 'Quincy', '41hDLJZ473L.SL160.jpg', 'Levi''s');
INSERT INTO item_item VALUES (4064, 'Levi''s Men''s 550 Relaxed Fit Jean - Big & Tall, Medium Stonewash, 46x32', 'Sits at the waist with relaxed comfort fit through seat and thighs, straight legs with slightly tapered 16-1/2 inch leg opening. Pre-shrunk cotton. Machine wash. Imported.', NULL, NULL, 12, 49, 6, '41AH2jj7HRL.jpg', 'levis-mens-550-relaxed-fit-jean-big-tall-medium-stonewash-46x32', 'B0018OHQZ4', 'Medium Stonewash', '41AH2jj7HRL.SL160.jpg', 'Levi''s');
INSERT INTO item_item VALUES (4067, 'Levi''s Men''s 550 Relaxed Fit Jean, Rooster-Stretch, 34 30', 'Made in 1969 to fit over boots, the 517 bootcut jeans have been tried and true for generations. Cut to sit below the waist, slim from hip to thigh with an authentic bootcut leg. They''re durable, comfortable, and have always looked good.', NULL, NULL, 13, 39, 6, '41kgRqVpH3L.jpg', 'levis-mens-550-relaxed-fit-jean-rooster-stretch-34-30', 'B01IR8MXQK', 'Rooster - Stretch', '41kgRqVpH3L.SL160.jpg', 'Levi''s');
INSERT INTO item_item VALUES (4070, 'Levi''s Men''s Big & Tall 541 Athletic Straight-Fit Jean, Jet, 44W x 29L', 'More than 140 years after inventing the blue jean, one thing is clear: Levi''s clothes are loved by the people who wear them - from presidents to movie stars, farmers to fashion icons, entrepreneurs to the everyman. ''Live in Levi''s'' asserts with confidence and pride that Levi''s clothes are indeed for everybody who''s not just anybody.', NULL, NULL, 13, 59, 6, '416uXEkvlvL.jpg', 'levis-mens-big-tall-541-athletic-straight-fit-jean-jet-44w-x-29l', 'B00PWD0YN8', 'Jet', '416uXEkvlvL.SL160.jpg', 'Levi''s');
INSERT INTO item_item VALUES (4076, 'JACKSHIBO Men Women Unisex Couple Casual Fashion Sneakers Breathable Athletic Sports Shoes', '<b>•Brand: JACKSHIBO</b><br> <b>•Upper Material: Fly Woven Fabric</b><br> <b>•Sole Material: Anti-Slip Rubber</b><br> <b>•Platform Height: 1.18" inch<P></b><br> <b>Below it will help us choose right size for shoes, compare the chart size with your feet length carefully before ordering.Thank you!</b><br> <b>Size Chart(cm): </b><br> Women US5=EU35=Foot Length 215 -220mm<br> Women US5.5=EU36=Foot Length 220-230mm<br> Women US6=EU37=Foot Length 230-235mm<br> Women US6.5=Men US7=EU38=Foot Length 235-245mm<br> Women US7=Men US7.5= EU39=Foot Length 245-255mm<br> Women US7.5=Men US8= EU40=Foot Length 255- 260mm<br> Women US8= Men US8.5=EU41=Foot Length 260-270mm<br> Women US8.5=Men US9=EU42=Foot Length 270- 275mm<br> Men US9.5=EU43=Foot Length 275-280mm<br> Men US10=EU44=Foot Length 280- 285mm<br> Men US10.5=EU45=Foot Length 285- 290mm<br> Men US11=EU46=Foot Length 290- 295mm<br> This style is true to size if the size difference is within 1cm. <P></b><br>Features: </b> <br> - Comfort,Breathable,Non-slip and Waterproof<br> - Fit for women,men,lovers and couple<br> - Fit for Spring,Summer,Fall and Winter<br>', NULL, NULL, 10, 29, 7, '51mSudCiHnL.jpg', 'jackshibo-men-women-unisex-couple-casual-fashion-sneakers-breathable-athletic-sports-shoes', 'B01CE7QTNI', 'Black', '51mSudCiHnL.SL160.jpg', 'JACKSHIBO');
INSERT INTO item_item VALUES (4077, 'L-RUN Women''s Cute Causal Suede Walking Flat Shoes Fashion Red Sneaker 8.5 M US', '<br>L-RUN Womens'' Fashion Suede Sneakers featuring a comfortable, soft, antislip, snail appearance rubber outsole and breathable leather lining. When you wear them all day with no socks, your feet did not slip or feel sticky stay dry all day. Ideal for spring, summer, autumn, winter all season. These casual suede shoes look very cute and stylish when you go with jeans, slacks, skinny pant. Perfect for walking in all day, shopping, work, wearing daily ...and so on.<br><br>US size 4.5=EURO size 35=23cm=9 in;<br>US size 5.5=EURO size 36=23.5cm=9.25 in;<br>US size 6.5=EURO size 37=24cm=9.46 in;<br>US size 7.5=EURO size 38=24.5cm=9.65 in;<br>US size 8.5=EURO size 39=25cm=9.84 in;<br>US size 9.5=EURO size 40=25.5cm=10.04 in;<br>US size 10.5=EURO size 41=26cm=10.50 in;<br>', NULL, NULL, 13, 27, 7, '51VqY2BSTnRL.jpg', 'l-run-womens-cute-causal-suede-walking-flat-shoes-fashion-red-sneaker-85-m-us', 'B06XKBS6MM', 'Red', '51VqY2BSTnRL.SL160.jpg', 'L-RUN');
INSERT INTO item_item VALUES (4078, 'Aleader Women''s Mesh Slip On Water Shoes Blue 8 D(M) US', 'Aleader Women Water Shoe is made with lightweight mesh and a midfoot webbing system that integrates with slip on for lightweight breathability and an adaptive, supportive fit. Soft cushioning and breathable RB/Eva outsole,articulated flex grooves offer plush comfort and natural range of motion.The aqua/mesh slip on shoes can be functional used,for daily or travel walking with barefoot fitting give you exceptional comfort,for river walking or water aerobic sports,give you best performance and fun.', NULL, NULL, 20, 19, 7, '61rw9AkXNoL.jpg', 'aleader-womens-mesh-slip-on-water-shoes-blue-8-dm-us', 'B00SIFOB40', 'Blue', '61rw9AkXNoL.SL160.jpg', 'ALEADER');
INSERT INTO item_item VALUES (4079, 'Converse Chuck Taylor All Star Core Oxford Shoes OPTIC WHITE 6 Men / 8 Women', 'Old school never looked so fly. Rep your era to the fullest in a pair of these classic Chucks from Converse..', NULL, NULL, 15, 39, 7, '41SKgsOQK1L.jpg', 'converse-chuck-taylor-all-star-core-oxford-shoes-optic-white-6-men-8-women', 'B0002M30VM', 'Optical White', '41SKgsOQK1L.SL160.jpg', 'Converse');
INSERT INTO item_item VALUES (4081, 'COACH Women''s Olive Black Smoke/Black Shoe', 'Please Note: COACH™ items cannot be shipped to military addresses (APO or FPO) and addresses in Hawaii, the Virgin Islands, Guam or any other locations outside of the continental US. Enjoy that martini with extra olives in these COACH® loafers. Leather upper. Slip-on construction. Detail hardware across vamp. Moc-toe design. Leather lining. Soft leather footbed. Man-made outsole. Imported. Measurements: Weight: 8 oz Product measurements were taken using size 7.5, width M. Please note that measurements may vary by size.', NULL, NULL, 20, 49, 7, '41OKGEXY7SL.jpg', 'coach-womens-olive-black-smokeblack-shoe', 'B01LO9LKN6', 'Black Smoke/Black', '41OKGEXY7SL.SL160.jpg', 'Coach');
INSERT INTO item_item VALUES (4084, 'Mizuno Women''s Wave Catalyst-w Running Shoe, Electric Green-Yellow, 9 B US', 'Performance support for the runner that seeks a lightweight everday trainer with a touch of guidance.', NULL, NULL, 6, 83, 7, '516A1ebaISL.jpg', 'mizuno-womens-wave-catalyst-w-running-shoe-electric-green-yellow-9-b-us', 'B019PE1RYY', 'Electric Green-yellow', '516A1ebaISL.SL160.jpg', 'Mizuno');
INSERT INTO item_item VALUES (4088, 'BOBS from Skechers Women''s Plush Peace and Love Flat,Black,8.5 M US', 'A classic style with upgraded comfort comes in the SKECHERS Bobs Plush Peace and Love shoeSmooth woven canvas fabric upper Slip on casual alpargata flat design Stitching accents Tucked toe pleat front Diagonal stitched seam detail on front panel Heel panel overlay Side and heel BOBS logo tags Top elastic fabric panel for easy slip on fit Soft textured fabric shoe lining Memory Foam cushioned comfort insole Arch pillow on insole for added support Shock absorbing low profile midsole Flexible rubber crepe textured traction outsole Skechers donates new shoes to children in need when you purchase BOBS', NULL, NULL, 2, 29, 7, '316JKMhpoAL.jpg', 'bobs-from-skechers-womens-plush-peace-and-love-flatblack85-m-us', 'B00DU76CHK', 'Black', '316JKMhpoAL.SL160.jpg', 'Skechers');
INSERT INTO item_item VALUES (4090, 'TOMS Women''s Classics Flat (6.5 B(M) US Womens, Pale Pink Woven Stripe)', 'TOMS Seasonal Classics - Women''s Slip on Shoes : Turquoise Canvas : With every pair of shoes you purchase, TOMS will give a new pair of shoes to a child in need. One for One. Keep those tootsies nice and cozy inside these Seasonal Classics! Uppers comes in a variety of materials. (Materials stated in color name.) Features classic toe stitch detailing. Elastic V-panel for easy on and off. Soft textile lining. Please note that Black White Knit, Black Woolen, Light Grey Woolen, and Multi Knit colors have shearling lining. Soft texitle footbed provides light cushioning. Please note that colors Balsam Green Canvas, Barberry Pink Canvas, Black Diamond Wool, Black Glitter Wool, Black Woolen, Canal Blue Canvas, Dahlia Purple Canvas, Light Grey Woolen, Optic White Canvas, Pink Icing Canvas, Pink Lemonade Canvas, Regatta Blue Canvas, Spiced Coral Canvas, and Turkish Sea Canvas have a suede footbed. Flexible, one-piece, mixed-rubber outsole. Imported.', NULL, NULL, 20, 51, 7, '51kVunVejrL.jpg', 'toms-womens-classics-flat-65-bm-us-womens-pale-pink-woven-stripe', 'B01H61BWOS', 'Pale Pink Woven Stripe', '51kVunVejrL.SL160.jpg', 'TOMS');
INSERT INTO item_item VALUES (4092, 'ASICS Women''s Gel-Venture 5 Running Shoe, Indigo Blue/Pink Glow/Living Coral, 8 M US', 'The GEL-Venture® 5 provides great fit and everyday comfort, with Rearfoot GEL® Cushioning System and a rugged outsole ideal for a variety of terrains.', NULL, NULL, 4, 45, 7, '51t6q6u1cNL.jpg', 'asics-womens-gel-venture-5-running-shoe-indigo-bluepink-glowliving-coral-8-m-us', 'B00YDI58U2', 'Indigo Blue/Pink Glow/Living Coral', '51t6q6u1cNL.SL160.jpg', 'ASICS');
INSERT INTO item_item VALUES (4094, 'Aleader Women''s Quick Drying Aqua Water Shoes Black 8.5 D(M) US', '<b>-Soft Breathable and Quick Dry Mesh Upper</b><br>The mesh material offer double accelerated quick dry than common stretch fabric upper,and allow the foot to breathe.<br><br><b>-Easy On and Off Slip On Designing with Elastic</b> <br>The shoelace build from closed elastic offer easily on and off,protecting your foot from dropping off.<br><br><b>-Comfort and Quick Dry Water Drain Insole</b><br>Cushion absorbing EVA insole with punching,give extra support for the sole,that creates a cooler and healthier shoe environment.<br><br><b>-Powerful Light and Cushion Absorbing Water Sole</b><br>Unlike most of the heavy Rubber water sole,this supper light EVA barefoot sole with fast water drain design that guarantee you have better performance from your sports.Combined with Rubber piece ensure the slip resistance,while the EVA giving the Cushion Absorbing support and durable.<br><br><b>-Recommended for Multi functional Using</b><br>A good pair of comfort walking shoes,aqua water shoes,beach shoes,fishing shoes,gym exercise shoes,and suitable for any outdoor adventure exploring.A pair of shoes you much have!<br><br><b>About Aleader</b><br>Aleader committed to leading the sport life and providing original designs,develops and markets lifestyle also performance footwear that appeals to trend-savvy men,women and children.Aleader offers looks for every activity across a diverse range of collections.Athletic aqua gear and casual lifestyle sneakers,boots and sandals featuring lightweight sole and comfortable fit.', NULL, NULL, 14, 26, 7, '61t54UNGqBL.jpg', 'aleader-womens-quick-drying-aqua-water-shoes-black-85-dm-us', 'B01G1FHB8G', 'Black', '61t54UNGqBL.SL160.jpg', 'ALEADER');
INSERT INTO item_item VALUES (4097, 'ASICS Women''s Gel-contend 3 Running Shoe, White/Knock Out Pink/Indigo Blue, 8 M US', 'A neutral trainer that is ideal for the new or low-mileage runner. Open mesh upper with supportive synthetic overlays. Exterior boasts reflectivity for low-light visibility. Lightly cushioned tongue and collar for added comfort. Breathable textile lining offers a great step-in feel. Removable sockliner can accommodate an orthotic. Rearfoot GEL® cushioning system attenuates impacting shock and allows for a smooth transition to midstance. Durable rubber outsole offers lightweight cushioning.', NULL, NULL, 20, 36, 7, '51dZQ5WhnkL.jpg', 'asics-womens-gel-contend-3-running-shoe-whiteknock-out-pinkindigo-blue-8-m-us', 'B00OU89H98', 'White/Knock Out Pink/Indigo Blue', '51dZQ5WhnkL.SL160.jpg', 'ASICS');
INSERT INTO item_item VALUES (4099, 'DREAM PAIR SOLE-SIMPLE New Women''s Classic Solid Plain Design Comfort Ballerina Walking Flats Shoes GOLD GLITTER SIZE 10', 'From classic ballet flats in strong vivid fun colors to animal print skimmers, our collection of flats can complement your outfits easily. Most importantly, they are very comfortable for your feet and easy on your wallet! FITTING TIPS:WIDE WIDTH CUSTOMERS, ORDER 1/2 SIZE UP FOR BETTER FIT.', NULL, NULL, 19, 19, 7, '41gSV3bbuL.jpg', 'dream-pair-sole-simple-new-womens-classic-solid-plain-design-comfort-ballerina-walking-flats-shoes-gold-glitter-size-10', 'B01MYXNBY6', 'Gold Glitter', '41gSV3bbuL.SL160.jpg', 'DREAM PAIRS');
INSERT INTO item_item VALUES (4101, 'Nike Free 5.0+ Womens Running Shoes 580591-002 Black 9 M US', 'Taking a cue from the barefoot, it''s designed to maximize a foot''s natural range of motion while providing protection and cushioning for a smooth ride.', NULL, NULL, 17, 79, 7, '414RcIwk6kL.jpg', 'nike-free-50-womens-running-shoes-580591-002-black-9-m-us', 'B0098SKGTA', 'Black/Metallic Silver/Dark Grey/White', '414RcIwk6kL.SL160.jpg', 'Nike');
INSERT INTO item_item VALUES (4188, 'Adrianna Papell Women''s High Low Wrap Dress, Blue/Multi, L', 'Halter neck high/low printed wrap dress with waist detail embellishment', NULL, NULL, 11, 120, 8, '41T9cpmt0dL.jpg', 'adrianna-papell-womens-high-low-wrap-dress-bluemulti-l', 'B01N81BJ4T', 'Blue/Multi', '41T9cpmt0dL.SL160.jpg', 'Adrianna Papell');
INSERT INTO item_item VALUES (4300, 'Frenchic Fishnet Lace Stocking Tights Extended Sizes (Pack of 6) (S/M), Black', '6 Pairs Elegant Fishnet Lace Tights Extended Sizes Girls love tights. It''s something we can''t deny. No matter the occasion, we always try to incorporate them into our outfits. So when funky tights like these Elegant Fishnet Lace Tights make an appearance, it''s impossible to resist slipping them on under skirts, dresses, and even shorts! Jump on this deal and land yourself 6 pairs of incredible tights that will create well-deserving whiplash, even in the most discerning fashionista crowd', NULL, NULL, 8, 23, 9, '61WDtm27hL.jpg', 'frenchic-fishnet-lace-stocking-tights-extended-sizes-pack-of-6-sm-black', 'B014VKU7BG', 'Black', '61WDtm27hL.SL160.jpg', 'Frenchic');
INSERT INTO item_item VALUES (4304, 'Frenchic Fishnet Lace Stocking Tights Extended Sizes (Pack of 6) (M/L), Black', '6 Pairs Elegant Fishnet Lace Tights Extended Sizes Girls love tights. It''s something we can''t deny. No matter the occasion, we always try to incorporate them into our outfits. So when funky tights like these Elegant Fishnet Lace Tights make an appearance, it''s impossible to resist slipping them on under skirts, dresses, and even shorts! Jump on this deal and land yourself 6 pairs of incredible tights that will create well-deserving whiplash, even in the most discerning fashionista crowd', NULL, NULL, 16, 23, 9, '619Qf6eCErL.jpg', 'frenchic-fishnet-lace-stocking-tights-extended-sizes-pack-of-6-ml-black', 'B01554ZTNS', 'Black', '619Qf6eCErL.SL160.jpg', 'Frenchic');
INSERT INTO item_item VALUES (4194, 'Maggy London Women''s Fractured Pansy Print Jersey Shift Dress, Black/Red, 8', 'Fractured pansy printed jersey fit and flare featuring scoop neck, short sleeve and on trend uneven hem', NULL, NULL, 6, 98, 8, '41Oz8GvHMqL.jpg', 'maggy-london-womens-fractured-pansy-print-jersey-shift-dress-blackred-8', 'B01MDU318S', 'Black/Red', '41Oz8GvHMqL.SL160.jpg', 'Maggy London');
INSERT INTO item_item VALUES (4196, 'Maggy London Women''s Artistic Bloom Jersey Sheath, Blue/Sunset, 12', 'Artistic bloom winter floral jersey sheath. The perfect desk to dinner silhouette.', NULL, NULL, 3, 89, 8, '413TeR8CpL.jpg', 'maggy-london-womens-artistic-bloom-jersey-sheath-bluesunset-12', 'B01KKKG1F2', 'Blue/Sunset', '413TeR8CpL.SL160.jpg', 'Maggy London');
INSERT INTO item_item VALUES (4308, 'Frenchic Seamless Fishnet Lace Stocking Tights - Extended Sizes (Pack of 6) (M-L), Black', 'Girls love tights. It''s something we can''t deny. No matter the occasion, we always try to incorporate them into our outfits. So when funky tights like these Elegant Fishnet Lace Tights make an appearance, it''s impossible to resist slipping them on under skirts, dresses, and even shorts! Jump on this deal and land yourself 6 pairs of incredible tights that will create well-deserving whiplash, even in the most discerning fashionista crowd', NULL, NULL, 14, 23, 9, '618njNQjHnL.jpg', 'frenchic-seamless-fishnet-lace-stocking-tights-extended-sizes-pack-of-6-m-l-black', 'B01576M2GG', 'Black', '618njNQjHnL.SL160.jpg', 'Frenchic');
INSERT INTO item_item VALUES (4310, 'Frenchic Seamless Sexy Fishnet Lace Stocking Tights Extended Sizes (Pack of 6) (S/M, 1011)', '6 Pairs Elegant Fishnet Lace Tights Extended Sizes Girls love tights. It''s something we can''t deny. No matter the occasion, we always try to incorporate them into our outfits. So when funky tights like these Elegant Fishnet Lace Tights make an appearance, it''s impossible to resist slipping them on under skirts, dresses, and even shorts! Jump on this deal and land yourself 6 pairs of incredible tights that will create well-deserving whiplash, even in the most discerning fashionista crowd', NULL, NULL, 12, 22, 9, '61Vxij9sPIL.jpg', 'frenchic-seamless-sexy-fishnet-lace-stocking-tights-extended-sizes-pack-of-6-sm-1011', 'B01M7M9KQT', '1011', '61Vxij9sPIL.SL160.jpg', 'Frenchic');
INSERT INTO item_item VALUES (4313, 'Frenchic Fishnet Lace Stocking Tights Extended Sizes (Pack of 3) (3X/4X, 3Pack-1005-A)', '3 Pairs Elegant Fishnet Lace Tights Extended Sizes Girls love tights. It''s something we can''t deny. No matter the occasion, we always try to incorporate them into our outfits. So when funky tights like these Elegant Fishnet Lace Tights make an appearance, it''s impossible to resist slipping them on under skirts, dresses, and even shorts! Jump on this deal and land yourself 3 pairs of incredible tights that will create well-deserving whiplash, even in the most discerning fashionista crowd', NULL, NULL, 5, 14, 9, '61MaiiRnEXL.jpg', 'frenchic-fishnet-lace-stocking-tights-extended-sizes-pack-of-3-3x4x-3pack-1005-a', 'B01MSM20PT', '3pack-1005-a', '61MaiiRnEXL.SL160.jpg', 'Frenchic');
INSERT INTO item_item VALUES (4316, 'Frenchic 12 Pairs Pack Women Opaque Stretchy Spandex Knee High Trouser Socks Assorted (6 Black-6 Beige)', 'One of the best qualities a person can have is flexibility. Adapting to a world in flux is useful at home, in the office, and while pursuing your hobbies. Socks, like people, should also be flexible. These stretch knee-high socks are perfect for ladies who love to wear pants. The blend of fabrics stretches and adapts to your body. And the comfort band helps keep these knee socks at your knees. So don''t miss out on this brilliant deal. Order it today!', NULL, NULL, 1, 18, 9, '41G2BpwV1vL.jpg', 'frenchic-12-pairs-pack-women-opaque-stretchy-spandex-knee-high-trouser-socks-assorted-6-black-6-beige', 'B01AX05MPE', '6 Black-6 Beige', '41G2BpwV1vL.SL160.jpg', 'Frenchic');
INSERT INTO item_item VALUES (4322, 'Calvin Klein Jeans Womens Easy Short, 911 Parker, 10', 'Belt loops Button waistband Cotton', NULL, NULL, 2, 12, 10, '41ZjkNM2Bq0L.jpg', 'calvin-klein-jeans-womens-easy-short-911-parker-10', 'B01FQGAT3U', 'Parker', '41ZjkNM2Bq0L.SL160.jpg', 'Calvin Klein');
INSERT INTO item_item VALUES (4324, 'Calvin Klein Womens Linen Short (8, Midnight Oil)', '6 belt loop waistband to accommodate a 2 (in) wide belt 2 front slant pockets with button closure 2 back welt pockets with button closure Side slits at bottom hem and at back Imported', NULL, NULL, 11, 29, 10, '41M78v761L.jpg', 'calvin-klein-womens-linen-short-8-midnight-oil', 'B01GB259A6', 'Midnight Oil', '41M78v761L.SL160.jpg', 'Calvin Klein');
INSERT INTO item_item VALUES (4326, 'Calvin Klein Jeans Women''s Garment Dyed Weekend Short, Vanilla Ice, 33', 'Ultra-chic dyed weekend shorts in slub twill featuring a stylish distressed hem and a belt loop waistline with a classic 5 pocket design.', NULL, NULL, 20, 59, 10, '41IpUXv23kL.jpg', 'calvin-klein-jeans-womens-garment-dyed-weekend-short-vanilla-ice-33', 'B01N6KYGAC', 'Vanilla Ice', '41IpUXv23kL.SL160.jpg', 'Calvin Klein');
INSERT INTO item_item VALUES (4328, 'Calvin Klein Jeans Women''s Tacked Garment Dyed City Short, Quarry, 26', 'Modern tacked dyed city shorts in slub twill feature a belt loop waistline and classic 5 pocket design.', NULL, NULL, 6, 59, 10, '31q2BQ43FmgL.jpg', 'calvin-klein-jeans-womens-tacked-garment-dyed-city-short-quarry-26', 'B01N2WP64G', 'Quarry', '31q2BQ43FmgL.SL160.jpg', 'Calvin Klein');
INSERT INTO item_item VALUES (4331, 'Calvin Klein Performance Women''s Jersey Rollover Waistband Cargo Bermuda Short 12" Inseam, Navy, L', 'Calvin Klein performance creates active clothing for women that can be worn to the gym or for casual everyday wear. A special focus for Calvin Klein performance is capturing fun, fashion trends and using easy to care fabrics to keep you looking stylish and comfortable for your workouts and all your casual activities. Calvin Klein performance makes something for every woman, no matter what your size or lifestyle demands.', NULL, NULL, 7, 49, 10, '41mggHMS5YL.jpg', 'calvin-klein-performance-womens-jersey-rollover-waistband-cargo-bermuda-short-12-inseam-navy-l', 'B01N4PPQPS', 'Navy', '41mggHMS5YL.SL160.jpg', 'Calvin Klein');
INSERT INTO item_item VALUES (4334, 'Calvin Klein Performance Women''s Rollover Waistband Cargo Short with Side Ties, Quail, X-Large', 'Calvin Klein Performance creates active clothing for women that can be worn to the gym or for casual everyday wear. A special focus for Calvin Klein Performance is capturing fun, fashion trends and using easy-to-care fabrics to keep you looking stylish and comfortable for your workouts and all your casual activities. Calvin Klein Performance makes something for every woman, no matter what your size or lifestyle demands.', NULL, NULL, 9, 34, 10, '41gIJdIsIOL.jpg', 'calvin-klein-performance-womens-rollover-waistband-cargo-short-with-side-ties-quail-x-large', 'B01DEB358U', 'Quail', '41gIJdIsIOL.SL160.jpg', 'Calvin Klein');
INSERT INTO item_item VALUES (4339, 'Calvin Klein Women''s Pure Seamless Boyshort, Black, X-Large', 'Seam-free edges creating a clean look that is invisible under clothes', NULL, NULL, 6, 9, 10, '418D4TCevAL.jpg', 'calvin-klein-womens-pure-seamless-boyshort-black-x-large', 'B013KQGABS', 'Black', '418D4TCevAL.SL160.jpg', 'Calvin Klein');
INSERT INTO item_item VALUES (4343, 'Calvin Klein Jeans Women''s Boyfriend Short, Casper Blue, 30', '7 inch boyfriend short with rolled button', NULL, NULL, 10, 13, 10, '418kQVfLGL.jpg', 'calvin-klein-jeans-womens-boyfriend-short-casper-blue-30', 'B00G69C5EI', 'Casper Blue', '418kQVfLGL.SL160.jpg', 'Calvin Klein');
INSERT INTO item_item VALUES (4347, 'Calvin Klein Performance Women''s Woven Rollover Waist Cargo Short, White, Small', 'Calvin Klein Performance creates active clothing for women that can be worn to the gym or for casual everyday wear. A special focus for Calvin Klein Performance is capturing fun, fashion trends and using easy-to-care fabrics to keep you looking stylish and comfortable for your workouts and all your casual activities. Calvin Klein Performance makes something for every woman, no matter what your size or lifestyle demands.', NULL, NULL, 9, 29, 10, '31LHWNcHhTL.jpg', 'calvin-klein-performance-womens-woven-rollover-waist-cargo-short-white-small', 'B01BVA76RW', 'White', '31LHWNcHhTL.SL160.jpg', 'Calvin Klein');
INSERT INTO item_item VALUES (4351, 'Calvin Klein Jeans Women''s City Shorts, Dusted Ink 28', 'Modern city shorts featuring a classic five pocket design with belt loop waistband and button fly enclosure.', NULL, NULL, 17, 29, 10, '41Xub2B99NL.jpg', 'calvin-klein-jeans-womens-city-shorts-dusted-ink-28', 'B0131M8UPU', 'Dusted Ink', '41Xub2B99NL.SL160.jpg', 'Calvin Klein');
INSERT INTO item_item VALUES (5129, 'True Blue (180 Gram Vinyl)', 'Limited 180 gram vinyl pressing of the 1986 album that gave US the hits "Papa Don''t Preach," "Live to Tell," and "Open Your Heart."', NULL, NULL, 7, 12, 18, '51oWnjKLCrL.jpg', 'true-blue-180-gram-vinyl', 'B007BWUKS2', '', '51oWnjKLCrL.SL160.jpg', 'VINYL');
INSERT INTO item_item VALUES (4198, 'Maggy London Women''s Daisy Bloom Scuba Sheath, Soft White/Grey, 4', 'Daisy bloom printed scuba sleeveless sheath. Great transitional style that''s perfect for desk to dinner.', NULL, NULL, 7, 128, 8, '4171Ic1zPaL.jpg', 'maggy-london-womens-daisy-bloom-scuba-sheath-soft-whitegrey-4', 'B01LXW9YZK', 'Soft White/Grey', '4171Ic1zPaL.SL160.jpg', 'Maggy London');
INSERT INTO item_item VALUES (4200, 'Maggy London Women''s Ikat Poppy Scuba Sheath, Soft White/Cobalt, 4', 'Ikat poppy scuba sheath. A new take on spring floral with front and back print placement.', NULL, NULL, 2, 69, 8, '31LK1zYvM3L.jpg', 'maggy-london-womens-ikat-poppy-scuba-sheath-soft-whitecobalt-4', 'B01M69YY46', 'Soft White/Cobalt', '31LK1zYvM3L.SL160.jpg', 'Maggy London');
INSERT INTO item_item VALUES (4202, 'Maggy London Women''s Illusion Dress, Blush, 14', 'Illusion dress featuring longer length crepe bodice and mesh illusion yoke', NULL, NULL, 16, 148, 8, '31V6gnrDp5L.jpg', 'maggy-london-womens-illusion-dress-blush-14', 'B00UR9A4GE', 'Blush', '31V6gnrDp5L.SL160.jpg', 'Maggy London');
INSERT INTO item_item VALUES (4204, 'Maggy London Women''s Brushed Flower Printed Chiffon with Cold Shoulder, Pink, 12', 'Brushed flower blur printed chiffon trapeze with double exposed cold shoulder', NULL, NULL, 14, 82, 8, '41163UUYi9L.jpg', 'maggy-london-womens-brushed-flower-printed-chiffon-with-cold-shoulder-pink-12', 'B01AUOR062', 'Pink', '41163UUYi9L.SL160.jpg', 'Maggy London');
INSERT INTO item_item VALUES (4207, 'Maggy London Women''s Dahlia Burnout Novelty Scuba Sheath, Black, 16', 'Novelty burn out scuba sheath featuring mesh illusion yoke', NULL, NULL, 3, 135, 8, '41eNH8QfASL.jpg', 'maggy-london-womens-dahlia-burnout-novelty-scuba-sheath-black-16', 'B01I4QFVRS', 'Black', '41eNH8QfASL.SL160.jpg', 'Maggy London');
INSERT INTO item_item VALUES (4209, 'Maggy London Women''s Color Block Crepe Sheath, Cream/Navy, 14', 'Color block off the shoulder crepe sheath. A fresh update to the classic cocktail silhouette.', NULL, NULL, 10, 69, 8, '31xOvv2Bn5GL.jpg', 'maggy-london-womens-color-block-crepe-sheath-creamnavy-14', 'B01M2AIMPH', 'Cream/Navy', '31xOvv2Bn5GL.SL160.jpg', 'Maggy London');
INSERT INTO item_item VALUES (4211, 'Maggy London Women''s Firework Garden Blossom Texture Novelty Sheath, White Coral, 4', 'Firework garden blossom texture novelty sheath. A bold take on spring floral in a classic, cocktail silhouette.', NULL, NULL, 15, 128, 8, '41nC4XVt8RL.jpg', 'maggy-london-womens-firework-garden-blossom-texture-novelty-sheath-white-coral-4', 'B01M8MDLBU', 'White Coral', '41nC4XVt8RL.SL160.jpg', 'Maggy London');
INSERT INTO item_item VALUES (4212, 'Maggy London Women''s Mum Jacquard Fit-And-Flare Dress, Coral, 4', 'Mum jacquard novelty fit and flare', NULL, NULL, 6, 148, 8, '318QeYTfisL.jpg', 'maggy-london-womens-mum-jacquard-fit-and-flare-dress-coral-4', 'B01AYT55N8', 'Coral', '318QeYTfisL.SL160.jpg', 'Maggy London');
INSERT INTO item_item VALUES (4213, 'Maggy London Women''s Twin Etched Flower Scuba Sheath, Soft White/Violet, 14', 'Twin etched flower scuba sheath featuring solid scuba top and printed scuba skirt.', NULL, NULL, 5, 118, 8, '41XA5upJgSL.jpg', 'maggy-london-womens-twin-etched-flower-scuba-sheath-soft-whiteviolet-14', 'B01MFFHXUG', 'Soft White/Violet', '41XA5upJgSL.SL160.jpg', 'Maggy London');
INSERT INTO item_item VALUES (4216, 'Maggy London Women''s Bavarian Leaf Lace Fit and Flare, Rose Trellis, 12', 'Novelty cocktail scroll leaf lace fit and flare. The ultimate cocktail dress in on trend red for holiday.', NULL, NULL, 2, 67, 8, '41ZmMGhmJL.jpg', 'maggy-london-womens-bavarian-leaf-lace-fit-and-flare-rose-trellis-12', 'B01K8W1PUS', 'Rose Trellis', '41ZmMGhmJL.SL160.jpg', 'Maggy London');
INSERT INTO item_item VALUES (4218, 'Maggy London Women''s Fan Leaf Lace Midi Dress, Blue Indigo, 4', 'Novelty fan leaf lace sleeveless cocktail sheath; a new take on the little black dress', NULL, NULL, 2, 71, 8, '31I42BJQzjQL.jpg', 'maggy-london-womens-fan-leaf-lace-midi-dress-blue-indigo-4', 'B01KKM73I4', 'Blue Indigo', '31I42BJQzjQL.SL160.jpg', 'Maggy London');
INSERT INTO item_item VALUES (4221, 'Maggy London Women''s Vine Flower Lace Fit and Flare, White, 6', 'Vine flower lace cocktail fit and flare. The perfect little white dress.', NULL, NULL, 4, 168, 8, '41rHrkziHjL.jpg', 'maggy-london-womens-vine-flower-lace-fit-and-flare-white-6', 'B01M0TN0VP', 'White', '41rHrkziHjL.SL160.jpg', 'Maggy London');
INSERT INTO item_item VALUES (4223, 'Maggy London Women''s Feathered Floral Scuba Fit and Flare Dress, Black/Aqua, 10', 'Feathered floral printed scuba fit and flare featuring v-neck', NULL, NULL, 16, 64, 8, '41Xt84BsBvL.jpg', 'maggy-london-womens-feathered-floral-scuba-fit-and-flare-dress-blackaqua-10', 'B01AXVYXX0', 'Black/Aqua', '41Xt84BsBvL.SL160.jpg', 'Maggy London');
INSERT INTO item_item VALUES (4228, 'Merry Style Womens Opaque Tights Microfiber Hiver 40 DEN Yellow Medium', 'Smooth, extremely soft and comfortable tights. The density of 40 DEN makes the tights have an average thickness and are translucent. This makes them extremely versatile and suitable for all seasons. The tights are sewn with flexible, high-quality microfiber, which adheres nicely to the body. Thanks to this they look perfect on the legs and have a great comfort of wearing. Colors displayed may vary slightly from depictions on the monitor due to screen differences. Material Composition: 86% Polyamide, 14% Elastane', NULL, NULL, 5, 8, 9, '31euT8ozc1L.jpg', 'merry-style-womens-opaque-tights-microfiber-hiver-40-den-yellow-medium', 'B00FJYMWTE', 'Yellow', '31euT8ozc1L.SL160.jpg', 'Merry Style');
INSERT INTO item_item VALUES (4232, 'Merry Style Womens Opaque Tights Microfiber Caldo 70 DEN Jeans Large', 'Smooth, extremely soft and comfortable tights. The density of the weave of fibers of 70 DEN makes them strong and warm, ideal for the autumn-winter season. The tights are sewn with flexible, high-quality microfiber, which adheres nicely to the body. Thanks to this they look perfect on the legs and have a great comfort of wearing. Colors displayed may vary slightly from depictions on the monitor due to screen differences. Material Composition: 86% Polyamide, 14% Elastane', NULL, NULL, 12, 9, 9, '31uamFKsT5L.jpg', 'merry-style-womens-opaque-tights-microfiber-caldo-70-den-jeans-large', 'B00FJYNMRU', 'Jeans', '31uamFKsT5L.SL160.jpg', 'Merry Style');
INSERT INTO item_item VALUES (4234, 'Merry Style Women Tights MS 387 (Black, L)', 'Women''s tights with a pattern imitating sexy socks. Tights are made of microfiber, with the addition of Lycra® fiber and braided polyamide silk. The original Lycra® fibers have a large stretching capacity (up to 600%) and is able to return to its original shape. Microfiber is also characterized by its unique flexibility. Moreover it is extremely durable and resistant to wrinkling. With these features they are perfectly presented on the legs and are extremely durable. Merry Style brand products guarantee style, quality, and comfort. Material of the highest quality go hand in hand with precise and solid workmanship and stylish designs. Colors displayed may vary slightly from depictions on the monitor due to screen differences. Material Composition: 85% Polyamide, 15% Elastane', NULL, NULL, 19, 10, 9, '31UjGxlegeL.jpg', 'merry-style-women-tights-ms-387-black-l', 'B018UAG6EU', 'Black', '31UjGxlegeL.SL160.jpg', 'Merry Style');
INSERT INTO item_item VALUES (4236, 'Merry Style Women Carnival Tights MS 332 60 DEN, Graphite, L', 'Women''s tights with a pattern imitating sexy socks. Tights are made of microfiber, with the addition of Lycra® fibers. The original Lycra® fibers have a large stretching capacity (up to 600%) and is able to return to its original shape. Microfiber is also characterized by its unique flexibility. Moreover it is extremely durable and resistant to wrinkling. With these features they are perfectly presented on the legs and are extremely durable. Merry Style brand products guarantee style, quality, and comfort. Material of the highest quality go hand in hand with precise and solid workmanship and stylish designs. Colors displayed may vary slightly from depictions on the monitor due to screen differences. Material Composition: 85% Polyamide, 15% Elastane', NULL, NULL, 11, 9, 9, '31yEWmoUDZL.jpg', 'merry-style-women-carnival-tights-ms-332-60-den-graphite-l', 'B019P2M8IA', 'Graphite', '31yEWmoUDZL.SL160.jpg', 'Merry Style');
INSERT INTO item_item VALUES (4813, 'URPOWER 2nd Version Essential Oil Diffuser,100ml Aroma Essential Oil Cool Mist Humidifier with Adjustable Mist Mode,Waterless Auto Shut-off and 7 Color LED Lights Changing for Home Office Baby', 'Notes:</br></br> Oil is not included in the package.</br> To prolong the lifetime of the item,please keep it try and clean when storing.</br> If the water added over max line, the mist will be very thin(less water, more mist).</br> If the ultrasonic wave chip was polluted, it may cause error action or default.</br> Please don''t touch the internal ultrasonic wave vibration board inside of the water tank directly with your hands.</br></br> Decription:</br></br> Looking for a simple way to calm and freshen a room? The URPOWER Ultrasonic Aroma Essential Oil Diffuser is elegant and easy to use. just add 100ML of water and a few drops of your favorite essential oil. Advanced ultrasonic vaporizing diffusion technology quietly releases a soothing fragrant mist up to 6 hours.Automatic shut off safety system when waterless protects the product from being burned out. Keep essential oil 100% natural without burning or heating and automatic shut off safely.</br></br> The URPOWER ultrasonic aroma humidifier does double duty to make your home fresher and healthier for up to 6 hours. First, the humidifier function adds moisture to the air to help you sleep better, cough less and alleviate dry sinuses. This handy unit also diffuses your favorite scented oils without heat, so their holistic properties stay intact. The result is healthful, moist air that smells subtly fresh and clean.</br></br> Features:</br></br> No filters required</br> Whisper-quiet operation</br> Auto shutoff for safety</br> Visually appealing, modern Japanese design</br> Helps with dry, chapped skin, chapped lips and dry sinuses</br></br> Works with ordinary tap water, plus 2 to 3 drops of essential oil Specifications: </br></br> Size:3.1"x5.5" </br> Material: Upper parts PP</br> Input power: AC100-240V 50/60HZ</br> Advanced ultrasonic technology: 2.4MHZ</br> Length of the power supply cable: about 69.6 inch</br></br> Package Includes:</br></br> 1 x Oil Diffuser</br> 1 x Charger Adaptor</br> 1 x Measuring cup</br> 1 x Manual', NULL, NULL, 16, 19, 13, '31GwYHJauNL.jpg', 'urpower-2nd-version-essential-oil-diffuser100ml-aroma-essential-oil-cool-mist-humidifier-with-adjustable-mist-modewaterless-auto-shut-off-and-7-color-led-lights-changing-for-home-office-baby', 'B00Y2CQRZY', 'White', '31GwYHJauNL.SL160.jpg', 'URPOWER');
INSERT INTO item_item VALUES (4239, 'Merry Style Women Tights MS 262 40 DEN, Black, M', 'Tights with an original pattern imitating stockings on a garter belt. Tights are made of microfiber, with the addition of Lycra® fiber and braided polyamide silk. The original Lycra® fibers have a large stretching capacity (up to 600%) and is able to return to its original shape. Microfiber is also characterized by its unique flexibility. Moreover it is extremely durable and resistant to wrinkling. With these features they are perfectly presented on the legs and are extremely durable. Merry Style brand products guarantee style, quality, and comfort. Material of the highest quality go hand in hand with precise and solid workmanship and stylish designs. Colors displayed may vary slightly from depictions on the monitor due to screen differences. Material Composition: 85% Polyamide, 15% Elastane', NULL, NULL, 6, 10, 9, '31QjRd4ueL.jpg', 'merry-style-women-tights-ms-262-40-den-black-m', 'B018UAFTPW', 'Black', '31QjRd4ueL.SL160.jpg', 'Merry Style');
INSERT INTO item_item VALUES (4241, 'Merry Style Women Fine Mesh Stockings Patterned MS 272, Nero/Cobalt, M', 'Luxurious microfiber tights, made with Lycra® 3D technology. The original Lycra® fibers have a large stretching capacity (up to 600%) and is able to return to its original shape. This feature is further enhanced by the 3D weaving technology in which the fabric is knitted in different directions. Thanks to this the tights are durable, extra flexible, and extremely smooth. Fits very well to the body. Merry Style brand products guarantee style, quality, and comfort. Material of the highest quality go hand in hand with precise and solid workmanship and stylish designs. Colors displayed may vary slightly from depictions on the monitor due to screen differences. Material Composition: 85% Polyamide, 15% Elastane', NULL, NULL, 12, 10, 9, '31G0lXq6pSL.jpg', 'merry-style-women-fine-mesh-stockings-patterned-ms-272-nerocobalt-m', 'B019FJ846S', 'Nero/Cobalt', '31G0lXq6pSL.SL160.jpg', 'Merry Style');
INSERT INTO item_item VALUES (4243, 'Merry Style Womens Carnival Tights Tida 60 DEN, Navy Blue, S', 'Tights in a pattern that imitates sexy knee socks worn on pantyhose. Tights are made of microfiber, with the addition of Lycra® fiber and braided polyamide silk. The original Lycra® fibers have a large stretching capacity (up to 600%) and is able to return to its original shape. Microfiber is also characterized by its unique flexibility. Moreover it is extremely durable and resistant to wrinkling. With these features they are perfectly presented on the legs and are extremely durable. Merry Style brand products guarantee style, quality, and comfort. Material of the highest quality go hand in hand with precise and solid workmanship and stylish designs. Colors displayed may vary slightly from depictions on the monitor due to screen differences. Material Composition: 85% Polyamide, 15% Elastane', NULL, NULL, 1, 10, 9, '31X507Fla6L.jpg', 'merry-style-womens-carnival-tights-tida-60-den-navy-blue-s', 'B019P2TS2E', 'Navy Blue', '31X507Fla6L.SL160.jpg', 'Merry Style');
INSERT INTO item_item VALUES (4246, 'Merry Style Womens Hold Up Stockings Romantica 15 DEN Bianco XS/S', 'Sexy hold up stockings with elastic fibers. Finished with beautiful lace. Silicone straps prevent from slipping. The best comfort of wearing. Extra quality. Material Composition: 88% Polyamide, 12% Spandex', NULL, NULL, 12, 2, 9, '31EZ4YtBIKL.jpg', 'merry-style-womens-hold-up-stockings-romantica-15-den-bianco-xss', 'B00PUFSVIS', 'Bianco', '31EZ4YtBIKL.SL160.jpg', 'Merry Style');
INSERT INTO item_item VALUES (4250, 'Merry Style Womens Hold Up Stockings Microfiber 40 DEN Avana, M/L', 'Elegant stockings finished with wide lace on silicone. The thickness of 40 DEN makes the tights have an average thickness and become translucent. They are extremely versatile and suitable for all seasons. Colors displayed may vary slightly from depictions on the monitor due to screen differences. Material Composition: 86% Polyamide, 14% Spandex', NULL, NULL, 6, 5, 9, '31BtUdNtbnL.jpg', 'merry-style-womens-hold-up-stockings-microfiber-40-den-avana-ml', 'B018M5D97A', 'Avana', '31BtUdNtbnL.SL160.jpg', 'Merry Style');
INSERT INTO item_item VALUES (4253, 'Merry Style Women transparent Suspender Stockings MS 226 15 DEN, Neutro, XS/S', 'Classic stockings with the addition of Lycra® fibers, intended to be worn with a hip belt. The original Lycra® fibers have a large stretching capacity (up to 600%) and is able to return to its original shape. Thanks to this the stockings are resilient, durable, and perfectly fit to the body. No separate toe portion, which makes it perfectly present themselves with open-toed shoes. Merry Style brand products guarantee style, quality, and comfort. Material of the highest quality go hand in hand with precise and solid workmanship and stylish designs. Colors displayed may vary slightly from depictions on the monitor due to screen differences. Material Composition: 85% Polyamide, 15% Elastane', NULL, NULL, 20, 7, 9, '31cgxZsJTrL.jpg', 'merry-style-women-transparent-suspender-stockings-ms-226-15-den-neutro-xss', 'B018UAF0V0', 'Neutro', '31cgxZsJTrL.SL160.jpg', 'Merry Style');
INSERT INTO item_item VALUES (4260, 'MOOCHI Women 80 Denier Semi Opaque Tights (Purple), one size', 'Material: 85% Nylon, 14% Spandex, 1% Cotton <br> Size: one size fits <br>Height 4''11"-5''11" (155-180cm) <br> Weight 100-180LBS (45-80KG) <br> Hip Size 2''4"-4'' (70-120cm) <br> Colors: Black, Red, Purple, Blue, White, Coffee, Green, Gray, Ash Black, Orange, Light Pink, Deep Pink <br>', NULL, NULL, 2, 9, 9, '31LYGGh9NlL.jpg', 'moochi-women-80-denier-semi-opaque-tights-purple-one-size', 'B00VQ6YK94', 'Purple', '31LYGGh9NlL.SL160.jpg', 'Moochi');
INSERT INTO item_item VALUES (4263, 'Moochi Women 20 Denier Ultra Sheer Thigh High Stockings Silicone Lace (White)', 'Moochi women 20D sheer tights can make your sexy and beautiful. We use the best material and critical manufacture process to make sure you can have the great quality tights.', NULL, NULL, 13, 8, 9, '31ff92WqdeL.jpg', 'moochi-women-20-denier-ultra-sheer-thigh-high-stockings-silicone-lace-white', 'B012MSC6AO', 'White', '31ff92WqdeL.SL160.jpg', 'Moochi');
INSERT INTO item_item VALUES (4266, 'Moochi Women''s 10 Denier Ultra Sheer T Crotch Silky Tights (Black)', 'Moochi thin tights- 10 D ultra sheer to invisible <br> Material: 85% nylon, 15% spandex <br> One size fits: height under 6''1" weight 160lbs <br> make your legs invisible smooth,shinning,breathable and firm <br> control top, sexy T crotch style <br>', NULL, NULL, 13, 7, 9, '41nI2BF7FHHL.jpg', 'moochi-womens-10-denier-ultra-sheer-t-crotch-silky-tights-black', 'B0185OZ0VQ', 'Black', '41nI2BF7FHHL.SL160.jpg', 'Moochi');
INSERT INTO item_item VALUES (4270, '(Pack of 3 Pairs) Moochi Women''s Opaque Footed Solid Color Tights (Green)', 'Material: 85% Nylon, 14% Spandex, 1% Cotton <br> Size: one size fits <br>Height 4''11"-5''11" (155-180cm) <br> Weight 100-180LBS (45-80KG) <br> Hip Size 2''4"-4'' (70-120cm) <br> Colors: Black, Red, Purple, Blue, White, Coffee, Green, Gray, Ash Black, Orange, Light Pink, Deep Pink <br>', NULL, NULL, 5, 17, 9, '41wrZJRxlL.jpg', 'pack-of-3-pairs-moochi-womens-opaque-footed-solid-color-tights-green', 'B00XRHJUOU', 'Green', '41wrZJRxlL.SL160.jpg', 'Moochi');
INSERT INTO item_item VALUES (4274, 'Moochi Women''s 5 Denier Ultra Sheer Oiled Shinning Control Top Tights', 'Moochi the most thin pantyose ever - 5D ultra sheer to invisible<br> Material: 95% nylon, 5% spandex<br> Size: M(weight 90-130LBs, height under 5''5"), L(weight 130-170LBs, height under 5''9")<br> make your legs invisible smooth,shinning,breathable and firm<br>', NULL, NULL, 7, 6, 9, '31XkEYCBcL.jpg', 'moochi-womens-5-denier-ultra-sheer-oiled-shinning-control-top-tights', 'B01E8IG5IA', 'Biege', '31XkEYCBcL.SL160.jpg', 'Moochi');
INSERT INTO item_item VALUES (4276, 'Moochi Women''s 40 Denier Sheer Bikini Crotch Anti-hook Tights (Gray)', 'Moochi 40D sheer tights <br> Material: 85% nylon, 15% spandex <br> One size fits: height under 6''1" weight under 160lbs <br> make your legs smooth,shinning,breathable and firm <br> control top, sexy bikini crotch style <br>', NULL, NULL, 6, 5, 9, '41udHGfbjZL.jpg', 'moochi-womens-40-denier-sheer-bikini-crotch-anti-hook-tights-gray', 'B01AXRLI0K', 'Gray', '41udHGfbjZL.SL160.jpg', 'Moochi');
INSERT INTO item_item VALUES (4354, 'Calvin Klein Performance Women''s 9" Inseam Bermuda Short, Black, XL', 'Calvin Klein performance creates active clothing for women that can be worn to the gym or for casual everyday wear. A special focus for Calvin Klein performance is capturing fun, fashion trends and using easy to care fabrics to keep you looking stylish and comfortable for your workouts and all your casual activities. Calvin Klein performance makes something for every woman, no matter what your size or lifestyle demands.', NULL, NULL, 20, 39, 10, '31RPwHccz8L.jpg', 'calvin-klein-performance-womens-9-inseam-bermuda-short-black-xl', 'B01N5OX285', 'Black', '31RPwHccz8L.SL160.jpg', 'Calvin Klein');
INSERT INTO item_item VALUES (4356, 'Calvin Klein Jeans Women''s City Short, Black, 26', 'These shorts are the ultimate in comfort and style. They are a great addition to your wardrobe.', NULL, NULL, 15, 59, 10, '31orA8MsvQL.jpg', 'calvin-klein-jeans-womens-city-short-black-26', 'B01N6KY7Q2', 'Black', '31orA8MsvQL.SL160.jpg', 'Calvin Klein');
INSERT INTO item_item VALUES (4358, 'Calvin Klein Women''s Modern Cotton Boy Short, Coastal, Large', 'Boy short', NULL, NULL, 10, 7, 10, '41oIM1AUAsL.jpg', 'calvin-klein-womens-modern-cotton-boy-short-coastal-large', 'B00R56FD7W', 'Coastal', '41oIM1AUAsL.SL160.jpg', 'Calvin Klein');
INSERT INTO item_item VALUES (4360, 'Calvin Klein Jeans Women''s Curvy Skinny Jean,Black,31/12 Short', 'Mid Rise - Sits Below Natural Waist - Contoured Fit Through Waist, Hip And Thigh - Skinny At Ankle', NULL, NULL, 7, 39, 10, '415kisAyREL.jpg', 'calvin-klein-jeans-womens-curvy-skinny-jeanblack3112-short', 'B007MU5S7G', 'Black (71% Cotton/27% Polyester/2% Elastane)', '415kisAyREL.SL160.jpg', 'Calvin Klein');
INSERT INTO item_item VALUES (4363, 'Calvin Klein Performance Women''s Rigid Waistband Convertible Cargo, Black, M', 'Calvin Klein Performance creates active clothing for women that can be worn to the gym or for casual everyday wear. A special focus for Calvin Klein Performance is capturing fun, fashion trends and using easy-to-care fabrics to keep you looking stylish and comfortable for your workouts and all your casual activities. Calvin Klein Performance makes something for every woman, no matter what your size or lifestyle demands.', NULL, NULL, 6, 12, 10, '31G6gwG1aPL.jpg', 'calvin-klein-performance-womens-rigid-waistband-convertible-cargo-black-m', 'B01LWXM832', 'Black', '31G6gwG1aPL.SL160.jpg', 'Calvin Klein');
INSERT INTO item_item VALUES (4373, 'Hanes Women''s Jersey Short, Navy, Medium', 'Hanes women''s jersey pocket short combines the cotton jersey fabric you love with an adjustable draw cord waist for perfect fit. With roomy side pockets, these shorts are comfy and functional', NULL, NULL, 17, 11, 10, '41qebSjYCxL.jpg', 'hanes-womens-jersey-short-navy-medium', 'B016YKJWAI', 'Navy', '41qebSjYCxL.SL160.jpg', 'Hanes');
INSERT INTO item_item VALUES (4376, 'Hanes Women''s French Terry Bermuda Short, Black, Large', 'Hanes women''s French terry bermuda pocket short is cotton rich for extra softness. French terry fabric is smooth outside and brushed inside for extra comfort. Cuffed legs, side pockets and adjustable draw cord waist.', NULL, NULL, 18, 6, 10, '41MlGA1jknL.jpg', 'hanes-womens-french-terry-bermuda-short-black-large', 'B0170AD4BE', 'Black', '41MlGA1jknL.SL160.jpg', 'Hanes');
INSERT INTO item_item VALUES (4380, 'Hanes Women''s Stretch Jersey Bike Short, Black, Small', 'These stretch jersey bike shorts are great to wear when going on a casual bike ride, layering, or just hanging out with friends.', NULL, NULL, 1, 5, 10, '31ogtfSTYuL.jpg', 'hanes-womens-stretch-jersey-bike-short-black-small', 'B01I21GQH4', 'Black', '31ogtfSTYuL.SL160.jpg', 'Hanes');
INSERT INTO item_item VALUES (4383, 'Hanes Men''s Jersey Pocket Short: Black, 4XL', 'Nothing Puts The Comfort Into Casual Like These Super Soft Jersey Shorts.Cotton-Rich Jersey Blend Feels As Soft As Your Favorite Tee.Gentle Elastic Waistband With Workable Drawstring.Side Front Pockets.7.5&Quot; Inseam.', NULL, NULL, 20, 9, 10, '41kY9c5ipsL.jpg', 'hanes-mens-jersey-pocket-short-black-4xl', 'B01DL9UJXE', 'Black', '41kY9c5ipsL.SL160.jpg', 'Hanes');
INSERT INTO item_item VALUES (4387, 'Hanes Women''s X-Temp French Terry Short, Navy, Large', 'Hanes x-temp women''s French terry bermuda pocket short offers you x-temp technology, designed with dynamic moisture control. It responds to your body temperature to keep you cool and dry.', NULL, NULL, 11, 10, 10, '313GC0Q3dHL.jpg', 'hanes-womens-x-temp-french-terry-short-navy-large', 'B0170ADB12', 'Navy', '313GC0Q3dHL.SL160.jpg', 'Hanes');
INSERT INTO item_item VALUES (4390, 'Hanes Women''s Sport Mesh Short, Navy, Medium', 'Hanes sport builds on our comfort heritage with innovative technologies to give you the looks that fit your life, your sport, and your style', NULL, NULL, 6, 13, 10, '41utmDe8hL.jpg', 'hanes-womens-sport-mesh-short-navy-medium', 'B01ES46JNU', 'Navy', '41utmDe8hL.SL160.jpg', 'Hanes');
INSERT INTO item_item VALUES (4395, 'Just My Size by Hanes Plus Size Women''s Jersey Essential Shorts - Style J333 (5X, Bright Violet)', 'Everything you want in your most comfy summer shorts!', NULL, NULL, 4, 4, 10, '41acPd9ajFL.jpg', 'just-my-size-by-hanes-plus-size-womens-jersey-essential-shorts-style-j333-5x-bright-violet', 'B01J66ZDLO', 'Bright Violet', '41acPd9ajFL.SL160.jpg', 'JMS');
INSERT INTO item_item VALUES (4397, 'Hanes Women''s Comfort Soft Cotton Stretch Boy Brief with Lace Panty Pack of 3, Assorted, 5', 'A new take on the boy short starts with our very best cotton which is processed to be extra soft and then blended with a hint of spandex so these panties move right along with you. Popular boy brief styling. Because anything boys can wear girls can wear better, pretty lace detailing along waistband. Assorted may be prints solids all white or a combination.', NULL, NULL, 13, 8, 10, '41nDNMQIjgL.jpg', 'hanes-womens-comfort-soft-cotton-stretch-boy-brief-with-lace-panty-pack-of-3-assorted-5', 'B006333FH8', 'Assorted', '41nDNMQIjgL.SL160.jpg', 'Hanes');
INSERT INTO item_item VALUES (4398, 'Hanes Women''s Sporty Boyshort Panty, Assorted, Size 6 (Pack of 6)', 'Hanes women''s 6 pack sporty boyshort panty- assorted', NULL, NULL, 10, 8, 10, '41TZrUiYgEL.jpg', 'hanes-womens-sporty-boyshort-panty-assorted-size-6-pack-of-6', 'B0051HFI4A', 'Assorted', '41TZrUiYgEL.SL160.jpg', 'Hanes');
INSERT INTO item_item VALUES (4399, 'Hanes Big Girls'' Girls  Boyshort, Assorted, 8 (Pack of 8)', 'Your daughter will enjoy wearing these Hanes girls'' underwear. They include a variety of colors and patterns. Each boy short provides full coverage with an elastic waist for optimal comfort.', NULL, NULL, 12, 9, 10, '41KRdxWtPbL.jpg', 'hanes-big-girls-girls-boyshort-assorted-8-pack-of-8', 'B00GN6V5LS', 'Assorted', '41KRdxWtPbL.SL160.jpg', 'Hanes');
INSERT INTO item_item VALUES (4401, 'Hanes Women''s 3-Pack Get Cozy Seamless Boyshort Panty, Assorted, L/XL', 'Your cozy bra just got a new friend! get cozy boy short panties are the perfect match for every comfortable step of your on-the-go lifestyle.', NULL, NULL, 9, 8, 10, '41qdrMa6ilL.jpg', 'hanes-womens-3-pack-get-cozy-seamless-boyshort-panty-assorted-lxl', 'B01M3Q4UE1', 'Assorted', '41qdrMa6ilL.SL160.jpg', 'Hanes');
INSERT INTO item_item VALUES (4406, 'Hanes Women''s Boyshort Panty, Assorted, Size 9 (Pack of 6)', 'Hanes women''s 6 pack boyshort panty- assorted', NULL, NULL, 10, 14, 10, '41MV9G1RyOL.jpg', 'hanes-womens-boyshort-panty-assorted-size-9-pack-of-6', 'B00FZR1ZZC', 'Assorted', '41MV9G1RyOL.SL160.jpg', 'Hanes');
INSERT INTO item_item VALUES (5132, 'Legend [Vinyl]', 'Essential 14-track remastered collection of his best loved tracks including ''Is This Love'', ''Could You Be Loved'' & ''Buffalo Soldier''. Pressed on 180-gram vinyl with a download code.', NULL, NULL, 12, 13, 18, '413T56OI3UL.jpg', 'legend-vinyl', 'B000V7J82S', '', '413T56OI3UL.SL160.jpg', 'VINYL');
INSERT INTO item_item VALUES (4410, 'Hanes Womens Comfortsoft Waisband Boy Briefs-Size 9 (Pack of 3) Colors May Vary', 'Hanes women''s 3 pack comfortsoft cotton stretch boyshort panty', NULL, NULL, 16, 7, 10, '41Y9F9z4zhL.jpg', 'hanes-womens-comfortsoft-waisband-boy-briefs-size-9-pack-of-3-colors-may-vary', 'B003H12G88', 'Assorted', '41Y9F9z4zhL.SL160.jpg', 'Hanes');
INSERT INTO item_item VALUES (4278, 'Moochi Women''s 5 Denier Ultra Sheer T Crotch Invisible Tights', 'Moochi the most thin tights ever - 5D ultra sheer to invisible <br> Material: 88% nylon, 12% spandex <br> One size fits: height under 5''9" weight under 160lbs <br> make your legs invisible smooth,shinning,breathable and firm <br> control top, sexy T crotch style <br>', NULL, NULL, 17, 19, 9, '415Y9ltivHL.jpg', 'moochi-womens-5-denier-ultra-sheer-t-crotch-invisible-tights', 'B0185OYQ5C', 'Coffee', '415Y9ltivHL.SL160.jpg', 'Moochi');
INSERT INTO item_item VALUES (4280, 'Moochi Women''s 20 Denier Ultra Sheer Bikini Crotch Tights (Gray)', 'Moochi 20D sheer tights <br> Material: 85% nylon, 15% spandex <br> One size fits: height under 6''1" weight under 160lbs <br> make your legs smooth,shinning,breathable and firm <br> control top, sexy bikini crotch style <br>', NULL, NULL, 15, 6, 9, '41E2CkjJPGL.jpg', 'moochi-womens-20-denier-ultra-sheer-bikini-crotch-tights-gray', 'B0185OYRYC', 'Gray', '41E2CkjJPGL.SL160.jpg', 'Moochi');
INSERT INTO item_item VALUES (4283, 'Moochi Women''s 30 Denier Ultra Sheer Flower Pattern Pantyhose', 'The 30D sheer pattern pantyhose 
<br> Material: 85% nylon, 15% spandex 
<br> One size fits: height uner 6''1" weight 170lbs 
<br> make your legs smooth,shinning,breathable and firm 
<br> control top, sexy bikini crotch style 
<br>', NULL, NULL, 8, 12, 9, '41QQjAzkJ2L.jpg', 'moochi-womens-30-denier-ultra-sheer-flower-pattern-pantyhose', 'B0185OYYTA', 'Black', '41QQjAzkJ2L.SL160.jpg', 'Moochi');
INSERT INTO item_item VALUES (4817, 'Green Mountain Coffee Keurig Single-Serve K-Cup Pods, Breakfast Blend Light Roast Coffee, 12 Count (pack of 6)', 'Breakfast Blend is one of our most popular blends. Bright, sweet, and engaging, it''s our favorite way to start the day. A snappy, crisp, and citrusy Central American profile meets the sweetness, body, and depth of an Indonesian bean to create a classic and vibrant New England breakfast cup. Made with 100% Arabica coffee. These single-serve K-Cup pods are compatible with all Keurig K-Cup Pod Single-Serve Coffee Makers. Each K-Cup pod is filled with the freshest ground coffee and brews a perfect, great tasting cup of coffee, every time. Certified Orthodox Union Kosher.', NULL, NULL, 9, 39, 13, '51hGbNqjs2L.jpg', 'green-mountain-coffee-keurig-single-serve-k-cup-pods-breakfast-blend-light-roast-coffee-12-count-pack-of-6', 'B00I08JK7S', 'brown', '51hGbNqjs2L.SL160.jpg', 'Green Mountain Coffee');
INSERT INTO item_item VALUES (4820, 'Viva Naturals Aromatherapy Essential Oil Diffuser - Vibrant Changeable LED Lights, Soothing Mist & Oxygen, Automatic Shut Off', 'Incorporate the benefits of aromatherapy into your everyday lifestyle with our ultrasonic diffuser. Perfect for DIY calming, energizing, relaxing, or whatever you''re in the mood for type of blend!<br><br><b>Natural Air Freshener -</b> Our ultrasonic technology breaks up essential oil into micro particles, creating a fine water vapor that spreads throughout any room. A delightful scent within minutes of turning on!<br><br> <b>Improves Oil Quality & Efficacy -</b> By projecting a cold, even mist, essential oils are not heated to preserve their therapeutic benefits. Especially important for temperature-sensitive oils like our cold-pressed lemon or bergamot oil. Our ultrasonic diffuser ensures oil quality is optimal and aromatic.<br><br><b>The Viva Naturals Difference</b><br>By using high frequencies, tiny oil droplets project comforting or energizing aromas wherever you need them most. Unlike aromatherapy lamps or heat diffusers, our diffuser delivers subtle, consistent aromas without overpowering a room.', NULL, NULL, 18, 19, 13, '31NPYXBu2BBL.jpg', 'viva-naturals-aromatherapy-essential-oil-diffuser-vibrant-changeable-led-lights-soothing-mist-oxygen-automatic-shut-off', 'B01GIPVLI0', 'purple', '31NPYXBu2BBL.SL160.jpg', 'Viva Naturals');
INSERT INTO item_item VALUES (4823, 'URPOWER 500ml Aromatherapy Essential Oil Diffuser Humidifier with 4 Timer Settings, 7 LED Color Changing Lamps and Waterless Auto Shut-off', '<b>Attention:</b> <br> <b>Please add water below the Max line. </b> <br> <b>Before press the "MIST" button, please ensure that you have added water into the tank.</b> <br> <br> <b>Description:</b> <br> Mist Control <br> Press the "Mist" button, choose the timer from 60 mins, 120 mins, 180 mins or ON. <br> Light Control <br> Press the "Light" button to turn on the LED light, the color will change automatically. Press the "Light" button again to fix the color. Press the "Light" button again to change color. If you need to turn it off please long press the button for one second. <br> High/Low Control <br> Adjust the spray intensity(beep once means strong, twice means weak) <br> <br> <b>Specifications:</b> <br> <b>[Applicable Area] Aromatherapy: 430 Sq ft / Humidification: 269 Sq ft</b> <br> [Size] 168*121mm <br> [Weight] 520g <br> [Input] AC 100-240V 50/60Hz <br> [Output] DC24V 650mA <br> [Length of power line] 170cm <br> [Timer] 60 / 120 / 180 minutes / On <br> [Ultrasonic Frequency] 2.4 MHz - Advanced Ultrasonic Diffusing Technology [Duration Time] Do not use for more than 10 hours. <b>When time is up or there is no water, it will turn off automatically</b> <br> [Water Capacity] 500 ml <br> [LED Light] 7 pcs - Independent Light Control / Multiple Color Light / Gradual Changing or Fixed Mode or Off. Provides soft illumination <br> [Main Material] PP, ABS <br> <br> <b>Package Contents:</b> <br> 1 x 500 ml Aroma Diffuser <br> 1 x Charger Adaptor <br> 1 x Measuring cup for filling water <br> 1 x User Manual <br> <br> <b>Note: Oil is not included in the package </b> <br> <br>', NULL, NULL, 15, 29, 13, '31EQbjghYfL.jpg', 'urpower-500ml-aromatherapy-essential-oil-diffuser-humidifier-with-4-timer-settings-7-led-color-changing-lamps-and-waterless-auto-shut-off', 'B0118QC1BA', '7-color', '31EQbjghYfL.SL160.jpg', 'URPOWER');
INSERT INTO item_item VALUES (4826, 'WBM Himalayan Glow Hand Carved Natural Crystal Himalayan Salt Lamp with Genuine Neem Wood Base, Bulb and Dimmer Control', '• Unique salt lamp is made from Natural Himalayan salt crystals hand mined in the Himalayan Mountains</br> • Once lit the lamp will emit a calming Amber color</br> • Heating the salt with the included 25 watt bulb releases negative ions into the air, creating an effect similar to an ionizer, purifying the surrounding air</br> • Due to the natural variation in Himalayan Crystal salt, weight, size, color and shape may vary </br> • Includes:6 ft Power Cord, 25 watt Light Bulb, Rotary dimmer switch </br> • Material:  100% Himalayan Crystal Salt . </br> • Base is made of genuine neem wood. The neem tree is one of the most versatile of India’s plants. Valued for centuries throughout tropical Asia for its multitude of medicinal and other uses, it has ­recently attracted attention in the United States as an effective botanical insecticide. Neem wood is now becoming a popular option for furniture manufacturers. The advantage of using this is that it is a strong wood making it durable and giving your furniture a long life. Secondly, due to the pest repelling aromatic properties of the wood; it is termite free. </br> • Finish: Natural </br> • Lamp and cord assembly are UL approved.</br>  <p><b>Ingredients:</b></br> 100% Himalayan Crystal salt, 100% neem wood </p>', NULL, NULL, 10, 30, 13, '41HCZ4IRHmL.jpg', 'wbm-himalayan-glow-hand-carved-natural-crystal-himalayan-salt-lamp-with-genuine-neem-wood-base-bulb-and-dimmer-control', 'B001892AX2', 'Orange', '41HCZ4IRHmL.SL160.jpg', 'WBM LLC');
INSERT INTO item_item VALUES (4503, '360 Cookware Premium Stainless Steel 5 Piece Bakeware Set', 'Take advantage of our best value by bringing home the complete Stainless Steel Bakeware Set. The set includes 2-9" Round Cake Pans, Pie Pan, 9" x 13" Bake and Roast Pan and Cookie Sheet. You''ll have everything you need whenever your sweet tooth comes calling.', NULL, NULL, 1, 599, 12, '31645n5akwL.jpg', '360-cookware-premium-stainless-steel-5-piece-bakeware-set', 'B00DG095AC', 'Stainless Steel', '31645n5akwL.SL160.jpg', '360 Bakeware');
INSERT INTO item_item VALUES (4506, 'Anolon Advanced Hard Anodized Nonstick 9-Piece Cookware with 2-Piece Bakeware Set by Anolon', 'Set includes: 2-Quart, 3-Quart Covered Saucepans, 8-Quart Covered Stockpot, 10-Inch Skillet, 3-Quart Covered Saute, Two 10-Inch by 15-Inch Cookie Pans;The cookware''s heavy gauge construction promotes even, efficient heating; tempered glass lids with sturdy double-riveted handles ensure a tight seal;Restaurant-quality Autograph 2 nonstick from DuPont is long lasting, makes cleaning up effortless and is metal utensil safe;Anolon Sure Grip handles are designed for a comfortable grasp and are dual riveted for extra strength; cookware is oven safe to 400 degrees Fahrenheit;Anolon Sure Grip silicone handles for a confident grasp; oven safe to 500 degrees Fahrenheit', NULL, NULL, 15, 588, 12, '516eVzdnZ6L.jpg', 'anolon-advanced-hard-anodized-nonstick-9-piece-cookware-with-2-piece-bakeware-set-by-anolon', 'B01MSZRLP8', '', '516eVzdnZ6L.SL160.jpg', 'Anolon');
INSERT INTO item_item VALUES (4508, 'Tramontina Style 10-Piece Cookware/Bakeware Set, Metallic Copper by Tramontina', 'Heavy-gauge aluminum cookware offers even heat distribution and excellent conduction, while porcelain enamel exterior ensures cookware durability and resistance to high temperatures;Cream-colored ceramic cooking surface is PFOA and PTFE free and provides easy cooking and cleanup;Tempered glass lids allow safe viewing of food as it cooks;Cast stainless steel handles with soft-grip silicone offer smooth, steady and comfortable handling;Set includes: 8 fry pan, 10 fry pan, 1.5-qt sauce pan with lid, 3-qt sauce pan with lid, 6-qt stock pot with lid, 12.5 pizza pan, 14 x 10 roasting pan', NULL, NULL, 11, 559, 12, '41cNRbyp00L.jpg', 'tramontina-style-10-piece-cookwarebakeware-set-metallic-copper-by-tramontina', 'B01N7QXQH9', '', '41cNRbyp00L.SL160.jpg', 'Tramontina');
INSERT INTO item_item VALUES (4512, 'Tramontina 80110/222DS Style Ceramica_01 10 Piece Cookware/Bakeware Set by Tramontina', 'Heavy-gauge aluminum construction with a durable, easy-to-clean, porcelain enamel exterior;PFOA, PTFE, lead and cadmium-free ceramic interior provides a healthy, quick release cooking surface that is easy to clean;Heat- and shatter-resistant tempered glass lid locks in nutrients and allows you to monitor cooking progress;Ergonomically designed stainless steel handle with silicone soft-grip is riveted for added strength and stability;Compatible with gas, electric and ceramic glass cooktops;', NULL, NULL, 18, 554, 12, '41IIgvkBGhL.jpg', 'tramontina-80110222ds-style-ceramica_01-10-piece-cookwarebakeware-set-by-tramontina', 'B01C85QO6S', '', '41IIgvkBGhL.SL160.jpg', 'Tramontina');
INSERT INTO item_item VALUES (4518, 'Tramontina Style 10-Piece Cookware/Bakeware Set, Metallic Copper', 'Important Made in USA Origin Disclaimer: For certain items sold by Walmart on Walmart.com, the displayed country of origin information may not be accurate or consistent with manufacturer information. For updated, accurate country of origin data, it is recommended that you rely on product packaging or manufacturer information. Tramontina Style cookware set offers a sleek and ultra-smooth ceramic cooking surface that provides an innovative and simply healthy cooking experience, while delivering effortless cleaning and outstanding durability.', NULL, NULL, 8, 520, 12, '418ho7bRs7L.jpg', 'tramontina-style-10-piece-cookwarebakeware-set-metallic-copper', 'B01BECOSAA', 'Brown', '418ho7bRs7L.SL160.jpg', 'BLOSSOMZ');
INSERT INTO item_item VALUES (4522, 'Pinovk Aluminum Alloy Oval Cheese Cake Pan Cheesecake Pudding Mold Toast Bakeware Baking Cake Mould', 'Features: <br> 100% Brand New and High Quality <br> Perfect for baking a variety of layer cakes and wedding cakes, as well as cheesecakes, mousse and frozen desserts,egg tart and so on. <br> 14-gauge ''square-bake'' design with no extra metals, welds, or chemical coatings. <br> Safe for citrus based fruits, sauces, and foods. <br> Non-reactive anodized finish will not rust, peel, chip, or flake. <br> Non-stick finish,easy to clean up. <br> Super durable Aluminum alloy plate, the intensity is high, good heat transfer. <br> Specification: <br> - Material: Durable food-grade anodized aluminum alloy. <br> - Size: 22x10.5x5.7cm (LxWxH) <br> Package Include 1 * Oval Cheese Cake Pan', NULL, NULL, 15, 499, 12, '41mGQVTtSsL.jpg', 'pinovk-aluminum-alloy-oval-cheese-cake-pan-cheesecake-pudding-mold-toast-bakeware-baking-cake-mould', 'B06XCP5JXC', 'Color: Random', '41mGQVTtSsL.SL160.jpg', 'Pinovk');
INSERT INTO item_item VALUES (4527, 'Set Bakeware Set Use Cookies Baking Oven Toast Abrasive Cake Mold Package', 'Electric whisk Electronic balance Live - end cake mold Pizza dish Biscuit mold 10 Cake mold 6 Egg tart die 6 Potato mold Large silicone scraper Rolling pin Egg white separator Plastic measuring cup Pizza shovel Beat the egg stick Oil paper 5 meters Silicone oil brush Spray rubber gloves Tin foil 5 meters Saliva knife Mounted flower head suit Tooth bread knife Hand - held flour sieve Silicone kneading pad Stainless steel spoon', NULL, NULL, 11, 499, 12, '61UYe1j6ML.jpg', 'set-bakeware-set-use-cookies-baking-oven-toast-abrasive-cake-mold-package', 'B01N098TWA', '', '61UYe1j6ML.SL160.jpg', 'Chef Harrou');
INSERT INTO item_item VALUES (4532, 'WMU Bakeware Non-Stick 96pc Floor Display (pack Of 1)', 'Bakeware Non-Stick 96 Piece Floor Display 16 Piece Each In 6 Styles', NULL, NULL, 17, 495, 12, '412Bw2hAWM2BL.jpg', 'wmu-bakeware-non-stick-96pc-floor-display-pack-of-1', 'B00H1Z1330', '', '412Bw2hAWM2BL.SL160.jpg', 'WMU');
INSERT INTO item_item VALUES (4414, 'Hanes Women''s Sport Performance Run Short, Amaranth/Ebony Origami, Medium', 'Hanes sport builds on our comfort heritage with innovative technologies to give you the looks that fit your life, your sport, and your style', NULL, NULL, 19, 11, 10, '41pZ2BXMe9QL.jpg', 'hanes-womens-sport-performance-run-short-amaranthebony-origami-medium', 'B01ETIYBI0', 'Amaranth/Ebony Origami', '41pZ2BXMe9QL.SL160.jpg', 'Hanes');
INSERT INTO item_item VALUES (4417, 'Hanes Women''s 3 Pack Ultimate Cotton Stretch Boyshort 49KS, Assorted Q6, 9', 'No matter how you move, these Hanes panties move right with you. The result: comfort, reinvented.Comfort soft waistband stretches when you do, for freedom at every turn. It''s wrapped in super soft cotton, so it''s easier on your skin.', NULL, NULL, 8, 22, 10, '41oKkjIhRDL.jpg', 'hanes-womens-3-pack-ultimate-cotton-stretch-boyshort-49ks-assorted-q6-9', 'B0188OG940', 'Assorted Q6', '41oKkjIhRDL.SL160.jpg', 'Hanes');
INSERT INTO item_item VALUES (4428, 'Lee Women''s Relaxed Fit Kaylin Knit Waist Short, Bungalow, 16', 'Just like our founder,  H.D. Lee, our passion is helping can-do people do more. We are committed to designing clothing that conforms to your body, allowing you to move through life freely. We help you chase the things that bring you joy and laughter. The things that make you fearless and hopefully because your passion is what makes you unique. And what moves you, moves us. Move your Lee.', NULL, NULL, 20, 29, 10, '41vQbNVW2cL.jpg', 'lee-womens-relaxed-fit-kaylin-knit-waist-short-bungalow-16', 'B01MDUEHKO', 'Bungalow', '41vQbNVW2cL.SL160.jpg', 'Lee');
INSERT INTO item_item VALUES (4431, 'Lee Women''s Plus Size Relaxed Fit Kaylin Knit Waist Short, Bungalow, 22W/Medium', 'Just like our founder,  H.D. Lee, our passion is helping can-do people do more. We are committed to designing clothing that conforms to your body, allowing you to move through life freely. We help you chase the things that bring you joy and laughter. The things that make you fearless and hopefully because your passion is what makes you unique. And what moves you, moves us. Move your Lee.', NULL, NULL, 11, 34, 10, '41vQbNVW2cL.jpg', 'lee-womens-plus-size-relaxed-fit-kaylin-knit-waist-short-bungalow-22wmedium', 'B01M2CNA3H', 'Bungalow', '41vQbNVW2cL.SL160.jpg', 'Lee');
INSERT INTO item_item VALUES (4436, 'Lee Women''s Midrise Fit Essential Chino Short, Black Diamond Deco, 12', 'Just like our founder,  H.D. Lee, our passion is helping can-do people do more. We are committed to designing clothing that conforms to your body, allowing you to move through life freely. We help you chase the things that bring you joy and laughter. The things that make you fearless and hopefully because your passion is what makes you unique. And what moves you, moves us. Move your Lee.', NULL, NULL, 16, 29, 10, '411ZaNMoxTL.jpg', 'lee-womens-midrise-fit-essential-chino-short-black-diamond-deco-12', 'B01MQPEVED', 'Black Diamond Deco', '411ZaNMoxTL.SL160.jpg', 'Lee');
INSERT INTO item_item VALUES (4438, 'Lee Women''s Plus Size Relaxed Fit Delaney Knit Waist Cargo Bermuda Short, Twilight, 20W/Medium', 'Just like our founder,  H.D. Lee, our passion is helping can-do people do more. We are committed to designing clothing that conforms to your body, allowing you to move through life freely. We help you chase the things that bring you joy and laughter. The things that make you fearless and hopefully because your passion is what makes you unique. And what moves you, moves us. Move your Lee.', NULL, NULL, 19, 34, 10, '312R28mRBCL.jpg', 'lee-womens-plus-size-relaxed-fit-delaney-knit-waist-cargo-bermuda-short-twilight-20wmedium', 'B01IZQ0USC', 'Twilight', '312R28mRBCL.SL160.jpg', 'Lee');
INSERT INTO item_item VALUES (4439, 'Lee Women''s Modern Series Midrise Fit Belted Twila Short, Majestic, 12', 'Just like our founder,  H.D. Lee, our passion is helping can-do people do more. We are committed to designing clothing that conforms to your body, allowing you to move through life freely. We help you chase the things that bring you joy and laughter. The things that make you fearless and hopefully because your passion is what makes you unique. And what moves you, moves us. Move your Lee.', NULL, NULL, 4, 29, 10, '416wwuR2gTL.jpg', 'lee-womens-modern-series-midrise-fit-belted-twila-short-majestic-12', 'B01N1LOI58', 'Majestic', '416wwuR2gTL.SL160.jpg', 'Lee');
INSERT INTO item_item VALUES (4445, 'Lee Women''s Plus Size Midrise Fit Essential Chino Short, Palm Leaf, 16W/Medium', 'Just like our founder,  H.D. Lee, our passion is helping can-do people do more. We are committed to designing clothing that conforms to your body, allowing you to move through life freely. We help you chase the things that bring you joy and laughter. The things that make you fearless and hopefully because your passion is what makes you unique. And what moves you, moves us. Move your Lee.', NULL, NULL, 10, 34, 10, '31yWWFh4ZFL.jpg', 'lee-womens-plus-size-midrise-fit-essential-chino-short-palm-leaf-16wmedium', 'B01N78MV4A', 'Palm Leaf', '31yWWFh4ZFL.SL160.jpg', 'Lee');
INSERT INTO item_item VALUES (4448, 'Lee Women''s Plus-Size Relaxed Fit Bermuda Short, Oxford, 18W/Medium', 'At the waist', NULL, NULL, 17, 34, 10, '41uzR2L7NuL.jpg', 'lee-womens-plus-size-relaxed-fit-bermuda-short-oxford-18wmedium', 'B013FXWLFU', 'Oxford', '41uzR2L7NuL.SL160.jpg', 'Lee');
INSERT INTO item_item VALUES (4451, 'Riders by Lee Indigo Women''s 6 Denim Cuffed Short with Belt, Black, 12Medium', 'The Riders by Lee indigo premium stretch denim short is the perfect accompaniment to a fun filled casual day. The short has a 6 inch inseam for a modest yet fun fashionable look. They have a roll cuff detail and include a belt to complete the look. These shorts are a wardrobe must have', NULL, NULL, 10, 16, 10, '31hqjXbKJL.jpg', 'riders-by-lee-indigo-womens-6-denim-cuffed-short-with-belt-black-12medium', 'B01FT5OMJA', 'Black', '31hqjXbKJL.SL160.jpg', 'Riders by Lee Indigo');
INSERT INTO item_item VALUES (4829, 'Dirt Devil Vacuum Cleaner Simpli-Stik Lightweight Bagless Corded Stick and Handheld Vacuum SD20000RED', 'The Dirt Devil Versa Power is a one step solution for quick and convenient cleanups. This versatile unit functions as a stick vac, hand vac, and a utility vac all in one. The vacuum cleaner’s lightweight design makes it simple to transport from room to room, while its easy-empty dirt cup means no more bags to buy. An onboard crevice tool comes included, which allows for cleaning hard to reach areas like between couch cushions, along baseboards, or under furniture and appliances. Great for multi-purpose cleaning.', NULL, NULL, 3, 19, 13, '31s8tf4BTGL.jpg', 'dirt-devil-vacuum-cleaner-simpli-stik-lightweight-bagless-corded-stick-and-handheld-vacuum-sd20000red', 'B002KCO96C', 'Red', '31s8tf4BTGL.SL160.jpg', 'Dirt Devil');
INSERT INTO item_item VALUES (4832, 'OK to Wake! Alarm Clock & Night-Light', 'This bedside alarm clock features fun animations that give it personality! The convenient nap timer and dual night light that glows green to tell children it’s OK to get out of bed make this alarm clock a must-have for families with young children! Includes two fun, interchangeable faceplates: pink flower and green bug. USB cord with battery backup (4 AA, not included). Wall adaper not included. Approximately 4.5".', NULL, NULL, 3, 24, 13, '313t01qTlzL.jpg', 'ok-to-wake-alarm-clock-night-light', 'B00EAHSBV4', 'White', '313t01qTlzL.SL160.jpg', 'Patch Products LLC');
INSERT INTO item_item VALUES (4837, 'Art Naturals Essential Oil Diffuser 100ml & Top 8 Essential Oil Set - Peppermint, Tee Tree, Rosemary, Orange, Lemongrass, Lavender, Eucalyptus, & Frankincense - Auto Shut-off and 7 Color LED Lights', 'After a hectic day, walking into a home that smells enchanting immediately de-stresses you. ArtNaturals'' Essential Oil Diffuser uses silent ultrasound vibrations to mist essential oil essence throughout one room or the whole house (or office). No heat is used, making it safe for kids and pets, and the sleek, sculptural Diffuser glows with soft LED light. An aromatherapy stay-cation. <BR> <BR>Natural essential oils are distributed throughout your chosen area in the form of a gentle, smoke-free mist that wafts delicate, healing aromas while softly humidifying a dry atmosphere. Deep relaxation results, as stress-relieving scents of essential oils, such as lavender, peppermint, eucalyptus, and tea tree, fill you with a sense of serenity and peace. <BR> <BR>Use our Essential Oil Diffuser''s aromatherapy to fight the effects of eczema, nausea, nosebleeds, dandruff, joint pain anxiety, nasal and chest congestion. The Diffuser uses patented ultrasonic technology to deliver a safe, heat-free and smoke-free mist. Sonic vibrations silently create an ultra-fine mist, delivering maximum humidifying. This quiet process means you can enjoy the benefits of your Diffuser''s healing mist without disruption or noise pollution. The powerful 110-240-volt, 12-watt system ensures mist distributes even in larger rooms. <BR> <BR>The zero-heat process also makes our diffuser child safe and eliminates the risk of injury or fire candles or smoky incense poses. And choose from seven soft, LED colors to set the perfect mood for you and your guests. The "auto off" function allows you to leave your diffuser unattended. Just add a few drops of your favorite oil to the water reservoir, turn on the Diffuser-and relax.', NULL, NULL, 19, 34, 13, '51QdJyCmIQL.jpg', 'art-naturals-essential-oil-diffuser-100ml-top-8-essential-oil-set-peppermint-tee-tree-rosemary-orange-lemongrass-lavender-eucalyptus-frankincense-auto-shut-off-and-7-color-led-lights', 'B01MRNUPCD', 'White', '51QdJyCmIQL.SL160.jpg', 'ArtNaturals');
INSERT INTO item_item VALUES (4543, 'Joyin Toy 36 Counts Tropical Hawaiian Luau Flower Lei Party Favors (3 Dozen)', '36 Pieces Full Size 36" Average Hawaiian Flower Leis Assortment-No Duplicate-No Mini Leis <p> Party Favors for Luau Parties,Baby Showers, Birthdays Or Hawaiian Or Tropical Themed Events<p> Perfect for Birthday Bash, Luau Party Or Traveling To Hawaii; Perfect For Luau Party Favors<p> Beautiful Silk Luau Themed Flower Leis - Assorted Color Party Leis; Great For luau Parties<p> Simulated Silk Leis Great For Any Event Or Hawaiian Themed Luau Party; Great For Graduation Leis.', NULL, NULL, 9, 16, 13, '61MOtpGuFCL.jpg', 'joyin-toy-36-counts-tropical-hawaiian-luau-flower-lei-party-favors-3-dozen', 'B01F6LRW30', '', '61MOtpGuFCL.SL160.jpg', 'Joyin Toy');
INSERT INTO item_item VALUES (4546, 'Gtidea 4pcs Artificial Flocked Lavender Bouquet in Purple Flowers Arrangements Bridal Home DIY Floor Garden Office Wedding Decor', 'Flowers are such joyful and energetic presence. They are known to make people better and <br> happier and they are sunshine, food and medicine for the soul. Flowers lighten up any <br> setting and bring in a sense of exclusivity to the place. But, there are chances that the<br> flower arrangement you bought could be sitting on your neighbor''s table as well. Where''s <br> the exclusivity? You need something which is a little different and elicit an element of <br> surprise. Our Direct''s mission is to create unique, eye-catching and most realistic artificial <br> flowers ever. Whether you are looking for a single stem or a bouquet, garlands or centerpieces, <br> no matter what your style is, we have something for you.<br><br> I am sure it the right thing you need now. Don''t hesitate, bid now and never miss it. You will<br> receive a parcel contains as below.<br> 4 X Artificial Lavender Bouquet as picture show (The vase is NOT included) <br><br> Tips: When shipped, each bouquet are putting close in order to reduce space. Customers can <br> adjust the branches to the most natural state.<br><br> Note: Please be reminded that due to lighting effects and monitor''s brightness/contrast settings etc, <br> the color tone of the website''s photo may different from the actual item''s. Please take our color<br> description for reference.', NULL, NULL, 19, 10, 13, '61tVBHmeVWL.jpg', 'gtidea-4pcs-artificial-flocked-lavender-bouquet-in-purple-flowers-arrangements-bridal-home-diy-floor-garden-office-wedding-decor', 'B01M1HTNG6', '4 Pack', '61tVBHmeVWL.SL160.jpg', 'GTidea');
INSERT INTO item_item VALUES (4552, 'Debbie Meyer GreenBags Freshness-Preserving Food/Flower Storage Bags (Various Sizes, 20-Pack)', 'Help preserve the freshness and prolong the life of fruits, vegetables, baked goods and snacks with this revolutionary set of Debbie Meyer Greenbags. Debbie Meyer GreenBags are reusable up to 8-10 times, saving you money versus conventional produce bags. Every GreenBag is 100% BPA free. Designed to keep certain produce fresh for approximately 30 daysGreenBags keep produce fresh for up to 30 days, and reduce vitamin loss by up to 50% by preventing excess moisture. Keep food fresher, longer, to save money and reduce waste.', NULL, NULL, 19, 7, 13, '51ONDSA2BsZL.jpg', 'debbie-meyer-greenbags-freshness-preserving-foodflower-storage-bags-various-sizes-20-pack', 'B00I4V1U06', 'Green', '51ONDSA2BsZL.SL160.jpg', 'Debbie Meyer');
INSERT INTO item_item VALUES (4554, 'French Lavender Dried Lavender Buds - 1 Pound - Dry Flowers', 'Plant overview

Many people appreciate lavender (Lavandula angustifolia) for its aromatic fragrance, used in soaps, shampoos, and sachets for scenting clothes. The name lavender comes from the Latin root lavare, which means "to wash." 

Lavender most likely earned this name because it was frequently used in baths to help purify the body and spirit. However, this herb is also considered a natural remedy for a range of ailments from insomnia and anxiety to depression and mood disturbances. Recent studies bear out years of anecdotal evidence showing that lavender produces calming, soothing, and sedative effects. 

 

 

Insomnia

in folklore, pillows were filled with lavender flowers to help the restless fall sleep. There is now scientific evidence to suggest that aromatherapy with lavender slows the activity of the nervous system, improves sleep quality, promotes relaxation, and lifts mood in people suffering from sleep disorders. 

Studies also suggest that massage with essential oils, particularly lavender, may result in improved sleep quality, more stable mood, increased mental capacity, and reduced anxiety. 

In one recent study, participants who received massage with lavender felt less anxious and more positive than participants who received massage alone. Lavender flowers have also been approved by the Commission E in Germany as a tea for insomnia, restlessness, and nervous stomach irritations.

 

 

Aromatherapy 

Aromatherapists also use lavender as a tonic in inhalation therapy to treat headaches, nervous disorders, and exhaustion. Herbalists treat skin ailments, such as fungal infections (like candidiasis), wounds, eczema, and acne, with lavender oil. It is also used externally in a healing bath for circulatory disorders and as a rub for rheumatic ailments (conditions affecting the muscles and joints).', NULL, NULL, 17, 13, 13, '61DzfcKi8SL.jpg', 'french-lavender-dried-lavender-buds-1-pound-dry-flowers', 'B005LFQ5QW', 'Lavender , Purple', '61DzfcKi8SL.SL160.jpg', 'DriedDecor.com');
INSERT INTO item_item VALUES (4558, '7 Piece Set Animal Print Flower Pattern Soft 3d Comforter Set Including Matching 3d Sheet Set Queen (Red and Pink Rose-03)', 'Decorate your bedroom or guest room with these lovely modern style 3d flower and animal print pattern bedding set. Lush and soft box stitched comfort set and the 4 piece matching pattern sheet set to complete your bed seeting. These down alternative Comforters are made of 110 GSM microfiber fabric and filling is 180 GSM can be used as all season comforter or used as quilt perfect for all occasion. Easy to care for, and machine washable.', NULL, NULL, 13, 2, 13, '51LQGucZeQL.jpg', '7-piece-set-animal-print-flower-pattern-soft-3d-comforter-set-including-matching-3d-sheet-set-queen-red-and-pink-rose-03', 'B017500R14', 'Red and Pink Rose-03', '51LQGucZeQL.SL160.jpg', 'BEDnLINENS');
INSERT INTO item_item VALUES (4561, 'Kootek 42 Pieces Cake Decorating Supplies Kit with 36 Tips, 2 Silicone Pastry Bags, 2 Flower Nails, 2 Reusable Plastic Couplers Stainless Steel Icing Tip Set Tools for Cakes Cupcakes Cookies', '<p><b>Features:</b><br> - All tips are made from the highest quality, 100% food grade stainless steel (304).<br> - Silicone pastry bags FDA and LFGB approved.<br> - Easy to clean and dishwasher safe.<br> - Compact, lightweight and easy to use.<br> - Made with durable and premium materials so they last for as long as possible.<br> - Meets all industry standards.<br> - Our tips are corrosion resistant so they won''t rust.<br> - Reusable and non-stick.<br> - The tips, coupler and case are all tasteless and non-toxic.<br> - Perfect tools to decorate all your cakes, cupcakes, cookies, pastry and more.<br> - 45 days money back or replacement warranty.</p> <p><b>Package:</b><br> Stainless steel tips*36<br> Plastic couplers*2<br> Silicone pastry bag *2<br> Flower nails*2<br> Plastic storage case*1</p>', NULL, NULL, 8, 11, 13, '51HsCAoeOL.jpg', 'kootek-42-pieces-cake-decorating-supplies-kit-with-36-tips-2-silicone-pastry-bags-2-flower-nails-2-reusable-plastic-couplers-stainless-steel-icing-tip-set-tools-for-cakes-cupcakes-cookies', 'B01IT179W8', 'Silver', '51HsCAoeOL.SL160.jpg', 'Kootek');
INSERT INTO item_item VALUES (4565, 'Organic Lavender Flowers (Extra Grade - Dried) - 4oz Resealable Bag - 100% Raw From France - by Feel Good Organics', '<b>Certified USDA Organic Lavender Flowers (Extra Grade - Lavandula angustifolia)</b> <p>Relax your body and your mind by adding a dose of lavender into your day. Enhance your favorite recipes, fill the air with an aromatic potpourri or gift craft sachets to your friends and family. Steep a culinary infusion. Simmer an aromatic potpourri. Fill custom craft sachets. This resealable bag contains 4 ounces of certified organic, 100% raw lavender flowers from the fields of southern France.</p> <b>Where do the Organic Lavender Flowers come from?</b> <p>France. Our 100% raw, certified organic Lavender Flowers are imported to the USA directly from the fields of southern France.</p> <b>Do you add anything to the Lavender Flowers?</b> <p>No! Our organic Lavender Flowers are 100% raw with no additives.</p> <b>Are your Lavender Flowers Non-GMO?</b> <p>Yes! Feel Good Organics only sells Non-GMO products.</p> <b>Are your Lavender Flowers Gluten-Free?</b> <p>Yes!</p> <b>Is the bag resealable</b> <p>Yes! Our Lavender Flowers come packaged in the highest quality kraft bags. The bags are made with a resealable zipper, 5-layer structure with foil lining, rounded corners, and a tear notch for easy opening.</p> <b>How can I use Lavender Flowers at home?</b> <p>Relax your body and your mind by adding a dose of lavender into your day. Enhance your favorite recipes, fill the air with an aromatic potpourri or gift craft sachets to your friends and family. Steep a culinary infusion. Simmer an aromatic potpourri. Fill custom craft sachets.</p> <b>Feel Good Organics</b> <p>Feel Good Organics products are sourced directly from nutrient dense origins around the world. We are committed to delivering the highest quality, certified organic products at fair prices to help you live healthy and feel good.</p> <b>100% Money-Back Guarantee</b> <p>If you are not 100% satisfied with your purchase for any reason, just email us and we''ll refund your order in full - no questions asked!</p>', NULL, NULL, 8, 10, 13, '51jLWNkI4L.jpg', 'organic-lavender-flowers-extra-grade-dried-4oz-resealable-bag-100-raw-from-france-by-feel-good-organics', 'B01BTNMGXU', 'Purple', '51jLWNkI4L.SL160.jpg', 'Feel Good Organics');
INSERT INTO item_item VALUES (5136, 'Back to Black [Vinyl]', 'US version includes one exclusive ''hidden'' bonus track, ''You Know I''m No Good'' (featuring Ghostface Killah). ''Back to Black'' is the second album from London-based chanteuse Amy Winehouse. Although her 2003 debut was a success, her rowdy offstage behavior became the focus of tabloids and critics instead of the music. Because of this, Winehouse stepped out of the spotlight and concentrated on putting the focus back on her music. Three years later, her sophomore release has surprised critics and excited her fanbase. Combining a strong, Jazzy vocal style with often frank lyrical content recounting tales of love and loss, Winehouse is a truly talented songwriter with a good ear for melody, making this album an essential purchase. Includes the single ''Rehab''. Universal. 2007.', NULL, NULL, 1, 12, 18, '5193DWWE1DL.jpg', 'back-to-black-vinyl', 'B000RL2208', '', '5193DWWE1DL.SL160.jpg', 'VINYL');
INSERT INTO item_item VALUES (5140, 'Vessel (Clear Colored Vinyl w/Digital Download)', '<i>Vessel</i> is a complex collection of songs that shows why twenty one pilots was added to Fueled By Ramen''s extremely selective roster. The band entered a real studio for the first time ever with Grammy nominated producer Greg Wells (Weezer, Adele) to craft an album which merges elements of hip-hop, indie rock and punk in a way that''s so seamless, you''ll be rapping along one minute and caught up in a lush orchestral line the next.', NULL, NULL, 6, 16, 18, '41ufyovQuhL.jpg', 'vessel-clear-colored-vinyl-wdigital-download', 'B00JMBQE76', '', '41ufyovQuhL.SL160.jpg', 'VINYL');
INSERT INTO item_item VALUES (5144, 'Through The Past, Darkly (Big Hits Vol 2) [Clear Vinyl]', 'Through the Past, Darkly (Big Hits Vol. 2) was originally released in September 1969, and is the second compilation album of hits by the Rolling Stones, following Big Hits (High Tide and Green Grass). Through the Past made a huge splash on both sides of the Atlantic, reaching #2 in both the U.S. and UK. The album includes numerous Stones classics including Jumpin Jack Flash, Let s Spend The Night Together and Honky Tonk Women. The packaging stays true to the original layout, with its trademark octagonal-shaped album cover.', NULL, NULL, 19, 13, 18, '517RaX5hK0L.jpg', 'through-the-past-darkly-big-hits-vol-2-clear-vinyl', 'B00IZDWXSQ', '', '517RaX5hK0L.SL160.jpg', 'VINYL');
INSERT INTO item_item VALUES (5149, 'Led Zeppelin I (Remastered Original Vinyl)', '<div class="aplus"> <div class="leftImage" style="width: 350px;"> <div id="image0"><img   src="https://images-na.ssl-images-amazon.com/images/I/41n2k45V3pL.jpg" alt="Led Zeppelin I "><div class="imageCaption">Led Zeppelin I </div></div> </div> <h5><div id="header0">Led Zeppelin I</div></h5> <div id="text0" class="a-spacing-small"></div> <h5><div id="header1">Five Different Configurations</div></h5> <div id="text1" class="a-spacing-small"><p>See below for all different configurations of Led Zeppelin I.</p></div> <h5><div id="header2"></div></h5> <div id="text2" class="a-spacing-small"></div> <div class="break"></div><br> <div class="sixth-col"> <div class="centerImage"> <div id="image1"><img   src="https://images-na.ssl-images-amazon.com/images/I/11yjErNJFeL.jpg" alt=""><div class="imageCaption">Led Zeppelin I - Original CD</div></div> </div> </div> <div class="third-col"> <h5><div id="header3">Led Zeppelin I - Original CD</div></h5> <div id="text3" class="a-spacing-small"><p>The original album, newly remastered, in a gatefold sleeve with an 8 page booklet.</p></div> </div> <div class="sixth-col"> <div class="centerImage"> <div id="image2"><img   src="https://images-na.ssl-images-amazon.com/images/I/11a-0LUCQFL.jpg" alt=""><div class="imageCaption">Led Zeppelin I - Deluxe Edition Remastered Vinyl (Triple Vinyl)</div></div> </div> </div> <div class="third-col last"> <h5><div id="header4">Led Zeppelin I - Deluxe Edition Remastered Vinyl (Triple Vinyl)</div></h5> <div id="text4" class="a-spacing-small"><p>Original remastered LP, plus 2 LPs of companion audio on 180 gram vinyl in a tri-fold sleeve. Featuring a previously unreleased October 1969 concert from Paris, France.</p></div> </div> <div class="break"></div> <div class="sixth-col"> <div class="centerImage"> <div id="image3"><img   src="https://images-na.ssl-images-amazon.com/images/I/11M78eSKXpL.jpg" alt=""><div class="imageCaption">Led Zeppelin - Deluxe CD Edition (2 CD)</div></div> </div> </div> <div class="third-col"> <h5><div id="header5">Led Zeppelin I - Deluxe CD Edition (2 CD)</div></h5> <div id="text5" class="a-spacing-small"><p>Deluxe 2 CD package with the original artwork, plus the newly created negative artwork for the companion audio. The original album is newly remastered; the 2nd CD featuring a previously unreleased October 1969 concert from Paris, France. 16 page booklet.</p></div> </div> <div class="sixth-col"> <div class="centerImage"> <div id="image4"><img   src="https://images-na.ssl-images-amazon.com/images/I/21ZfkWEytYL.jpg" alt=""><div class="imageCaption">Led Zeppelin I - Original Vinyl (1 LP)</div></div> </div> </div> <div class="third-col last"> <h5><div id="header6">Led Zeppelin I - Original Vinyl (1 LP)</div></h5> <div id="text6" class="a-spacing-small"><p>Original album on 180 gram vinyl, newly remastered in single sleeve replicating the original album.</p></div> </div> <div class="break"></div> <div class="sixth-col"> <div class="centerImage"> <div id="image5"><img   src="https://images-na.ssl-images-amazon.com/images/I/21UtMFok0FL.jpg" alt=""><div class="imageCaption">Led Zeppelin I - Super Deluxe Edition Box (CD & LP)</div></div> </div> </div> <div class="third-col"> <h5><div id="header7">Led Zeppelin I - Super Deluxe Edition Box (CD & LP)</div></h5> <div id="text7" class="a-spacing-small"><p>Led Zeppelin’s debut album, newly remastered, and including an additional CD and double LP featuring a previously unreleased October 1969 concert from Paris, France.  Super Deluxe Edition Box Set Includes:  CD1: Original album newly remastered in vinyl replica sleeve   CD2: Companion audio featuring a previously unreleased October 1969 concert from Paris, France in a new sleeve  Vinyl 1: Original album newly remastered in single sleeve replicating the original album on 180 gram vinyl  Vinyl 2/3: Companion audio on two LPs (180 gram vinyl) in a new sleeve featuring negative artwork based on the original album artwork, and featuring a previously unreleased October 1969 concert from Paris, France  HD Download card with the original album @ 96/24 and the live concert from Paris @ 48/24  LP sized, individually numbered, high quality print of the original album cover  Album-size hardback book (72 pages)  Replica of original Atlantic press kit"</p></div> </div> <div class="sixth-col"> <div class="centerImage"> <div id="image6"><img   src="https://images-na.ssl-images-amazon.com/images/I/214+ZmuAItL.jpg" alt=""><div class="imageCaption">More Options</div></div> </div> </div> <div class="third-col last"> <h5><div id="header8">More options</div></h5> <div id="text8" class="a-spacing-small"><p>See all available versions of Led Zeppelin I, II, and III</p></div> </div> <div class="break"></div> </div>', NULL, NULL, 14, 19, 18, '51GMLZR2BtL.jpg', 'led-zeppelin-i-remastered-original-vinyl', 'B00IXHBMLS', '', '51GMLZR2BtL.SL160.jpg', 'WEA');
INSERT INTO item_item VALUES (5153, 'x (2LP 180 Gram Vinyl)(45rpm)', 'Note:<span id="caseCorrespondence_29600732555_text">Please note that the product is to be played at 45 rpm. Please make sure your turntable is on the proper setting to avoid audio sounding slow. <br /><br /></span>Double 180gm vinyl LP pressing. 2014 release, the follow-up to the British singer/songwriter''s breakthrough debut album +. X finds Sheeran collaborating with a stellar list of producers, including multiple Grammy-winners Rick Rubin and Jeff Bhasker, multiple Grammy-nominee Benny Blanco, Snow Patrol''s Johnny McDaid, and BRIT-Award nominee and + collaborator Jake Gosling. Features the exhilarating ''Sing''.', NULL, NULL, 14, 26, 18, '51IR2Bsta52BL.jpg', 'x-2lp-180-gram-vinyl45rpm', 'B00JKGYW7W', '', '51IR2Bsta52BL.SL160.jpg', 'VINYL');
INSERT INTO item_item VALUES (5157, 'Hotel California (180 Gram Vinyl)', 'Hotel Californiais the fifth studio album by the American rock band Eagles, released on Asylumin late 1976. It is the first Eagles album without the appearance of their founding member Bernie Leadonand their first album with guitaris Joe Walsh.', NULL, NULL, 4, 23, 18, '51MeMnrASsL.jpg', 'hotel-california-180-gram-vinyl', 'B00OJ43HFI', '', '51MeMnrASsL.SL160.jpg', 'EAGLES');
INSERT INTO item_item VALUES (5160, '"+" (Orange Colored Vinyl)', '2014 limited edition orange colored vinyl LP pressing reissue of his 2011 debut.', NULL, NULL, 1, 19, 18, '519c4KGZKrL.jpg', 'orange-colored-vinyl', 'B00MWHR0OS', '', '519c4KGZKrL.SL160.jpg', '');
INSERT INTO item_item VALUES (5164, 'Divide (2LP 45rpm 180-Gram Vinyl w/Digital Download)', 'DELUXE EDITION : 2LP set, with 4 rare BONUS tracks and a download code. New 2017 album from the unstoppable Suffolk songsmith! Part-produced by Benny Blanco. Includes "Shape Of You" and "Castle On The Hill".', NULL, NULL, 6, 28, 18, '61EZ5rZmX5L.jpg', 'divide-2lp-45rpm-180-gram-vinyl-wdigital-download', 'B01N216CIO', '', '61EZ5rZmX5L.SL160.jpg', '');
INSERT INTO item_item VALUES (5168, 'An Awesome Wave (Vinyl w/Digital Download)', 'Alt-J are a four piece that met while attending Leeds University in the UK. They signed to Infectious Records (Temper Trap, Local Natives) for Europe and the rest of the world before signing with Canvasback/ Atlantic for North America.<br><br><br>Vinyl Details: 12 black vinyl in a gatefold jacket (1 pocket), Includes a download card for the entire album along wiith several bonus remixes by Odd Future, My Morning Jacket, TV on the Radio.', NULL, NULL, 3, 19, 18, '61HSTjtqOcL.jpg', 'an-awesome-wave-vinyl-wdigital-download', 'B008OW1SAC', '', '61HSTjtqOcL.SL160.jpg', 'VINYL');
INSERT INTO item_item VALUES (5171, 'Sound & Color [Clear Vinyl 2 X LP (Standard Weight) - Gatefold -includes download card]', '<!--[if gte mso 9]><xml> <w:WordDocument> <w:View>Normal</w:View> <w:Zoom>0</w:Zoom> <w:TrackMoves /> <w:TrackFormatting /> <w:PunctuationKerning /> <w:ValidateAgainstSchemas /> <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid> <w:IgnoreMixedContent>false</w:IgnoreMixedContent> <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText> <w:DoNotPromoteQF /> <w:LidThemeOther>EN-US</w:LidThemeOther> <w:LidThemeAsian>X-NONE</w:LidThemeAsian> <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript> <w:Compatibility> <w:BreakWrappedTables /> <w:SnapToGridInCell /> <w:WrapTextWithPunct /> <w:UseAsianBreakRules /> <w:DontGrowAutofit /> <w:SplitPgBreakAndParaMark /> <w:EnableOpenTypeKerning /> <w:DontFlipMirrorIndents /> <w:OverrideTableStyleHps /> </w:Compatibility> <w:BrowserLevel>MicrosoftInternetExplorer4</w:BrowserLevel> <m:mathPr> <m:mathFont m:val="Cambria Math" /> <m:brkBin m:val="before" /> <m:brkBinSub m:val="--" /> <m:smallFrac m:val="off" /> <m:dispDef /> <m:lMargin m:val="0" /> <m:rMargin m:val="0" /> <m:defJc m:val="centerGroup" /> <m:wrapIndent m:val="1440" /> <m:intLim m:val="subSup" /> <m:naryLim m:val="undOvr" /> </m:mathPr></w:WordDocument> </xml><![endif]--><span style="font-size: 11.0pt; font-family: "Calibri",sans-serif; mso-fareast-font-family: Calibri; mso-fareast-theme-font: minor-latin; mso-bidi-font-family: "Times New Roman"; mso-ansi-language: EN-US; mso-fareast-language: EN-US; mso-bidi-language: AR-SA;">Alabama Shakes’ Sound & Color is the follow-up to the band''s Gold-certified debut album, Boys & Girls, which earned the group three GRAMMY nominations, including a nod for Best New Artist. Sound & Color demonstrates the tremendous strides made by a group of musicians who had only been playing together for a few months when they recorded their first album. From the searing single "Don''t Wanna Fight" to the garage-rock freak-out on “The Greatest” to the psychedelic space jam “Gemini,” Alabama Shakes build on the soulful blues-rock base and map a surprising, innovative new direction. Clear Vinyl 2 X LP (Standard Weight) - Gatefold -includes download card.</span><!--[if gte mso 9]><xml> <w:LatentStyles DefLockedState="false" DefUnhideWhenUsed="false"   DefSemiHidden="false" DefQFormat="false" DefPriority="99"   LatentStyleCount="371"> <w:LsdException Locked="false" Priority="0" QFormat="true" Name="Normal" /> <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 1" /> <w:LsdException Locked="false" Priority="9" SemiHidden="true"    UnhideWhenUsed="true" QFormat="true" Name="heading 2" /> <w:LsdException Locked="false" Priority="9" SemiHidden="true"    UnhideWhenUsed="true" QFormat="true" Name="heading 3" /> <w:LsdException Locked="false" Priority="9" SemiHidden="true"    UnhideWhenUsed="true" QFormat="true" Name="heading 4" /> <w:LsdException Locked="false" Priority="9" SemiHidden="true"    UnhideWhenUsed="true" QFormat="true" Name="heading 5" /> <w:LsdException Locked="false" Priority="9" SemiHidden="true"    UnhideWhenUsed="true" QFormat="true" Name="heading 6" /> <w:LsdException Locked="false" Priority="9" SemiHidden="true"    UnhideWhenUsed="true" QFormat="true" Name="heading 7" /> <w:LsdException Locked="false" Priority="9" SemiHidden="true"    UnhideWhenUsed="true" QFormat="true" Name="heading 8" /> <w:LsdException Locked="false" Priority="9" SemiHidden="true"    UnhideWhenUsed="true" QFormat="true" Name="heading 9" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="index 1" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="index 2" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="index 3" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="index 4" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="index 5" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="index 6" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="index 7" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="index 8" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="index 9" /> <w:LsdException Locked="false" Priority="39" SemiHidden="true"    UnhideWhenUsed="true" Name="toc 1" /> <w:LsdException Locked="false" Priority="39" SemiHidden="true"    UnhideWhenUsed="true" Name="toc 2" /> <w:LsdException Locked="false" Priority="39" SemiHidden="true"    UnhideWhenUsed="true" Name="toc 3" /> <w:LsdException Locked="false" Priority="39" SemiHidden="true"    UnhideWhenUsed="true" Name="toc 4" /> <w:LsdException Locked="false" Priority="39" SemiHidden="true"    UnhideWhenUsed="true" Name="toc 5" /> <w:LsdException Locked="false" Priority="39" SemiHidden="true"    UnhideWhenUsed="true" Name="toc 6" /> <w:LsdException Locked="false" Priority="39" SemiHidden="true"    UnhideWhenUsed="true" Name="toc 7" /> <w:LsdException Locked="false" Priority="39" SemiHidden="true"    UnhideWhenUsed="true" Name="toc 8" /> <w:LsdException Locked="false" Priority="39" SemiHidden="true"    UnhideWhenUsed="true" Name="toc 9" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="Normal Indent" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="footnote text" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="annotation text" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="header" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="footer" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="index heading" /> <w:LsdException Locked="false" Priority="35" SemiHidden="true"    UnhideWhenUsed="true" QFormat="true" Name="caption" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="table of figures" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="envelope address" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="envelope return" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="footnote reference" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="annotation reference" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="line number" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="page number" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="endnote reference" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="endnote text" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="table of authorities" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="macro" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="toa heading" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="List" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="List Bullet" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="List Number" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="List 2" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="List 3" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="List 4" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="List 5" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="List Bullet 2" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="List Bullet 3" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="List Bullet 4" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="List Bullet 5" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="List Number 2" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="List Number 3" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="List Number 4" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="List Number 5" /> <w:LsdException Locked="false" Priority="10" QFormat="true" Name="Title" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="Closing" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="Signature" /> <w:LsdException Locked="false" Priority="1" SemiHidden="true"    UnhideWhenUsed="true" Name="Default Paragraph Font" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="Body Text" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="Body Text Indent" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="List Continue" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="List Continue 2" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="List Continue 3" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="List Continue 4" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="List Continue 5" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="Message Header" /> <w:LsdException Locked="false" Priority="11" QFormat="true" Name="Subtitle" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="Salutation" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="Date" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="Body Text First Indent" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="Body Text First Indent 2" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="Note Heading" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="Body Text 2" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="Body Text 3" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="Body Text Indent 2" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="Body Text Indent 3" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="Block Text" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="Hyperlink" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="FollowedHyperlink" /> <w:LsdException Locked="false" Priority="22" QFormat="true" Name="Strong" /> <w:LsdException Locked="false" Priority="20" QFormat="true" Name="Emphasis" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="Document Map" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="Plain Text" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="E-mail Signature" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="HTML Top of Form" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="HTML Bottom of Form" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="Normal (Web)" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="HTML Acronym" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="HTML Address" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="HTML Cite" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="HTML Code" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="HTML Definition" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="HTML Keyboard" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="HTML Preformatted" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="HTML Sample" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="HTML Typewriter" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="HTML Variable" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="Normal Table" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="annotation subject" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="No List" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="Outline List 1" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="Outline List 2" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="Outline List 3" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="Table Simple 1" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="Table Simple 2" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="Table Simple 3" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="Table Classic 1" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="Table Classic 2" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="Table Classic 3" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="Table Classic 4" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="Table Colorful 1" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="Table Colorful 2" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="Table Colorful 3" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="Table Columns 1" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="Table Columns 2" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="Table Columns 3" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="Table Columns 4" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="Table Columns 5" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="Table Grid 1" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="Table Grid 2" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="Table Grid 3" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="Table Grid 4" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="Table Grid 5" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="Table Grid 6" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="Table Grid 7" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="Table Grid 8" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="Table List 1" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="Table List 2" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="Table List 3" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="Table List 4" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="Table List 5" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="Table List 6" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="Table List 7" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="Table List 8" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="Table 3D effects 1" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="Table 3D effects 2" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="Table 3D effects 3" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="Table Contemporary" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="Table Elegant" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="Table Professional" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="Table Subtle 1" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="Table Subtle 2" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="Table Web 1" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="Table Web 2" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="Table Web 3" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="Balloon Text" /> <w:LsdException Locked="false" Priority="39" Name="Table Grid" /> <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"    Name="Table Theme" /> <w:LsdException Locked="false" SemiHidden="true" Name="Placeholder Text" /> <w:LsdException Locked="false" Priority="1" QFormat="true" Name="No Spacing" /> <w:LsdException Locked="false" Priority="60" Name="Light Shading" /> <w:LsdException Locked="false" Priority="61" Name="Light List" /> <w:LsdException Locked="false" Priority="62" Name="Light Grid" /> <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1" /> <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2" /> <w:LsdException Locked="false" Priority="65" Name="Medium List 1" /> <w:LsdException Locked="false" Priority="66" Name="Medium List 2" /> <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1" /> <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2" /> <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3" /> <w:LsdException Locked="false" Priority="70" Name="Dark List" /> <w:LsdException Locked="false" Priority="71" Name="Colorful Shading" /> <w:LsdException Locked="false" Priority="72" Name="Colorful List" /> <w:LsdException Locked="false" Priority="73" Name="Colorful Grid" /> <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 1" /> <w:LsdException Locked="false" Priority="61" Name="Light List Accent 1" /> <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 1" /> <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 1" /> <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 1" /> <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 1" /> <w:LsdException Locked="false" SemiHidden="true" Name="Revision" /> <w:LsdException Locked="false" Priority="34" QFormat="true"    Name="List Paragraph" /> <w:LsdException Locked="false" Priority="29" QFormat="true" Name="Quote" /> <w:LsdException Locked="false" Priority="30" QFormat="true"    Name="Intense Quote" /> <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 1" /> <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 1" /> <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 1" /> <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 1" /> <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 1" /> <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 1" /> <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 1" /> <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 1" /> <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 2" /> <w:LsdException Locked="false" Priority="61" Name="Light List Accent 2" /> <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 2" /> <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 2" /> <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 2" /> <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 2" /> <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 2" /> <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 2" /> <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 2" /> <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 2" /> <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 2" /> <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 2" /> <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 2" /> <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 2" /> <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 3" /> <w:LsdException Locked="false" Priority="61" Name="Light List Accent 3" /> <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 3" /> <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 3" /> <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 3" /> <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 3" /> <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 3" /> <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 3" /> <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 3" /> <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 3" /> <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 3" /> <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 3" /> <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 3" /> <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 3" /> <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 4" /> <w:LsdException Locked="false" Priority="61" Name="Light List Accent 4" /> <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 4" /> <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 4" /> <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 4" /> <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 4" /> <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 4" /> <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 4" /> <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 4" /> <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 4" /> <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 4" /> <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 4" /> <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 4" /> <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 4" /> <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 5" /> <w:LsdException Locked="false" Priority="61" Name="Light List Accent 5" /> <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 5" /> <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 5" /> <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 5" /> <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 5" /> <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 5" /> <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 5" /> <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 5" /> <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 5" /> <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 5" /> <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 5" /> <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 5" /> <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 5" /> <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 6" /> <w:LsdException Locked="false" Priority="61" Name="Light List Accent 6" /> <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 6" /> <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 6" /> <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 6" /> <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 6" /> <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 6" /> <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 6" /> <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 6" /> <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 6" /> <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 6" /> <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 6" /> <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 6" /> <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 6" /> <w:LsdException Locked="false" Priority="19" QFormat="true"    Name="Subtle Emphasis" /> <w:LsdException Locked="false" Priority="21" QFormat="true"    Name="Intense Emphasis" /> <w:LsdException Locked="false" Priority="31" QFormat="true"    Name="Subtle Reference" /> <w:LsdException Locked="false" Priority="32" QFormat="true"    Name="Intense Reference" /> <w:LsdException Locked="false" Priority="33" QFormat="true" Name="Book Title" /> <w:LsdException Locked="false" Priority="37" SemiHidden="true"    UnhideWhenUsed="true" Name="Bibliography" /> <w:LsdException Locked="false" Priority="39" SemiHidden="true"    UnhideWhenUsed="true" QFormat="true" Name="TOC Heading" /> <w:LsdException Locked="false" Priority="41" Name="Plain Table 1" /> <w:LsdException Locked="false" Priority="42" Name="Plain Table 2" /> <w:LsdException Locked="false" Priority="43" Name="Plain Table 3" /> <w:LsdException Locked="false" Priority="44" Name="Plain Table 4" /> <w:LsdException Locked="false" Priority="45" Name="Plain Table 5" /> <w:LsdException Locked="false" Priority="40" Name="Grid Table Light" /> <w:LsdException Locked="false" Priority="46" Name="Grid Table 1 Light" /> <w:LsdException Locked="false" Priority="47" Name="Grid Table 2" /> <w:LsdException Locked="false" Priority="48" Name="Grid Table 3" /> <w:LsdException Locked="false" Priority="49" Name="Grid Table 4" /> <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark" /> <w:LsdException Locked="false" Priority="51" Name="Grid Table 6 Colorful" /> <w:LsdException Locked="false" Priority="52" Name="Grid Table 7 Colorful" /> <w:LsdException Locked="false" Priority="46"    Name="Grid Table 1 Light Accent 1" /> <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 1" /> <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 1" /> <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 1" /> <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 1" /> <w:LsdException Locked="false" Priority="51"    Name="Grid Table 6 Colorful Accent 1" /> <w:LsdException Locked="false" Priority="52"    Name="Grid Table 7 Colorful Accent 1" /> <w:LsdException Locked="false" Priority="46"    Name="Grid Table 1 Light Accent 2" /> <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 2" /> <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 2" /> <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 2" /> <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 2" /> <w:LsdException Locked="false" Priority="51"    Name="Grid Table 6 Colorful Accent 2" /> <w:LsdException Locked="false" Priority="52"    Name="Grid Table 7 Colorful Accent 2" /> <w:LsdException Locked="false" Priority="46"    Name="Grid Table 1 Light Accent 3" /> <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 3" /> <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 3" /> <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 3" /> <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 3" /> <w:LsdException Locked="false" Priority="51"    Name="Grid Table 6 Colorful Accent 3" /> <w:LsdException Locked="false" Priority="52"    Name="Grid Table 7 Colorful Accent 3" /> <w:LsdException Locked="false" Priority="46"    Name="Grid Table 1 Light Accent 4" /> <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 4" /> <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 4" /> <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 4" /> <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 4" /> <w:LsdException Locked="false" Priority="51"    Name="Grid Table 6 Colorful Accent 4" /> <w:LsdException Locked="false" Priority="52"    Name="Grid Table 7 Colorful Accent 4" /> <w:LsdException Locked="false" Priority="46"    Name="Grid Table 1 Light Accent 5" /> <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 5" /> <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 5" /> <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 5" /> <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 5" /> <w:LsdException Locked="false" Priority="51"    Name="Grid Table 6 Colorful Accent 5" /> <w:LsdException Locked="false" Priority="52"    Name="Grid Table 7 Colorful Accent 5" /> <w:LsdException Locked="false" Priority="46"    Name="Grid Table 1 Light Accent 6" /> <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 6" /> <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 6" /> <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 6" /> <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 6" /> <w:LsdException Locked="false" Priority="51"    Name="Grid Table 6 Colorful Accent 6" /> <w:LsdException Locked="false" Priority="52"    Name="Grid Table 7 Colorful Accent 6" /> <w:LsdException Locked="false" Priority="46" Name="List Table 1 Light" /> <w:LsdException Locked="false" Priority="47" Name="List Table 2" /> <w:LsdException Locked="false" Priority="48" Name="List Table 3" /> <w:LsdException Locked="false" Priority="49" Name="List Table 4" /> <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark" /> <w:LsdException Locked="false" Priority="51" Name="List Table 6 Colorful" /> <w:LsdException Locked="false" Priority="52" Name="List Table 7 Colorful" /> <w:LsdException Locked="false" Priority="46"    Name="List Table 1 Light Accent 1" /> <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 1" /> <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 1" /> <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 1" /> <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 1" /> <w:LsdException Locked="false" Priority="51"    Name="List Table 6 Colorful Accent 1" /> <w:LsdException Locked="false" Priority="52"    Name="List Table 7 Colorful Accent 1" /> <w:LsdException Locked="false" Priority="46"    Name="List Table 1 Light Accent 2" /> <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 2" /> <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 2" /> <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 2" /> <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 2" /> <w:LsdException Locked="false" Priority="51"    Name="List Table 6 Colorful Accent 2" /> <w:LsdException Locked="false" Priority="52"    Name="List Table 7 Colorful Accent 2" /> <w:LsdException Locked="false" Priority="46"    Name="List Table 1 Light Accent 3" /> <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 3" /> <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 3" /> <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 3" /> <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 3" /> <w:LsdException Locked="false" Priority="51"    Name="List Table 6 Colorful Accent 3" /> <w:LsdException Locked="false" Priority="52"    Name="List Table 7 Colorful Accent 3" /> <w:LsdException Locked="false" Priority="46"    Name="List Table 1 Light Accent 4" /> <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 4" /> <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 4" /> <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 4" /> <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 4" /> <w:LsdException Locked="false" Priority="51"    Name="List Table 6 Colorful Accent 4" /> <w:LsdException Locked="false" Priority="52"    Name="List Table 7 Colorful Accent 4" /> <w:LsdException Locked="false" Priority="46"    Name="List Table 1 Light Accent 5" /> <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 5" /> <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 5" /> <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 5" /> <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 5" /> <w:LsdException Locked="false" Priority="51"    Name="List Table 6 Colorful Accent 5" /> <w:LsdException Locked="false" Priority="52"    Name="List Table 7 Colorful Accent 5" /> <w:LsdException Locked="false" Priority="46"    Name="List Table 1 Light Accent 6" /> <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 6" /> <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 6" /> <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 6" /> <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 6" /> <w:LsdException Locked="false" Priority="51"    Name="List Table 6 Colorful Accent 6" /> <w:LsdException Locked="false" Priority="52"    Name="List Table 7 Colorful Accent 6" /> </w:LatentStyles> </xml><![endif]--><!--[if gte mso 10]> <style>  /* Style Definitions */  table.MsoNormalTable  {mso-style-name:"Table Normal";  mso-tstyle-rowband-size:0;  mso-tstyle-colband-size:0;  mso-style-noshow:yes;  mso-style-priority:99;  mso-style-parent:"";  mso-padding-alt:0in 5.4pt 0in 5.4pt;  mso-para-margin:0in;  mso-para-margin-bottom:.0001pt;  mso-pagination:widow-orphan;  font-size:10.0pt;  font-family:"Times New Roman",serif;} </style> <![endif]-->', NULL, NULL, 11, 19, 18, '511Lt1IJgHL.jpg', 'sound-color-clear-vinyl-2-x-lp-standard-weight-gatefold-includes-download-card', 'B00TEJF2N8', '', '511Lt1IJgHL.SL160.jpg', 'VINYL');
INSERT INTO item_item VALUES (4569, 'Qedertek Solar String Lights, 21ft 50 LED Fairy Blossom Flower Garden Lights for Outdoor, Home, Lawn, Wedding, Patio, Party and Holiday Decorations (Multi-Color)', '<b>Features</b> <br>Solar powered led light strings, no utility energy costs <br>Energy saving & eco-friendly LED string lights, high energy conversion rate. <br>Lighting sensor technology, the string lights will light up automatically at dusk and may automatically turn off at daytime <br><br> <b>Specifications</b> <br>Light color: Multi-Color (red/yellow/green/purple) <br>Setting: Indoor/Outdoor <br>LED Quantity: 50 LED <br>Solar Panel: 2V/100mA <br>Battery type: Rechargeable 600mAH NI-MH Battery <br>Light source: LED <br>Switch: ON/OFF, MODE <br>Working mode: Flash/Steady on <br>Charging time: 6-8hrs <br>Light length: 21ft(7m) <br>Length between 2 blubs:0.3ft(0.1m) <br>Length from Solar panel to first stake: 6.5ft(2m) <br><br> <b>Warm Tips</b> <br>1. If the ground is too hard, try to soften the ground with water before you set up the solar panel <br>2. It is suggested the solar panel to be fully charged for 8hrs at the first use. <br>3. Set up the angle adjustable solar panel where there is enough sunlight <br>4. Turn the light on and set light mode before charging the solar power, so it will light up at dusk. <br><br> <b>Warranty</b> <br>For any problem, please contact us at first, we will offer you a replacement or refund you. <br><br> <b>What''s in the box</b> <br>1 x Qedertek 50LED Flower Solar Christmas Lights <br>1 x Solar Panel with Ground Stake <br>1 x User Instruction', NULL, NULL, 1, 5, 13, '61qhEIsEuXL.jpg', 'qedertek-solar-string-lights-21ft-50-led-fairy-blossom-flower-garden-lights-for-outdoor-home-lawn-wedding-patio-party-and-holiday-decorations-multi-color', 'B012VIRJ4I', 'Multicolor', '61qhEIsEuXL.SL160.jpg', 'LuckLED');
INSERT INTO item_item VALUES (4576, 'obmwang 2000 PCS Dark Red Silk Rose Petals Wedding Flower Decoration', '2000 PCS Dark Red Silk Rose Petals Wedding Flower Decoration. We have all colors. Please see our other listings. When you receive the flower petals, won''t come with the retail package, they was pressed together. This is how they come from the factory. You need fluff out the petals when you receive them.', NULL, NULL, 12, 7, 13, '519oWrDPDoL.jpg', 'obmwang-2000-pcs-dark-red-silk-rose-petals-wedding-flower-decoration', 'B009DALC4G', 'Dark Red', '519oWrDPDoL.SL160.jpg', 'obmwang');
INSERT INTO item_item VALUES (4580, 'Tissue Flower Garland by Fun Express (1-Pack)', 'This stunning garland is perfect for decorating your luau or jungle themed event string it over a doorway or around the buffet table1 tropical garland.9 ft. x 3"tissue garland.', NULL, NULL, 16, 5, 13, '51IIhNm86L.jpg', 'tissue-flower-garland-by-fun-express-1-pack', 'B004N5HMX6', 'multi color', '51IIhNm86L.SL160.jpg', 'Fun Express');
INSERT INTO item_item VALUES (4585, 'Frontier Co-op Organic Chamomile Flowers, German, Whole, 1 Pound Bulk Bag', 'Make flavorful, comforting, gentle, traditional chamomile tea with German chamomile flowers. Try this versatile herb in your favorite DIY applications — great for shampoos and conditioners for light colored hair, skin care creams and lotions, and in relaxing bath blends. Use in pot-pourri blends as well.', NULL, NULL, 11, 16, 13, '51nW4tMeZNL.jpg', 'frontier-co-op-organic-chamomile-flowers-german-whole-1-pound-bulk-bag', 'B001VNGN9C', '', '51nW4tMeZNL.SL160.jpg', 'Frontier');
INSERT INTO item_item VALUES (4593, 'Hibiscus Flowers for Tabletop Decoration ( Pack of 36 )', 'Decorative Hibiscus. These lovely polyester flowers give a tropical touch to place settings, centerpieces and more! For your next beach party fun, Decorative Hibiscus flowers make great table toppers or treat bag filler. Each 4 1/2" bloom is a different color. (3 dozen per unit)', NULL, NULL, 4, 5, 13, '51BNPhlDo0L.jpg', 'hibiscus-flowers-for-tabletop-decoration-pack-of-36', 'B01N5RA7UR', '', '51BNPhlDo0L.SL160.jpg', 'Oojami');
INSERT INTO item_item VALUES (4598, 'Set of 4, Ipow Flower Floral Canvas Cosmetic Pen Pencil Stationery Pouch Bag Case(Pastorabl)', 'The Ipow floral case has an amazing capacity.In addition to holding lots of your everyday writing tools, the case keeps them organized. The large main compartment is ideal for pens, pencils, and markers, and includes a small mesh pocket handy for erasers and other small items Several different colors available. Ipow products are perfect for your on-the-go lifestyle. <br> <br><b>Case dimensions:</b> Approximately 8 inches(long), 4 inches(wide)and 2 inches(deep) <br> <br>Ipow pen case bag features elegant bright colors with lovely design and craftsmanship. In addition to your personal use, you can present one to your friends. It is worth your every penny. <br>This is a simple and elegant case,the cotton matieral is soft,you can take it as the pen case and makeup bag,It''s very practical for your daily life. Action is better than excitement. <br> <br><b>Features: </b> <br>Made of high quality material, it''s very practical for your daily life <br>You can put pen, coins, or other small things <br>The desk pen bag can keep your pens or other accessories in order, so you can find them easily <br>Keep your stationery safe and in style with this elegant pen bag <br>It is very comfortable and convenient for you to use this pen bag <br> <br><b>Package Includes:</b> <br>4 x Pencil case', NULL, NULL, 12, 8, 13, '619IDQBq5KL.jpg', 'set-of-4-ipow-flower-floral-canvas-cosmetic-pen-pencil-stationery-pouch-bag-casepastorabl', 'B00MIAX994', '', '619IDQBq5KL.SL160.jpg', 'IPOW');
INSERT INTO item_item VALUES (4602, 'Luyue Vintage Artificial Peony Silk Flowers Bouquet, Light Pink', '<b>Luyue Vintage Artificial Peony Silk Flowers Bouquet Home Wedding Decoration</b><br><br>Do you want to have the flowers which never wither and fall? Yes, we do! The artificial flowers we provide are made of cloth and plastic. The flowers are realistic, perfect for wedding decoration, table arrangement or elegant home decoration.<br><br><b>Condition</b>: 100% Brand New<br><br><b>Package</b>: 1 pieces fake peony flower in one bag; <br><br><b>Color</b>: light pink,dark pink,purple,coffee,white,cameo brown; <br><br> <b>Material</b>:Silk leaves,silk flower,Plastic stem;<br> <br><b>Brand</b>: Luyue <br><br><b>Size</b>: About 1.7 feets.<br><br><b>Arrangement:</b>Best match 2 pieces peony flowers in one vase.<br><br><b>Crafts:</b>: This artificial peony flower are made by handmade and machine.And there are a little glue that leave on the leave, you can cut it.It is not quality problem.<br>The fake flowers are suit for wedding,bedroom,garden,balcony,shopping shopand etc.<br>.<br> <b>Tips</b>:<br>** There would be accumulated dust if you put it in a place for very long time, You can use the hair dryer with cold wind to remove the dust <br> *If it was seriously dirty,you could sink it into salt water with high concentration for 10 minutes and then add neutral detergent and then rinse twice. <br> *Don''t wash it by hands. We suggest that you don''t need to wash it by hands and don''t wash too frequently. It will fade if you wash it too frequently. <br> *Please don''t put it under strong sunshine.You''d better to dry it by the natural wind. <br><br><b>Brand Culture</b><br><br><b>Luyue </b>is the factory in China, our main product are artificail flower, artificial vines, wedding bouquet,grass lawn and etc', NULL, NULL, 8, 12, 13, '51nWKnzq7DL.jpg', 'luyue-vintage-artificial-peony-silk-flowers-bouquet-light-pink', 'B01CVM5YKU', 'Light Pink', '51nWKnzq7DL.SL160.jpg', 'Luyue');
INSERT INTO item_item VALUES (3870, 'Vans Unisex Authentic (Hearts Tape) Pink Lady/R Skate Shoe 6.5 Men US / 8 Women US', 'Vans keeps it classic with the Authentic skate shoes..', NULL, NULL, 15, 41, 3, '41WJMBq6yaL.jpg', 'vans-unisex-authentic-hearts-tape-pink-ladyr-skate-shoe-65-men-us-8-women-us', 'B01I2EQ2H0', 'Pink Lady/R', '41WJMBq6yaL.SL160.jpg', 'Vans');
INSERT INTO item_item VALUES (4840, 'Sycees 0.5W Plug-in LED Night Light Lamp with Dusk to Dawn Sensor, Daylight White, 6-Pack', '<strong>You must have the experience of bumping into something when you get  up in the middle of the night. SYCEES 0.5W LED Night Light is just  designed to release you from these troubles</strong><br /><br /><strong>From the  frosted white diffuser ring, the Light emits just the right amount of  soft glow, bright enough for finding your way in the dark, without  turning on an overhead light, without being annoying</strong><br /><br /><strong>Specification:</strong><br />- Input Voltage: AC 120V<br />- Operating Frequency: 60 Hz<br />- Power Consumption: 0.5W(MAX)<br />- LED Type: SMD 3528<br />- LED Quantity: 4pcs<br />- Light Color: Daylight White(6000K)<br />- Lifespan: 50000 Hours<br />- Sensor Type: Photoelectric Sensor (Light Sensor)<br /><br /><strong>Say  good bye to bumping into obstacles in the dark, just get SYCEES 0.5W  Led Night Light and distribute them around your house: hallway,  bathroom, bedroom, living room, kitchen, etc</strong><br />', NULL, NULL, 7, 13, 13, '41nf9hxXKzL.jpg', 'sycees-05w-plug-in-led-night-light-lamp-with-dusk-to-dawn-sensor-daylight-white-6-pack', 'B01DLLTDLG', 'Daylight White, 6-Pack', '41nf9hxXKzL.SL160.jpg', 'SYCEES');
INSERT INTO item_item VALUES (4843, 'Zion Judaica Quality Tealight Candles Unscented Set of 120 - Stark White', 'Package of 120 clean burning unscented Tealight candles in a self-standing aluminum tin. With these quality Tealights you can enjoy the warm glow of a fine candle while enjoying the maximum safety of the tea light candle. If you''re a restaurant, party planner or just enjoy dining to the romantic touch of tealites, these quality long burning boughies (in French) will deliver the ultimate and lasting radiation of warmth. European made with a special technique to prevent early burn out of your TeaLights. Tea Lights are an efficient and inexpensive, cost effective form of candle lighting for your ritual and religious ceremonies of Shabbat and Holidays. Universal size of ½" tall x 1.5" diameter. Burns nice and clean to the last drop for 4-4.5 hours.', NULL, NULL, 5, 12, 13, '51CLsSTtH1L.jpg', 'zion-judaica-quality-tealight-candles-unscented-set-of-120-stark-white', 'B00DUF1ANI', 'Stark Withe', '51CLsSTtH1L.SL160.jpg', 'Zion Judaica Ltd');
INSERT INTO item_item VALUES (4845, 'LE 16.4ft LED Flexible Light Strip, 300 Units SMD 2835 LEDs, 12V DC Non-waterproof, Light Strips, LED ribbon, DIY Christmas Holiday Home Kitchen Car Bar Indoor Party Decoration (Daylight White)', '<b>Please Note:</b> <br> <b>1. Neon Mart</b> is the only legally authorized seller on amazon, and the products from other sellers are all unlawful reproduction. <br> <b>2. A power adapter is required but not included</b>, Please search ''Lighting EVER 5000028/B019Q3U72M'' on Amazon if you need one. <br> <br> <b>Color:</b> Daylight White <br> <b>Size of LEDs: </b> 2835 <br> <b>Lenth of a tape: </b> 16.4ft <br> <b>LEDs Quantity: </b> 300 <br> <b>Working Voltage: </b> 12V DC <br> <b>Waterproof: </b> No <br> <b>Safe to use. </b> The working voltage is 12V. Extremely low heat. It is touchable and safe to children. <br> <b>Cuttable and linkable. </b> Easy to cut and use with Lighting EVER accessory. It can be cut every 3 LEDs along the cutting marks, without damaging the rest strips. <br> <b>Flexible operations. </b> Slim, compact and flexible PCB strip. Mount end-to-end for bendable or angled patterns, or in continuous rows. <br> <b>Reduce re-lamp frequency. </b> Lifespan is over 50000 hrs. Save effort and maintenance costs on changing lights frequently. <br> <b>Eco-friendly. RoHS compliant. </b> No battery. No lead or mercury. No UV or IR Radiation. <br> <b>Accessories included:</b> 2 Strip connectors and 1 DC cable. <br>For extra connectors and DC adapter cables, please search "Lighting EVER 5000021" on Amazon<br><br><b>Accessories optional (not included) </b> <br> Remote controller for dimmable feature. Please search ''Lighting EVER 5000008'' on Amazon. <br> <b>About LE </b> <br> Lighting EVER, abbreviated to LE, focuses on creating the best lighting experience. <br> Only high end LED and advanced optical design are adopted. Enjoy lighting with LE. <br>', NULL, NULL, 17, 7, 13, '51WPp6leVvL.jpg', 'le-164ft-led-flexible-light-strip-300-units-smd-2835-leds-12v-dc-non-waterproof-light-strips-led-ribbon-diy-christmas-holiday-home-kitchen-car-bar-indoor-party-decoration-daylight-white', 'B00HSF65MC', 'Daylight White', '51WPp6leVvL.SL160.jpg', 'Lighting EVER');
INSERT INTO item_item VALUES (4848, 'Homemory Realistic and Bright Flickering Bulb Battery Operated Flameless LED Tea Light for Seasonal & Festival Celebration, Pack of 12, Electric Fake Candle in Warm White and Wave Open', '<b><br>Tired of Traditional Candles that Melt, Drip, Smoking, risk of fire when Lighting.</b></br> <br>THEN YOU''VE COME TO THE RIGHT PLACE!</br><b>PREMIUM QUALITY AND DURABLE ELECTRIC CANDLES:</b><br> Homemory Wavy Battery Operated Tea Lights are made from the best quality materials. They come with batteries included and last a long time with their flickering light being very realistic. They can be used as decor for many occasions and places; the Homemory Tealight Warm White Flameless Candles add an atmospheric ambience to any place.<br> • Safe for usage in any setting or occasion because the Tealight Wavy Flameless Candle doesn''t have an open flame and it doesn''t heat up during usage.<br> • These candles can also be given away as gifts or party favors. They are easily portable and can be used for a long period of time without having to change the battery.<br> • The Tea light Warm White Candle is designed to flicker in a realistic way so that one can feel the ambience of an actual candle flame without any hazard or hassles.<br> • Very easy to use, these candles can be turned on and off by the flick of a switch.<br> • Batteries are included in this product. The batteries are CR2032 lithium batteries that will last approx 60 hrs of non-stop use.<br> <b>Specification:</b><br> 1.Material: LED+PP.<br> 2.Size: Diameter 3.7cm/1.4inch+ Height 3.2cm/1.25inch.<br> 3.Battery: CR2032 button cell.<br> 4.Battery life: 72 hours-100hours.<br> 5.Light color: warm white.<br> <br> 6.Appearance color: white.<br><b>Package include:</b><br> 12 X LED tea light Candle.<br> <b>Homemory- is a registered trademark protected by the US Trademark Law. Homemory products are sold by authorized sellers only. Each Product has its own package with Homemory Logo</b>', NULL, NULL, 3, 9, 13, '41JZpMBPbTL.jpg', 'homemory-realistic-and-bright-flickering-bulb-battery-operated-flameless-led-tea-light-for-seasonal-festival-celebration-pack-of-12-electric-fake-candle-in-warm-white-and-wave-open', 'B01EDKGFGU', 'White', '41JZpMBPbTL.SL160.jpg', 'Homemory');
INSERT INTO item_item VALUES (4851, 'LED String Lights 33 ft with 100 LEDs, TaoTronics Waterproof Decorative Lights for Bedroom, Patio, Parties ( Copper Wire Lights, Warm White )', 'SunvalleyTek/Sunvalley is SOLE TaoTronic brand seller ! ONLY products purchased from SunvalleyTek/Sunvalley are covered with TaoTronics warranty. You will own first-rate product with first-rate package, and best after-sale service. If you have purchased non-original TaoTronics products from other unauthorized sellers or fake followers, please contact the seller for return or warranty issues. you probably will have to bear inferior quality and packing, more than 15 days slow delivery time form China and weak after-sale. <br> <br> Create a magical lighting experience for your home, party or business with the TaoTronics warm white STAR LIGHTS . Christmas, New Year''s and birthday parties will glow with creativity when you include these bendable and flexible lights to your décor. Wrap them around plants or patio furniture in your garden, or even around and behind artwork in your home. Decorate your cubicle at work or use it to impress visitors to your restaurant or shop. Crafted from high-quality copper, the set is designed to be used both indoors and outdoors without worry. 5 foot adapter cord + 33 foot of lighting wire with 100 individual LEDs, this makes the star light less intense and more pleasant for the eyes. <br> <br> TaoTronics stands behind all of its products 100%. These lights come with a 12 month warranty if you are not completely satisfied. <br><br><b>Notice</b><br> Do not apply excessive force or repetitively bend the same spot.<br><br><b>Warm Tips</b><br>The string light could not be extended or connected with other string lights.', NULL, NULL, 9, 10, 13, '61btgicJRL.jpg', 'led-string-lights-33-ft-with-100-leds-taotronics-waterproof-decorative-lights-for-bedroom-patio-parties-copper-wire-lights-warm-white', 'B00GUDMO78', 'Warm White', '61btgicJRL.SL160.jpg', 'TaoTronics');
INSERT INTO item_item VALUES (4853, 'Skip Hop Moonlight and Melodies Nightlight Soother, Owl', 'The nightlight''s modern design and calming color palette coordinate with any nursery decor. A selection of gentle melodies and nature sounds soothe baby,  and an adjustable lens projects a starry night scape that your little one can enjoy from their favorite sleeping position. Features: Soothe baby with sound and light; Adjustable-angle lens projects stars on walls or ceiling; Plays up to 60 minutes of continuous music or nature sounds; Dimmable LEDs emit soft nightlight glow with modern leaf pattern; Fabric wings double as speakers; Plays four melodies and four nature sounds; Volume control; 15, 30, or 60 minute auto-off timer; Plugs into any standard outlet.', NULL, NULL, 18, 32, 13, '41LGZWsjJoL.jpg', 'skip-hop-moonlight-and-melodies-nightlight-soother-owl', 'B00SIL7EZ2', 'Moonlight and Melodies, White', '41LGZWsjJoL.SL160.jpg', 'Skip Hop');
INSERT INTO item_item VALUES (4861, 'VDOMUS Microfiber Bathroom Contour Rugs Combo, Set of 2 Soft Shaggy Non Slip Bath Shower Mat and U-shaped Toilet Floor Rug - Dark Gray', '<p>The Blue Vdomus bathroom rugs set is both luxurious and durable with its super soft, super absorbent microfibres.A must for bethroom and toliet.And the non-skip bottom keeps you and you family from slipping. Machine washable and easy care. When it gets dirty, just toss it into machinethen air dry it. So easy and quick.<br> <p><b>Features:</b><br> 1. machine washable and dry fast: when they get dirty, just throw them in the washer AND dryer, and they look brand new.<br> 2. soft and skin-friendly: the big difference between it and other bathroom mat products on the market is that ours is more soft skin-friendly.Keeps you from the could floor.<br><p> <p><b>VDOMUS Guarantee:</b><br> If for any reason you are not happy with any product please do not hesitate to contact us and we try our best to solve it once see your mails. No hassles. No headaches.<br><p> <p><b>Package:</b><br> 1 piece*Non Slip Microfiber Bath Mat<br> 1 piece*Nonskid contour bathroom rug <br></p>', NULL, NULL, 5, 22, 14, '51M61uYmVcL.jpg', 'vdomus-microfiber-bathroom-contour-rugs-combo-set-of-2-soft-shaggy-non-slip-bath-shower-mat-and-u-shaped-toilet-floor-rug-dark-gray', 'B01M3471L6', 'Dark Gray', '51M61uYmVcL.SL160.jpg', 'VDOMUS');
INSERT INTO item_item VALUES (4864, 'Soft Non Slip Absorbent Bath Rugs,Memory Foam Bath Mats by DocBear (Gray,Size:W17"xL24")', '100% Coral velvet fabric,soft,comfortable,non-slip latex bottom,easy to clean and market other bathroom mat products biggest difference is that DocBear bath mats unique design and gentle slow return bomb bath mats internal filling using memory foam that allows you to set foot more soft skin-friendly,DocBear brands is specialized in the production of various home mats,Whether as kicthen mats,bedroom mat,bathroom mats,or door mat,Docbear mats is your best chose,let you feel the high quality of home life <br> <b>Feature</b> <br> 1.Machine made memory foam bath rug <br> 2.Non slip bathroom rug <br> 3.Memory foam bathroom rugs have strong water absorbing capacity <br> <br>[Contains]:Slow rebound memory foam <br> [Material] Front: 100% Coral <br> [Size] Containing edging 17* 24 inch(error of - / + 0.4 inch) <br> [Thickness] Overall thickness :0.5 inch', NULL, NULL, 2, 11, 14, '51OshdNwHL.jpg', 'soft-non-slip-absorbent-bath-rugsmemory-foam-bath-mats-by-docbear-graysizew17xl24', 'B0179K64XU', 'Gray', '51OshdNwHL.SL160.jpg', 'Docbear');
INSERT INTO item_item VALUES (4866, 'Norcho Soft Microfiber Non-slip Antibacterial Rubber Luxury Bath Mat Rug 31"x19" White', '<b>From the manufacturer:</b> <br> Go directly from shower to comfort with the Threshold Luxury Bath Rug in White. This pretty, natural bath mat gives your toes a deep, cotton pile to sink into after your bath. You can get clean warm softness from both sides. Finish the look of your current bathroom re-do with the luxury of Threshold. 31"x 19"(LxW). <br> <br> <b> Specifications:</b> <br> <b> Color: </b>White <br> <b> Weight:</b>21.50oz <br> <b> Size: </b>31" x 19"(L x W) <br> <b> Material: </b>microfiber and rubber <br> <b> Designed With Non-Slip Backing </b> The bottom is made of SBR latex baked to keep stable from slipping, Don''t worry about slipping, even when wet. <br> <b>100% Machine Washable </b> Put the bath mat into the washing machine in cold water and hang to dry, after cleaning. Don''t worry about drop wool very much <br> <b> Super Soft and Comfortable</b> Designed to absorb water and keep your bathroom floor clean; with thousands of long floss and looks good texture, perfect for bathroom, bedroom, living room using <br> <br> <b>NOTE:</b> <br> <b>Wash it before use, all the rugs are new from factory, please wash it to removes the smells.</b> <br> <b>Size (Inch): Unit Inch; Sizes below are measured in flat-laid position, hand measurement will have discrepancy of about 1 Inch.</b> <br> <br> <b>Package Includes:</b> <br> 1 x Bathroom Rug', NULL, NULL, 6, 19, 14, '518244rHFWL.jpg', 'norcho-soft-microfiber-non-slip-antibacterial-rubber-luxury-bath-mat-rug-31x19-white', 'B016W1R0QM', 'White', '518244rHFWL.SL160.jpg', 'Norcho');
INSERT INTO item_item VALUES (4868, 'Chesapeake 2-Piece Pebbles 21-Inch by 34-Inch and 24-Inch by 40-Inch Bath Rug Set, Spa', 'A Plush Pebble Pattern Bath Rug to add the feel of relaxation to your bathroom.  Select from 4 beautiful color combinations to match your bathroom décor.  The 2 piece set Includes a 21"x34" and 24"x40"rug.  Spun of 100% Cotton. Machine Tufted with a lightly sprayed anti-skid back.', NULL, NULL, 18, 25, 14, '61E6wOT4tSL.jpg', 'chesapeake-2-piece-pebbles-21-inch-by-34-inch-and-24-inch-by-40-inch-bath-rug-set-spa', 'B0047T6C52', 'Spa color', '61E6wOT4tSL.SL160.jpg', 'Chesapeake Merchandising');
INSERT INTO item_item VALUES (4870, 'VDOMUS Absorbent Microfiber Bath Mat Soft Shaggy Bathroom Mats Shower Rugs - 2 Pieces (Gray)', '<p><b> Though simple perfect formed:</b><br> Front part material is microfiber, very soft, comfortable, absorbent<br> Mezzanine material is absorbent sponge<br> Bottom low is non-slip material<br></p> <p><b> Features:</b><br> 1. Easy to clean and dry fast: Made of microfiber which dries faster than cotton and easy to wash<br> 2. Soft skin-friendly: the big difference between it and other bathroom mat products on the market is that ours is more soft skin-friendly. <br></p> <p><b>? VDOMUS Guarantee:</b><br> If for any reason you are not happy with any product by <b>VDOMUS</b> please do not hesitate to contact us and we try our best to solve it once see your mails. No hassles. No headaches.<br></p> <p>We take full ownership and responsibility for the quality of our products.<br></p> Package: 2 piece*Non Slip Microfiber Bath Mat', NULL, NULL, 19, 24, 14, '61r5KAW5FEL.jpg', 'vdomus-absorbent-microfiber-bath-mat-soft-shaggy-bathroom-mats-shower-rugs-2-pieces-gray', 'B01F312KYO', 'Gray - 2 Pieces', '61r5KAW5FEL.SL160.jpg', 'VDOMUS');
INSERT INTO item_item VALUES (4873, 'Ikea Gray Supersoft Bath Shower Mat Rug Bathtub Bathroom Floor Badaren 16 x 24"', 'Super absorbent and soft for your feet.', NULL, NULL, 2, 10, 14, '51NgaOK6REL.jpg', 'ikea-gray-supersoft-bath-shower-mat-rug-bathtub-bathroom-floor-badaren-16-x-24', 'B00ZSDTEQK', 'red', '51NgaOK6REL.SL160.jpg', 'Badaren');
INSERT INTO item_item VALUES (4650, 'Nike Men''s Flex 2016 Rn Wolf Grey/White Black Running Shoe 9.5 Men US', 'Whether you''re training for your first race or are just getting back into a gym routine, the Nike Flex 2016 RN will help keep you on stride..', NULL, NULL, 13, 82, 3, '51s5XGaYtxL.jpg', 'nike-mens-flex-2016-rn-wolf-greywhite-black-running-shoe-95-men-us', 'B01H2OHXS8', 'Wolf Grey/White Black', '51s5XGaYtxL.SL160.jpg', 'Nike');
INSERT INTO item_item VALUES (4975, 'Tiered Copper Leaves Indoor Outdoor 41" High Fountain', 'The intricate arrangement of copper finish leaves in this outdoor/indoor fountain allows water to cascade down a series of tiers. The flow of the water creates a refreshing, serene atmosphere. The calming look and feel of this fountain can be used to enhance your indoor or outdoor spaces.<br>- 41" high x 13 1/2" wide x 10 1/2" deep.<br>- Tiered fountain; water flows from top, cascading down each leaf. <br>- Copper finish; cast resin construction makes this design very lightweight. <br>- Includes real river rocks in lower basin. <br>- Comes with water pump; easy set up. <br>- Can be used indoors or outside on a porch or patio.', NULL, NULL, 14, 149, 15, '419l7wYTMPL.jpg', 'tiered-copper-leaves-indoor-outdoor-41-high-fountain', 'B0044LRSX8', 'Brown', '419l7wYTMPL.SL160.jpg', 'John Timberland');
INSERT INTO item_item VALUES (4979, 'AGPTEK Indoor/Outdoor Garden 12 LED Aluminum Water Mist Maker Fogger Fountain Pond Fog Machine Atomizer Air Humidifier', 'This 12 LED mist maker can add a stunning mist effect to your pond or water tank to filter the bad smell with electro and ultrasonic technology. You can put it in your pond, rockery, fish tank, vase, birdbath, etc. Then it will create a magical atmosphere. <p> Material: aluminum<br> Aerosolized amount:=400mL/H<br> Disc: 1.5cm.<br> Output Voltage: 24V DC.<br> With a US AC/DC adapter.<br> Input: 110-250V, 50/60Hz<br> Output: DC 24V, 700mA<br> Cable Length: 210 cm (82 inch) (90cm attach to adapter, 120cm attach to mist maker), 3.5mm in diameter.</p> <p> <b>Package included:</b><br> 1 x Mist maker<br> 1 x AC-DC adapter (US plug) </p> <p> <b>Points for attention:</b><br> 1. Do not turn over the Mist Maker When the switch is turned on, keep upright, or it may damage the atomizer.<br> 2. Please ensure that the daily running time is less than 10 hours, otherwise the life of atomizing slice will be shorted.<br> 3. Don''t touch the atomizing slice while the Mist Maker is working.<br> 4. Ensure the water at high quality, use clean tap water. (Water quality deterioration may influence the lifetime).<br> 5. Please switch off the power before Movement or maintenance.<br> 6. The atomizing slice is consumable, and its service life is=3000 hours. If marked reduction of Mist present, please clean atomizing slice with a cotton swab (don''t need to use any detergent).Keep it clean.</p> <p> <b>Note:The product of the nozzles upper part, the water injection mouth more than 2-3 cm best, not less than nozzles, also cannot too higher than nozzles</b></p>', NULL, NULL, 11, 9, 15, '41WUML1BrXL.jpg', 'agptek-indooroutdoor-garden-12-led-aluminum-water-mist-maker-fogger-fountain-pond-fog-machine-atomizer-air-humidifier', 'B00PAJXZ30', 'Aluminum Fogger with LED Light', '41WUML1BrXL.SL160.jpg', 'AGPtEK');
INSERT INTO item_item VALUES (4981, 'Indoor-Outdoor 12" High LED Seated Buddha Water Fountain', 'A Buddha tabletop fountain is a great way to add a calming accent to your decor. This indoor/outdoor design features a graceful seated Buddha deep in meditation, holding an LED accent light in his lap. Polished stone finish resin construction is lightweight and easy to place inside or out. A convenient power cord is included; simply add water, plug in and enjoy!<br>- 12" high x 10 1/4" wide x 10 1/4" deep.<br>- Built-in array with 4 LEDs; comes with pump, 6-foot cord.<br>- Buddha Zen water fountain for indoor or outdoor use.<br>- Polished stone finish; lightweight resin construction.<br>- Tabletop fountain size is perfect for an office, kitchen space, or patio table.', NULL, NULL, 13, 34, 15, '51JSSI4P7BL.jpg', 'indoor-outdoor-12-high-led-seated-buddha-water-fountain', 'B0089WKB2I', 'Gray', '51JSSI4P7BL.SL160.jpg', 'John Timberland');
INSERT INTO item_item VALUES (4985, 'Begonia Flowers Small Cascading Indoor Tabletop Fountain', 'A small indoor tabletop fountain is a great way to add a calming accent to your decor. This design features metal begonia leaves and flowers that capture the peaceful water as it cascades into the dark finish bowl basin below. Flowers and leaves in copper finishes add a warm touch to this water feature. Easy to place with included power cord; simply add water, plug in and enjoy!<br>- 10 1/4" high x 8" wide x 10" deep.<br>- Includes adjustable water flow pump with 6-foot cord.<br>- Small cascading indoor begonia fountain.<br>- Copper finishes; resin and metal construction.<br>- Perfect for tabletop use in an office, hallway, or kitchen..', NULL, NULL, 9, 29, 15, '412BCY4WI0pL.jpg', 'begonia-flowers-small-cascading-indoor-tabletop-fountain', 'B008U8A9UU', 'Brown', '412BCY4WI0pL.SL160.jpg', 'John Timberland');
INSERT INTO item_item VALUES (4992, 'Pioneer Sewn Bonded Leather BookBound Bi-Directional Photo Album, Holds 300 4x6" Photos, 3 Per Page. Color: Black.', 'This sewn European bonded leather photo album features a deluxe raised rounded book style spine. It holds 300 photos up to 4"x6" in optically clear pockets with a shaded background and a memo writing area. Photos are displayed three per page. Album measures 14.125"x9.25"x2". Photo safe: Acid, lignin and PVC free.', NULL, NULL, 5, 17, 15, '41R2B2ySlHvL.jpg', 'pioneer-sewn-bonded-leather-bookbound-bi-directional-photo-album-holds-300-4x6-photos-3-per-page-color-black', 'B001AUA5XQ', 'Black', '41R2B2ySlHvL.SL160.jpg', 'Pioneer Photo Albums');
INSERT INTO item_item VALUES (4996, 'Fabric Frame Cover Photo Album 200 Pockets Hold 4x6 Photos, Apple Red', 'This fabric cover photo album features a frame to insert a favorite photo and a deluxe rounded bookbound spine.  The album''s patented Bi-Directional pockets hold horizontal or vertical photos up to 4 x 6 inches.  There is a memo writing area next to each pocket.  Photos are displayed two per page.  The album holds 200 photos up to 4 x 6 inches in optically clear pockets with a shaded paper background.  Archival, photo safe: acid, lignin and PVC free.', NULL, NULL, 2, 10, 15, '51FR1l2X5OL.jpg', 'fabric-frame-cover-photo-album-200-pockets-hold-4x6-photos-apple-red', 'B000B7C3E8', 'Apple Red', '51FR1l2X5OL.SL160.jpg', 'Pioneer Photo Albums');
INSERT INTO item_item VALUES (5001, 'Pioneer High Capacity Sewn Fabric and Leatherette Cover Photo Album, Black on Beige', 'This high capacity photo album holds 500 4-inch by 6-inch photos in optically clear plastic pockets with memo area. The album is bookstyle bound in beige fabric with black sewn leatherette trim. The unique five pocket page layout design allows for both horizontal and vertical prints to be displayed on the same page.', NULL, NULL, 5, 16, 15, '41YOc4G5sVL.jpg', 'pioneer-high-capacity-sewn-fabric-and-leatherette-cover-photo-album-black-on-beige', 'B002FXJ5T2', 'Beige with Leatherette Trim', '41YOc4G5sVL.SL160.jpg', 'Pioneer Photo Albums');
INSERT INTO item_item VALUES (5005, 'Pioneer Photo Storage Boxes, Holds Over 1,100 Photos Up To 4-6 Inches Photo Album-Sage Green', 'Store your photos and more with this heavy-duty Pioneer Photo Albums storage box. This durable box holds over 1,100 prints up to 4"x7" and is ideal for storing negatives, postcards, greeting cards, recipes, wedding keepsakes, baby memories, trading cards and collectibles just to name a few. The box features a metal identification plate and includes a set of index cards. Photo safe: acid free. The outside dimensions of the box are 11.25"L x 7.75"W x 4.5"H.', NULL, NULL, 3, 6, 15, '31NH1GyHKxL.jpg', 'pioneer-photo-storage-boxes-holds-over-1100-photos-up-to-4-6-inches-photo-album-sage-green', 'B003WSV7HM', 'Sage Green', '31NH1GyHKxL.SL160.jpg', 'Pioneer Photo Albums');
INSERT INTO item_item VALUES (4877, 'LOCHAS Soft Shaggy Bath Mat Bathroom Rug Anti-slip Floor Mats Absorbs Water, 30 x 18inch, White', '<br><br><b> We Believe, That is The Rug You Ever Dreamed About, LOCHAS Super Soft Area Rug Carpet, Shaggy Bathroom Rug Anti-slip Floor Mat, Modern Area Rug Beautiful Home Decoration Snow-white, Nice and Comfortable for Bedroom Balcony Bathroom and Living-room, 100% Machine Washable. </b> <br><br><br><b>Product Features:</b> <br> <br>✔ Comfort Collection <br>✔ Ultra Plush Microfiber <br>✔ Highly Absorbent <br>✔ Non-Skid Back <br>✔ Top: 100% Microfiber <br>✔ Base: 100% Environmental Thermoplastic Rubber <br><br><br><b>Care Instructions:</b> <br> <br>* Machine wash in cold water at gentle cycle <br>* Using mild detergent do not bleach <br>* Shake to restore separately <br>* Tumber dry no heat <br>* Made in China <br><br><br><b>About us: </b> <br><br>LOCHAS is a trade corporation focuses on Home & Kitchen products. <br>The name of LOCHAS, comes from Lifestyle Of Comfort Health And Sustainability. <br>The aim of LOCHAS is to make the life more COMFORTABLE, HEALTHY and SUSTAINABLE. <br>All the materials are NON-TOXIC, SAFE, ENVIRONMENTAL PROTECTION and REUSABLE. <br>LOCHAS pay attention on user experiences and cherish customers feedbacks. <br><b>Perfection is not attainable, but if chase it, we will achieve excellence.</b>', NULL, NULL, 9, 18, 14, '51qYttNrqHL.jpg', 'lochas-soft-shaggy-bath-mat-bathroom-rug-anti-slip-floor-mats-absorbs-water-30-x-18inch-white', 'B01GE8WKAO', 'Small White', '51qYttNrqHL.SL160.jpg', 'LOCHAS');
INSERT INTO item_item VALUES (4879, 'Luxury Cotton Hotel-Spa Tub-Shower Bath Mat Floor Mat - (2 Pack, Royal Blue, 21 Inch by 34 Inch) - Washable Bath Rug Set, Luxury Size, Maximum Absorbency, Machine Washable - by Utopia Towels', '<b>Get the most value for your money with our Top-Rated Bath Mats!</b> This 2-pack of 100% Cotton bath mats is a popular and economical choice when stocking your dorm room, home bathroom, or beauty care business. Each 21" x 34" inch bath mat is extra absorbent and practical for safe and effortless bathroom design. The cotton fabric base delivers optimal softness and long-lasting quality. 2-ply bath mats are professionally hemmed edges are double-stitched for product durability. Bath mats are very absorbent and will remain elegant after multiple wash and dry cycles. Use both mats for matching décor, or save one as a back-up. Available in several colors. <br> <br>• Ring spun Cotton provides optimal softness, cushioning, and absorbency. <br> <br>• Perfect for safe and hygienic bathroom design. <br> <br>• Matching value-size set for quick bathroom makeover. <br>', NULL, NULL, 9, 16, 14, '51XQMycRTL.jpg', 'luxury-cotton-hotel-spa-tub-shower-bath-mat-floor-mat-2-pack-royal-blue-21-inch-by-34-inch-washable-bath-rug-set-luxury-size-maximum-absorbency-machine-washable-by-utopia-towels', 'B00UCJGHGU', 'Royal Blue', '51XQMycRTL.SL160.jpg', 'Utopia Towels');
INSERT INTO item_item VALUES (4883, 'Super Soft Bath Mat Microfiber Shag Bathroom Rugs Non Slip Absorbent Fast Drying Bathroom Carpet Shower Rug by NTTR(Gray 20" x 32")', 'NTTR Chenille Bathroom Rug with Non-slip Backing.This Modern Bathroom Rug Features Thousands of Super Soft Microfiber Bristles that are Both Super Absorbent and Fast Drying. The Non-slip Backing will Keep the Rug in Place Even When Wet.Cleaning is Easy, Simply Toss the Entire Mat into the Washing Machine! <br> <br> ✔ Wide Versatility <br> ✔ Vivid Decoration <br> ✔ Against The Cold <br> ✔ Soft Anti-skid Hot-melt Adhesive <br> ✔ Super Water Absorbtion <br> ✔ 100% Machine Washable <br> <br> Material: microfiber and hot-melt adhesive <br> Size:20 x 32 Inches <br> <br> <b>Care Instructions</b> <br> Put the mat into the washing machine in cold water and hang to dry, after cleaning, it maintain a clean and tidy rug, don''t worry about drop wool very much.', NULL, NULL, 7, 15, 14, '515S0ACHnvL.jpg', 'super-soft-bath-mat-microfiber-shag-bathroom-rugs-non-slip-absorbent-fast-drying-bathroom-carpet-shower-rug-by-nttrgray-20-x-32', 'B01M0YSKHW', 'Gray', '515S0ACHnvL.SL160.jpg', 'NTTR');
INSERT INTO item_item VALUES (4887, 'Alurri Bath Mat - 2-Pack Bundle - 100% Pure Natural Cotton - Mold Resistant - Machine Washable, Quick Dry Anti Slip Shower / Bathtub Rug - Super Absorbent - Extra Wide 20" x 30" Inch - White', 'Indulge your senses with this luxurious cotton, non-skid 2-sided reversible bath rug set by Alurri.<br> Crafted with an ultra-soft, sheared surface in an array of unique bright colors to suit your bathroom''s design scheme.</p><b>Check out some of the features of the Alluri Bathroom Mat and see the reasons why resorts and hotel chains have chosen our bath mats.</p></b> • 100% Natural Organic Cotton.<br> • Free of chemicals and bacteria.<br> • 2-Sided Reversible.<br> • Soft texture.<br> • Non-rubber back.<br> • Thick and comfortable.<br> • Super absorbent.<br> • Machine Washable.<br> • Dimensions: 20" x 30" Inch.</p><b>Buy One Get 1 Free:</b><br> Buy Bundle and Save, when choosing to buy our quality bath mat, You''re getting a set of 2 mat rugs for the price of 1.</p><b>Durable Long Lasting Construction:</b><br> The Alurri bath mat provides professionally hemmed, double-stitched edges with woven in a concentric rectangle pattern, along with a thick, banded design for enhanced strength and attractive look.</p><b>Care Instructions:</b><br> Machine Washable. Do not bleach. Tumble dry warm. Do not dry Clean. For best results, wash separately on first use to minimize lint.</p><b>Prove it all to yourself by making the right choice today by clicking Add to cart on the top right corner on this page before it runs out of stock!</b>', NULL, NULL, 3, 13, 14, '31Xr8pKa4tL.jpg', 'alurri-bath-mat-2-pack-bundle-100-pure-natural-cotton-mold-resistant-machine-washable-quick-dry-anti-slip-shower-bathtub-rug-super-absorbent-extra-wide-20-x-30-inch-white', 'B01HYE12RE', 'White', '31Xr8pKa4tL.SL160.jpg', '');
INSERT INTO item_item VALUES (4892, 'Cotton Craft 2 Piece Reversible Step Out Bath Mat Rug Set 17x24 Charcoal, 100% Pure Cotton, Super Soft, Plush & Absorbent, Hand Tufted Heavy Weight Construction, Full Reversible, Rug Pad Recommended', 'Our Super Soft Spa like 100% Pure Cotton Bath rug is fully reversible. Its like getting two rugs for the price of one. Both sides of the rug feature a thick, plush and absorbent pile. Since it has no backing, a non-skid rug pad is highly recommended.', NULL, NULL, 3, 13, 14, '61iBSJi2BupL.jpg', 'cotton-craft-2-piece-reversible-step-out-bath-mat-rug-set-17x24-charcoal-100-pure-cotton-super-soft-plush-absorbent-hand-tufted-heavy-weight-construction-full-reversible-rug-pad-recommended', 'B00SO4NNWQ', 'Charcoal', '61iBSJi2BupL.SL160.jpg', 'Cotton Craft');
INSERT INTO item_item VALUES (5009, 'Pioneer Photo Albums Embroidered Live, Laugh, Love Black Sewn Leatherette Frame Cover Album for 4"x6" Prints', 'This black leatherette cover album features a frame front accented with an embroidered "Live, Laugh, Love" sentiment. The album holds 200 photos in optically clear pockets with black mesh backgrounds that include memo writing areas. Photos are displayed two per page. The album is book bound with a deluxe rounded spine and measures 8.75"x9.25"x2". Photo Safe: Acid, lignin, and PVC free.', NULL, NULL, 20, 13, 15, '51x8P92iTlL.jpg', 'pioneer-photo-albums-embroidered-live-laugh-love-black-sewn-leatherette-frame-cover-album-for-4x6-prints', 'B001CE5E4K', 'Black', '51x8P92iTlL.SL160.jpg', 'Pioneer');
INSERT INTO item_item VALUES (5013, 'Fabric Frame Cover Photo Album 300 Pockets Hold 4x6 Photos, Majestic Teal', 'This fabric cover photo album features a frame to insert a favorite photo and a deluxe rounded bookbound spine.  The album''s patented Bi-Directional pockets hold horizontal or vertical photos up to 4 x 6 inches.  There is a memo writing area next to each pocket.  Photos are displayed two per page.  The album holds 300 photos up to 4 x 6 inches in optically clear pockets with a shaded paper background.  Archival, photo safe: acid, lignin and PVC free.', NULL, NULL, 20, 15, 15, '41rPMeokXdL.jpg', 'fabric-frame-cover-photo-album-300-pockets-hold-4x6-photos-majestic-teal', 'B005CG8LP8', 'Majestic Teal', '41rPMeokXdL.SL160.jpg', 'Pioneer Photo Albums');
INSERT INTO item_item VALUES (5020, 'Pioneer Magnetic Page Photo Album, 10-Inch-by-11-1/2-Inch, 100 pages', 'PIONEER-Refillable chrome 3-ring binder measures 10"x11-1/2".   Includes 100 clear plastic overlay magnetic pages. Needs no glue on the corners. Contains no PVC.', NULL, NULL, 15, 12, 15, '61hQK2BGM2L.jpg', 'pioneer-magnetic-page-photo-album-10-inch-by-11-12-inch-100-pages', 'B001BEAPRC', 'Assorted', '61hQK2BGM2L.SL160.jpg', 'Pioneer');
INSERT INTO item_item VALUES (5023, 'CaiulBasic Album Crab [Fuji Instax Mini Photo Album] For Instax Mini 8 70 7s 25 50s 90 Film/Pringo 231 Film/Fujifilm Instax SP 1 Film/Polaroid PIC-300P Film/Polaroid Z2300 Film (TL-01,60 Photos)', 'The best of best CAIUL Instax Mini Book Album For Film, 60 Photos         ABOUT US        CAIUL-- Fujifilm instax film¡¯s best companionship     CAIUL Instax Mini Album-- Devote to the preservation of instax mini films.         Unique Design     Suit for films of Fujifilm instax mini 70 7s 8 50s 25 90, pringo P231, Fujifilm instax sp 1, Polaroid PIC-300P, Polaroid Z2300, LG PD 233   The album is bound in a cardboard cover, holds 60 film in total    Desk calendar book album, archival and protective. Can be put on the desk to show your best films.        Quality Assurance    All the CAIUL products are from highest possible quality guaranteed factory.   We ensure each of the Instax Mini Film album is made with the finest materials.   Every Instax Mini album is from the best workmanship.   The most rigorous manufacturing process gives you the superior possible quality assurance.        You Deserve It    This is a great instax mini album to use for storing precious photos, like graduation, traveling and parties    High quality assurance and lightweight, can be carried in your bag to show your best instant photos or send as a gift   Fashionable appearance, practical design and exquisite workmanship, lightweight and extremely durable        Package Included     1 x CAIUL Instax Mini Album[hold 60 photos]   Easy to use, cute appearance        Warranty        Each order includes a 12-MONTH worry-free guarantee.     NODARTISAN is the exclusive agent for original CAIUL packs and gear on Amazon', NULL, NULL, 6, 9, 15, '51af3xhRL.jpg', 'caiulbasic-album-crab-fuji-instax-mini-photo-album-for-instax-mini-8-70-7s-25-50s-90-filmpringo-231-filmfujifilm-instax-sp-1-filmpolaroid-pic-300p-filmpolaroid-z2300-film-tl-0160-photos', 'B00JL88TSC', 'brown cover', '51af3xhRL.SL160.jpg', 'CaiulBasic');
INSERT INTO item_item VALUES (5027, 'Pioneer Collage Frame Embossed "Family" Sewn Leatherette Cover 300 Pocket Photo Album, Black', 'This photo album holds 300 4-inch by 6-inch photos in optically clear plastic pockets. It features a collage frame front with embossed "Family" text. The album is bookstyle bound in a black sewn leatherette cover. Photos are displayed three per page.', NULL, NULL, 7, 20, 15, '51v6l4ZbNdL.jpg', 'pioneer-collage-frame-embossed-family-sewn-leatherette-cover-300-pocket-photo-album-black', 'B004O9SCPS', 'Black', '51v6l4ZbNdL.SL160.jpg', 'Pioneer Photo Albums');
INSERT INTO item_item VALUES (5032, 'Large Magnetic Page X-Pando Photo Album, Black', 'This deluxe padded leatherette cover photo album features gold tooling, rounded corners and a wrap around expandable library back spine.  It contains magnetic pages with a quality clear plastic overlay that self-adheres to the page, securely holding photos.  The album''s large 11.375 x 11.75 inch pages hold many size photos including 2.5 x 3.5 inches wallet, 4 x 6 inches, 5 x 7 inches, 6 x 8 inches, 8 x 10 inches enlargements and more.  It initially contains 20 pages (10 sheets).  The screw post binding expands to accept unlimited refills (Style No. PMV).  Photo safe: acid, lignin and PVC emission free.', NULL, NULL, 15, 18, 15, '41MUOMM1tXL.jpg', 'large-magnetic-page-x-pando-photo-album-black', 'B001VGE5NU', 'Black', '41MUOMM1tXL.SL160.jpg', 'Pioneer Photo Albums');
INSERT INTO item_item VALUES (5036, 'Pioneer Photo Albums 200-Pocket Chalkboard Printed "Happiness" Theme Photo Album for 4 by 6-Inch Prints', 'This book style photo album features a chalkboard printed cover. It holds 200 photos up to 4"x6" displaying two photos per page in optically clear pockets with shaded paper backgrounds. Each page includes a memo area next to each photo. The book measures 9.125"x8.625"x1.75". Photo Safe: Acid, Lignin and PVC free.', NULL, NULL, 10, 17, 15, '61vupty1JLL.jpg', 'pioneer-photo-albums-200-pocket-chalkboard-printed-happiness-theme-photo-album-for-4-by-6-inch-prints', 'B00LJWNOAG', '', '61vupty1JLL.SL160.jpg', 'Pioneer Photo Albums');
INSERT INTO item_item VALUES (5041, 'Pioneer High Capacity Sewn Fabric and Leatherette Cover Photo Album, Brown on Beige', 'This high capacity photo album holds 300 4-inch by 6-inch photos in optically clear plastic pockets with memo area. The album is bookstyle bound in beige fabric with brown sewn leatherette trim. Photos are displayed two per page.', NULL, NULL, 18, 17, 15, '41KP8Y2bTqL.jpg', 'pioneer-high-capacity-sewn-fabric-and-leatherette-cover-photo-album-brown-on-beige', 'B0036F1GIQ', 'multi', '41KP8Y2bTqL.SL160.jpg', 'Pioneer Photo Albums');
INSERT INTO item_item VALUES (5043, 'Kiera Grace Photo Album, Holds 100 4-Inch by 6-Inch Photos, Black', 'Fill this beautiful hard covered black photo album with all your favorite memories. This album will store up to 100 4-Inch by 6-Inch pictures and features a window on the front cover to showcase your favorite photo as well as a dust jacket to keep your memories safe. Perfect for sharing pictures when on the go or storing them when space is tight. Photos are stored in clear, photo safe, acid, and PVC free pockets. Make your memories last with this stunning album.', NULL, NULL, 17, 9, 15, '41hNcvdxeaL.jpg', 'kiera-grace-photo-album-holds-100-4-inch-by-6-inch-photos-black', 'B005HT0MIE', 'Black', '41hNcvdxeaL.SL160.jpg', 'Kiera Grace');
INSERT INTO item_item VALUES (5046, 'Fabric Frame Cover Photo Album 300 Pockets Hold 4x6 Photos, Sage Green', 'This fabric cover photo album features a frame to insert a favorite photo and a deluxe rounded bookbound spine.  The album''s patented Bi-Directional pockets hold horizontal or vertical photos up to 4 x 6 inches.  There is a memo writing area next to each pocket.  Photos are displayed two per page.  The album holds 300 photos up to 4 x 6 inches in optically clear pockets with a shaded paper background.  Archival, photo safe: acid, lignin and PVC free.', NULL, NULL, 5, 13, 15, '41rfq4evBML.jpg', 'fabric-frame-cover-photo-album-300-pockets-hold-4x6-photos-sage-green', 'B00260P2QE', 'Green', '41rfq4evBML.SL160.jpg', 'Pioneer Photo Albums');
INSERT INTO item_item VALUES (4897, 'VANRA Bath Mat Bath Rugs Anti-slip Bath Mats Anti-bacterial Non-slip Bathroom Mat Soft Bathmat Bathroom Carpet for Baby Kids Safety with Memory Foam Coral Velvet Fabric 15.7" X 23.6'''' (Gray)', '<p><b>Water Absorbent Memory Foam Bath Mats with Anti-Slip Bottom</b><br><br> - Fami bath mat is stylish for home deco and durable for years. The non-skid bottom is very easy to clean. Machine washable.<br> - Toilet Bathroom Mat is made of high density extra-thick microfiber space memory foam and soft coral velvet fabric. The material is more soft skin-friendly than many other bathroom mats on the market.<br> - Feel free to alleviate feet pressure when stepping on the mat. Get start with a new bathing experience with the non-slip bath rug!<br><br></p> <p><b>Specifications:</b><br> Front part material: 100% soft coral velvet fabric<br> Mezzanine material: absorbent sponge / slow rebound memory cotton<br> Bottom material: Anti-slip latex<br> Size: 23.6'''' (L) x 15.7'''' (W) including the edge (60cm x 40cm)<br> Thickness: 0.47 inches (1.20 cm)<br><br></p> <p><b>Package Includes</b><br> - 1 x Memory foam bath mat<br></p> <p><b>Warranty</b><br> Enjoy 12 months limited quality warranty.<br></p> <p><b>Click add to cart at the top of this page to buy this Soft Bath Mat</b></p> <p><b>Why Buy Bath Rug from VANRA Store</b><br><br> 1. VANRA Bath Rugs are made of soft coral velvet fabric and highly density memory foam, anti-bacterial, non-slip and ultra soft.<br> 2. VANRA provide 100% satisfaction of customer service.<br> 3. NOTE: Any Other Seller are NOT Legal Distributors of VANRA, please do not trust their products.<br></p>', NULL, NULL, 20, 9, 14, '51pCbWwitSL.jpg', 'vanra-bath-mat-bath-rugs-anti-slip-bath-mats-anti-bacterial-non-slip-bathroom-mat-soft-bathmat-bathroom-carpet-for-baby-kids-safety-with-memory-foam-coral-velvet-fabric-157-x-236-gray', 'B0105RZKZC', 'Gray', '51pCbWwitSL.SL160.jpg', 'VANRA');
INSERT INTO item_item VALUES (4902, 'Bath Mat Bathroom Rug Non-slip Soft Microfiber Shower Rugs 19x31 inch White for Bathroom Bedroom Living Room Kmat', '<b>Specification:</b><br><br> <b>Color:</b> white<br> <b>Material:</b> ultra plush microfibre, environmental rubber (with thousands of long floss and looks good texture)<br> <b>Dimension:</b> Approximately 80cm * 50cm(L*W),that is 2.6 x 1.6ft (LxW).. --little discrepancy allowed.<br> <b>Key Feature:</b> <br>√ ultra absorbent<br> √ fluffy and soft<br> √ non-slip base<br> √ non-shedding fluff<br>√ stain resistant pile<br> √ 100% machine washed<br> <br> <b>Multipurpose:</b><br><br> ★Bathmat is obviously suitable onto the bathroom threshold.Featured at non-slip base made of non-toxic rubber backed,<br> making you safe and stable.Plus, Fluffy microfiber soak your feet up rapidly after you take a shower out from the bathroom.<br> ★This rug is giant enough so you could put it flat onto your living room or bedroom, sitting on this mat to <br> play poker,play chess.Or that is a great idea you could drink a tea or coffee and talking with your beloved person <br> or your intimate friend sitting on it.<br> ★Do you have a cute dog / cat? This fluffy rug is soft to the touch,it would be a warm and cozy place for <br> them to have a sound sleep or take a rest in a cold winter.<br>★Not only a luxury & pretty & vivid home decoration but also a smart way to keep the dust away in the entry <br> way from your house.<br> <br> <b>Friendly Reminder:</b>This rug had better be washed before use to remove the smells as all the rugs are new from factory. <br> Once washed, it would also be fluffed up so much to make you more pleasant. <br> <br> <b>Package Includes:</b><br><br> 1 x Bathroom Rug<br>', NULL, NULL, 9, 29, 14, '51e06dbTklL.jpg', 'bath-mat-bathroom-rug-non-slip-soft-microfiber-shower-rugs-19x31-inch-white-for-bathroom-bedroom-living-room-kmat', 'B01M8IZQHB', 'White', '51e06dbTklL.SL160.jpg', 'K-Mat');
INSERT INTO item_item VALUES (4906, '3 Piece Bath Rug Set Pattern Bathroom Rug (20"x32")/large Contour Mat (20"x20") with Lid Cover (Navy)', 'Design of this bath set puts a natural spin on a traditional design. This set features a lovely patterned bath mat, Lid Cover and contour mat in 9 colors to choose from, creating a pretty yet modern addition for your bathroom decor. please note that now the contour mat is made little bit bigger, per customers request, to make it fit better. Buy with confidence.', NULL, NULL, 2, 25, 14, '41kxYHn3iL.jpg', '3-piece-bath-rug-set-pattern-bathroom-rug-20x32large-contour-mat-20x20-with-lid-cover-navy', 'B00KMZ1IJ0', 'Navy', '41kxYHn3iL.SL160.jpg', 'WPM');
INSERT INTO item_item VALUES (4911, 'Townhouse Rugs Luxurious 17-Inch by 24-Inch Memory Foam Bath Rug, Brown', 'This plush bath rug is made from microfiber and memory foam and features a non-skid back. Machine wash cold, tumble dry low or lay flat to dry. 1 inch in thickness. Has a polyurethane backing.', NULL, NULL, 19, 3, 14, '41l5uqcYkWL.jpg', 'townhouse-rugs-luxurious-17-inch-by-24-inch-memory-foam-bath-rug-brown', 'B007POUUOU', 'Brown', '41l5uqcYkWL.SL160.jpg', 'Townhouse Rugs');
INSERT INTO item_item VALUES (4926, 'Namaste Buddha 11 1/2" High Indoor Table Fountain', 'Add serenity to a space with this indoor tabletop fountain depicting a Buddha sitting amongst rocks. Perfect for meditating, this peaceful design comes with a light for easy illumination. Constructed of fiberglass, this tabletop fountain is lightweight and easy to move.<br>- 11 1/2" high x 8 1/4" deep x 7" wide x 6-feet of cord.<br>- Includes top light with one 4 watt bulb.<br>- Buddha tabletop Zen fountain.<br>- Faux stone finish; lightweight fiberglass construction.<br>- Pump is included; easy to set up.', NULL, NULL, 11, 29, 15, '41P22BbMpuL.jpg', 'namaste-buddha-11-12-high-indoor-table-fountain', 'B00DHG9U3M', 'Gray', '41P22BbMpuL.SL160.jpg', 'John Timberland');
INSERT INTO item_item VALUES (4928, 'Bits and Pieces - Indoor Water Lily Water Fountain-Small Size Makes This A Perfect Tabletop Decoration - Compact and Lightweight', 'Water Lily Serenity Fountain is an indoor tabletop water fountain. Its smaller size allows it to fit almost anywhere in your home. Compact and lightweight, the water lily fountain features copper-colored metal blooms and metal leaves that have a green patina. Water flows from flower to flower and down into the black plastic bowl. Looks great on an end table or in an entryway. Water Lily Serenity Fountain makes a great gift for the home. Includes an adjustable UL® approved recirculation pump with a 6'' cord. Add rocks (not included) to the bowl for a more natural look. Measures 8" diameter x 10" high. Indoor use only.', NULL, NULL, 13, 34, 15, '51khgn0JlpL.jpg', 'bits-and-pieces-indoor-water-lily-water-fountain-small-size-makes-this-a-perfect-tabletop-decoration-compact-and-lightweight', 'B00VRW4BZA', 'Black, Copper', '51khgn0JlpL.SL160.jpg', 'Bits and Pieces');
INSERT INTO item_item VALUES (4932, 'It''s Easy To Create An Indoor Fountain With This Compact, Reliable Pump', 'Make your own indoor dish garden, tabletop fountain or other small water feature using this reliable little pump. It raises a column of water up to 24 inches and pumps 70 GPH. Simple in construction and low in cost, it is fully submersible and requires no lubrication and almost no maintainence except for an occasional cleaning. Included with the pump is 2 feet of flexible tubing to attach to the outlet. The pump features a built-in flow control, a 4-1/2 foot, two prong cord and it only uses 6 watts of energy. It measures 2-1/8" long X 2" wide X 1-1/2" high and carries a 1 year manufacturers warranty. Suitable for use in small indoor designs as well as small aquariums, this sturdy pump will provide years of service. For hundreds more craft, art and hobby products including other fountain pumps for indoor or outdoor use please visit our Amazon Storefront. We have the creative component you need.', NULL, NULL, 4, 9, 15, '517e0Hx9lzL.jpg', 'its-easy-to-create-an-indoor-fountain-with-this-compact-reliable-pump', 'B005DOMRBI', '', '517e0Hx9lzL.SL160.jpg', 'United Pump Inc');
INSERT INTO item_item VALUES (4815, 'Ultrasonic Cool Mist Humidifier - Premium Humidifying Unit with Whisper-quiet Operation, Automatic Shut-off, and Night Light Function', 'Moisturize the dry air in your home or office in minutes with the Ultrasonic Cool Mist Humidifier from Pure Enrichment. This powerful and aesthetically pleasing tabletop humidifier is packed with smart features that make it the perfect solution for improving the air quality in any room. <br> <br> The humidifier''s 1.5-liter tank delivers a moisture output of 150 milliliters per hour making it the perfect solution to relieve the symptoms associated with dry air. On the low setting, you can expect up to 16 hours of continuous, safe operation. <br> <br> The Ultrasonic Cool Mist Humidifier is backed by Pure Enrichment''s industry-leading 2 Year Warranty so your satisfaction is guaranteed.', NULL, NULL, 19, 39, 13, '413CTyRMrL.jpg', 'ultrasonic-cool-mist-humidifier-premium-humidifying-unit-with-whisper-quiet-operation-automatic-shut-off-and-night-light-function', 'B013IJPTFK', 'BLUE', '413CTyRMrL.SL160.jpg', 'Pure Enrichment');
INSERT INTO item_item VALUES (5055, 'Fete Petite Sirah Wine, Wine Gift - Bring to a Party - Celebration Wine 750ml, Lodi CA - Red Wine', 'Please Note: the wine shipment cannot be left on your doorstep because it is wine and that is against state law. You must ship to an address where you can sign for the package and receive it. Your must be 21 years old or older and show proof of ID at delivery. Please leave detail notes for any special shipping delivery instructions.', NULL, NULL, 5, 14, 17, '31Attm1CiHL.jpg', 'fete-petite-sirah-wine-wine-gift-bring-to-a-party-celebration-wine-750ml-lodi-ca-red-wine', 'B01NA9PA0G', '', '31Attm1CiHL.SL160.jpg', 'Fete Today, Inc');
INSERT INTO item_item VALUES (4936, 'SereneLife Desktop Waterfall Fountain (3-Tier) | Cascading Tabletop Water Decoration | Indoor, Outdoor, Patio or Garden Use | 3 Candles and River Rocks Included.', 'Add charm and relaxing sophistication to your home or garden with a beautiful and elegant tabletop water foundation from SereneLife.      When it comes to letting the days’ stresses and anxieties fall behind, sometimes you need the gentle, relaxing sounds of water to help you ease a racing mind and tense body. That’s why we created the multifunctional <b>SereneLife Desktop Water Fountain</b>; a unique 3-tier water decoration that also features three sections for burning your favorite tea tree candle scents.  Easy to set up inside or outside the home, this unique tabletop decoration has a built-in, automatic pump that circulates water continuously. That means you can fall asleep to the dulcet, relaxing tones of water flowing down each step while breathing in  the smell of your favorite candles. Better yet, it’s perfectly sized to fit all those decorative areas inside your home!      Click ‘Add to Cart’ above to get a beautiful and decorative tabletop water fountain that helps you relax, unwind, and find inner peace', NULL, NULL, 6, 39, 15, '51fHW4OOlGL.jpg', 'serenelife-desktop-waterfall-fountain-3-tier-cascading-tabletop-water-decoration-indoor-outdoor-patio-or-garden-use-3-candles-and-river-rocks-included', 'B01LZJ0SZ1', 'brown', '51fHW4OOlGL.SL160.jpg', 'SereneLife');
INSERT INTO item_item VALUES (4086, 'New Balance Women''s WE543V1 Running Shoes, Dark Grey, 9 B US', 'Built on a cushioned platform combined with our enhanced Memory Sole Comfort insert, this sleek running shoe is designed to deliver  great style, lightweight fit and a plush underfoot feel.', NULL, NULL, 3, 26, 7, '41Nle5DQOML.jpg', 'new-balance-womens-we543v1-running-shoes-dark-grey-9-b-us', 'B01CQW1N9G', 'Dark Grey', '41Nle5DQOML.SL160.jpg', 'New Balance');
INSERT INTO item_item VALUES (5420, 'Merry Style Women Carnival Tights MS 332 60 DEN, Black, XL', 'Women''s tights with a pattern imitating sexy socks. Tights are made of microfiber, with the addition of Lycra® fibers. The original Lycra® fibers have a large stretching capacity (up to 600%) and is able to return to its original shape. Microfiber is also characterized by its unique flexibility. Moreover it is extremely durable and resistant to wrinkling. With these features they are perfectly presented on the legs and are extremely durable. Merry Style brand products guarantee style, quality, and comfort. Material of the highest quality go hand in hand with precise and solid workmanship and stylish designs. Colors displayed may vary slightly from depictions on the monitor due to screen differences. Material Composition: 85% Polyamide, 15% Elastane', NULL, NULL, 7, 9, 9, '31MCvYW3bmL.jpg', 'merry-style-women-carnival-tights-ms-332-60-den-black-xl', 'B019P2M4W0', 'Black', '31MCvYW3bmL.SL160.jpg', 'Merry Style');
INSERT INTO item_item VALUES (4549, 'Frontier Co-op Organic Hibiscus Flowers, Cut & Sifted, 1 Pound Bulk Bag', 'Hibiscus, also known as rose mallow, is a flowering plant belonging to the same family as cocoa and cotton. The flowers are popular as an herbal tea, especially in Caribbean and Latin American countries. Hibiscus flowers impart a cheery red color and tart flavor. Great as an herbal tea alone or combined with other herbs or fruit juice. Use hibiscus flowers in potpourris and decorative jars to add beautiful color and depth.', NULL, NULL, 17, 9, 13, '51hYjsYDQZL.jpg', 'frontier-co-op-organic-hibiscus-flowers-cut-sifted-1-pound-bulk-bag', 'B0012BSDNW', 'default', '51hYjsYDQZL.SL160.jpg', 'Frontier');
INSERT INTO item_item VALUES (4731, 'Levi''s Mens Men''s 505 Regular Dark Stonewash Jeans', 'The classic Levi''s® look that''s always in style. 505® jeans fit comfortably straight through the seat, thigh and leg. Straight-cut waistband sits at the waist. Sits evenly on both the front and back. Classic, five-pocket design. Branding-stamped rivet and shank button-detailing. "Levi''s®" or trademark-branded red tab at back pocket. Leather brand patch at back waist. Signature arcuate stitch at back pockets. Belt loop waistband. Zip fly and button closure. 100% cotton except on noted washes. Goldentop: 99% cotton, 1% elastane. Skunk Train: 99.13% cotton, 0.87% elastane. Big Root, Cash, Navarro: 98% cotton, 2% elastane. Green Leaf: 93% cotton, 6% polyester, 1% elastane. Machine wash cold, tumble dry low. Imported. Measurements: Waist Measurement: 32 in Outseam: 41 in Inseam: 32 in Front Rise: 11 in Back Rise: 14 in Leg Opening: 16 1⁄2 in Product measurements were taken using size 33, inseam 32. Please note that measurements may vary by size.', NULL, NULL, 20, 39, 6, '41mePbP26kL.jpg', 'levis-mens-mens-505-regular-dark-stonewash-jeans', 'B003YUY74S', 'Dark Stonewash', '41mePbP26kL.SL160.jpg', 'Levi''s');
INSERT INTO item_item VALUES (5059, 'Stella Rosa Moscato D`Asti, Il Conte D`Alba - Italian Sparkling Wine 90 Points', 'This is one of our best sellers during the Holidays. It has such a light touch to the palate with the faintest hint of bubbles that it just tickles the tongue. Always slightly sweet, made from Orange Muscat grapes, this wine dances on your tongue with green apples and apricot. What a delight to have for a pre-dinner or dessert wine during the Holiday Season..forget that, let`s have it year round! Sparkling wine is all the rage!', NULL, NULL, 19, 14, 17, '31B5ojOG6ML.jpg', 'stella-rosa-moscato-dasti-il-conte-dalba-italian-sparkling-wine-90-points', 'B00UNSLR92', '', '31B5ojOG6ML.SL160.jpg', 'Wine of the Month Club');
INSERT INTO item_item VALUES (5065, '2015 Chisholm Trail Ghost Rider Sweet Red Wine 750 ml', '', NULL, NULL, 12, 30, 17, '51y9SXW6QpL.jpg', '2015-chisholm-trail-ghost-rider-sweet-red-wine-750-ml', 'B00IIWTMX8', '', '51y9SXW6QpL.SL160.jpg', 'Chisholm Trail');
INSERT INTO item_item VALUES (5071, '2013 Miranda Lambert Red 55 Cabernet Sauvignon 750 mL Wine', 'In naming our wines, we wanted to select those that would reflect the spirit of the wine as well as the attributes of Miranda. Southern Belle came to mind. In defining the word Belle we found it to be the perfect fit for this sweet wine as well as for Miranda. Simply put, it means the most beautiful. With her true southern spirit, she epitomizes southern hospitality and beauty while being a just a little bit flirty', NULL, NULL, 14, 20, 17, '31esjrrTpvL.jpg', '2013-miranda-lambert-red-55-cabernet-sauvignon-750-ml-wine', 'B0184UH12W', '', '31esjrrTpvL.SL160.jpg', 'Miranda Lambert');
INSERT INTO item_item VALUES (5074, '2015 Quady Red Electra Moscato Muscat Blend Wine 750 mL', 'Wine Enthusiast Best Buy 2016. A fairly deep-red color, aromas like plums and roses, and flavors like sweet peaches and cherries combine for a delicious sweet wine. It''s light in alcohol, lightly effervescent and well balanced', NULL, NULL, 20, 14, 17, '41ZY1dtIB4L.jpg', '2015-quady-red-electra-moscato-muscat-blend-wine-750-ml', 'B01F7M2IWI', '', '41ZY1dtIB4L.SL160.jpg', 'Quady');
INSERT INTO item_item VALUES (5078, '2009 Westbrook Wine Farm Vineyard and Winery Fait Accompli 10th Anniversary Red Blend 750 mL', 'm and dry weather followed the previous year''s late April freeze gave this vintage a much greater concentration of flavor layers. Will cellar very well. At Westbrook Wine Farm, we literally "make" our wine in the vineyard. In our Fait Accompli Vineyard, we grow Cabernet Sauvignon, Cabernet Franc, Merlot, Malbec, Petit Verdot and Carmenère. We work all year to assure that all six varieties will mature at the same time, so they may be harvested together (not all grapes mature with the same sugar content). Conventional growers may tell you this cannot be done. With an open mind, however, and management efforts concentrated toward that end result, it most certainly can be done.', NULL, NULL, 11, 65, 17, '41lgqUIdYzL.jpg', '2009-westbrook-wine-farm-vineyard-and-winery-fait-accompli-10th-anniversary-red-blend-750-ml', 'B00BT1TW08', '', '41lgqUIdYzL.SL160.jpg', 'Westbrook Wine Farm');
INSERT INTO item_item VALUES (5081, 'Take a Day Off Sparkling Wine Gift Set with Chateau Diana Sparkling Moscato, 1 x 750mL', '', NULL, NULL, 17, 40, 17, '41VJ9xE9tBL.jpg', 'take-a-day-off-sparkling-wine-gift-set-with-chateau-diana-sparkling-moscato-1-x-750ml', 'B01N8QJI6K', '', '41VJ9xE9tBL.SL160.jpg', 'Chateau Diana Winery');
INSERT INTO item_item VALUES (5083, 'Oregon & Washington "Red Hot Trio" Wines Bundle Mixed Pack, 3 x 750 mL, by Naked Winery', '', NULL, NULL, 6, 61, 17, '51sW2YfNWKL.jpg', 'oregon-washington-red-hot-trio-wines-bundle-mixed-pack-3-x-750-ml-by-naked-winery', 'B00XZK3OWS', '', '51sW2YfNWKL.SL160.jpg', 'Naked Winery');
INSERT INTO item_item VALUES (5087, '2006 Dom Perignon, Champagne 750 mL Wine With Gift Box', '', NULL, NULL, 10, 195, 17, '41IbAEQao2BL.jpg', '2006-dom-perignon-champagne-750-ml-wine-with-gift-box', 'B01CTHEZWA', '', '41IbAEQao2BL.SL160.jpg', 'Dom Perignon');
INSERT INTO item_item VALUES (5091, 'ONEHOPE Red Wine Gift Set, Includes California Cabernet Sauvignon 750 mL Wine, Paprika Almonds, Fig Spread, Digging Spice, Salami, Garden Vegetable Cheese', 'Help children with autism. Every bottle helps fund behavioral therapy for a child with autism through ACT Today!', NULL, NULL, 12, 79, 17, '51DLMRK6zxL.jpg', 'onehope-red-wine-gift-set-includes-california-cabernet-sauvignon-750-ml-wine-paprika-almonds-fig-spread-digging-spice-salami-garden-vegetable-cheese', 'B0193R6NIS', '', '51DLMRK6zxL.SL160.jpg', 'ONEHOPE');
INSERT INTO item_item VALUES (5095, 'Castoro Cellars Central Coast White Wines Mixed Pack, 3 x 750 mL', 'There''s nothing like a White Christmas, but here on the Central Coast we rarely get snow. So, we drink win instead! This 3 pack has the perfect wine spectrum ranging from a crisp, stainless-steal Sauvignon Blanc to a floral and fruity Viognier to the light, smooth and creamy Chardonnay.', NULL, NULL, 1, 44, 17, '51RtXep44lL.jpg', 'castoro-cellars-central-coast-white-wines-mixed-pack-3-x-750-ml', 'B00FPNV9JI', '', '51RtXep44lL.SL160.jpg', 'Castoro Cellars');
INSERT INTO item_item VALUES (5100, '2015 Fete Symphony Wine, Wine Gift - Celebration Wine - Best Party Wine - Produced in Lodi, CA 750 ml - White Wine', 'Please Note: the wine shipment cannot be left on your doorstep because it is wine and that is against state law. You must ship to an address where you can sign for the package and receive it. Your must be 21 years old or older and show proof of ID at delivery. Please leave detail notes for any special shipping delivery instructions.', NULL, NULL, 3, 50, 17, '41PXyAkw4CL.jpg', '2015-fete-symphony-wine-wine-gift-celebration-wine-best-party-wine-produced-in-lodi-ca-750-ml-white-wine', 'B01N1R49DL', '', '41PXyAkw4CL.SL160.jpg', 'Fete Today');
INSERT INTO item_item VALUES (5105, 'Key Limen - Key Lime Wine', 'Our best seller! Best of Show Gold Medal - Florida State Fair. Double Gold - Indiana International Wine Competition. Epcot International Food and Wine Festival Selection 2001, 2010, 2011.', NULL, NULL, 12, 22, 17, '616d2qJrVHL.jpg', 'key-limen-key-lime-wine', 'B00G9CJELE', '', '616d2qJrVHL.SL160.jpg', 'Key Limen');
INSERT INTO item_item VALUES (5107, '2016 CMS White Columbia Valley Sauvignon Blanc 750 ml Wine', '', NULL, NULL, 12, 18, 17, '51odXHedKkL.jpg', '2016-cms-white-columbia-valley-sauvignon-blanc-750-ml-wine', 'B00VQRVDSE', '', '51odXHedKkL.SL160.jpg', 'CMS');
INSERT INTO item_item VALUES (5116, 'Guardians of the Galaxy Deluxe Vinyl Edition', 'Collector''s Edition 2 disc GUARDIANS OF THE GALAXY vinyl includes AWESOME MIX VOL. 1, the collection of songs featured in the film. Music plays a major role in GUARDIANS OF THE GALAXY as the 1970s songs featured in the film are part of the storyline in a unique way. Explaining how the songs come to play in the story, director James Gunn says, ''One of the main story points in the movie is that Quill has this compilation tape (Awesome Mix #1) that he got from his mother before she died that she made for him. It was of songs that she loved, all songs from the 1970s, and that''s the only thing he has left of his mother and that''s the only thing he has left of his home on Earth. He uses that as a connection to his past and to the sadness that he feels of having left all that and lost all that.'' As well as, the complete official original score from the film as composed by Tyler Bates.<br><br>From Marvel, the studio that brought you the global blockbuster franchises of Iron Man, Thor, Captain America and The Avengers, comes a new team the GUARDIANS OF THE GALAXY. An action-packed, epic space adventure, Marvel''s GUARDIANS OF THE GALAXY expands the Marvel Cinematic Universe into the cosmos, where brash adventurer Peter Quill finds himself the object of an unrelenting bounty hunt after stealing a mysterious orb coveted by Ronan, a powerful villain with ambitions that threaten the entire universe. To evade the ever-persistent Ronan, Quill is forced into an uneasy truce with a quartet of disparate misfits Rocket, a gun-toting raccoon, Groot, a tree-like humanoid, the deadly and enigmatic Gamora and the revenge-driven Drax the Destroyer. But when Quill discovers the true power of the orb and the menace it poses to the cosmos, he must do his best to rally his ragtag rivals for a last, desperate stand with the galaxy''s fate in the balance.<br><br>Marvel''s GUARDIANS OF THE GALAXY, which first appeared in comic books in Marvel Super-Heroes, Issue #18 (Jan. 1969), stars Chris Pratt, Zoe Saldana, Dave Bautista, featuring Vin Diesel as Groot, Bradley Cooper as Rocket, Lee Pace, Michael Rooker, Karen Gillan, Djimon Hounsou, with John C. Reilly, Glenn Close as Nova Prime and Benicio Del Toro as The Collector. James Gunn is the director of the film with Kevin Feige, p.g.a., producing. Louis D''Esposito, Alan Fine, Victoria Alonso, Jeremy Latcham, Nik Korda and Stan Lee serve as executive producers. Marvel''s GUARDIANS OF THE GALAXY is written by James Gunn and Nicole Perlman.', NULL, NULL, 9, 13, 18, '61K22IhqPqL.jpg', 'guardians-of-the-galaxy-deluxe-vinyl-edition', 'B00LICGSFU', '', '61K22IhqPqL.SL160.jpg', 'VINYL');
INSERT INTO item_item VALUES (5121, 'Kind Of Blue (Vinyl)', 'Regarded by many critics as the greatest jazz album of all time and Davis''s masterpiece. This 1959 album''s influence on music, including jazz, rock and classical, has led music writers to acknowledge it as one of the most influential albums of all time. This septet features Jazz heavyweights John Coltrane, Bill Evans and Cannonball Adderley. Newly remastered and pressed on 180g vinyl.', NULL, NULL, 14, 20, 18, '51UypUNvN5L.jpg', 'kind-of-blue-vinyl', 'B0041TM5OU', '', '51UypUNvN5L.SL160.jpg', 'Sony');
INSERT INTO item_item VALUES (5125, 'Led Zeppelin IV (Remastered Original Vinyl)', 'In 1968, John Bonham, John Paul Jones, Jimmy Page and Robert Plant formed Led Zeppelin, one of the most influential, innovative and successful groups in modern music, having sold more than 300 million albums worldwide. The band rose from the ashes of The Yardbirds, when Page brought in Plant, Bonham and Jones to tour as The New Yardbirds. In 1969, Led Zeppelin released its self-titled debut. It marked the beginning of a 12-year reign, during which the group was widely considered to be the biggest and most innovative rock band in the world.   The Led Zeppelin reissue campaign got off to an remarkable start in June 2014 as deluxe editions of <i>Led Zeppelin</i>, <i>Led Zeppelin II</i>, and <i>Led Zeppelin III</i> debuted in the top 10 of the Billboard Top 200 Albums chart. The albums achieved similar international success with debuts near the top of the charts in more than a dozen territories, including Canada, France, Germany, Japan, and the United Kingdom.   For the second round, the band prepared the reissues of <i>Led Zeppelin IV</i> (the third best-selling album in U.S. history) and <i>Houses Of The Holy</i>. As with the previous deluxe editions, both albums have been newly remastered by guitarist and producer Jimmy Page and are accompanied by a second disc of companion audio comprised entirely of unreleased music related to that album.  The second round of reissues begins with one of the most artistically influential and commercially successful albums in the history of music, <i>Led Zeppelin IV</i>. Released in November 1971, the album—which is officially untitled—defined the sound of rock music for a generation with ubiquitous anthems such as "Stairway To Heaven, " "Rock And Roll, " "Black Dog, " and "When The Levee Breaks. " The album was inducted into the Grammy Hall of Fame in 1999, has been certified 23x platinum by the RIAA.  The <i>Led Zeppelin IV</i> deluxe editions include unreleased versions of every song heard on the original album including alternate mixes of "Misty Mountain Hop" and "Four Sticks, " mixes of "The Battle Of Evermore" and "Going To California" heavy with guitar and mandolin, and the fabled, alternate version "Stairway To Heaven, " mixed at the Sunset Sound Studio in Los Angeles which lets fans hear one of the most revered songs of all time as they have never heard it before.   Led Zeppelin continues to be honored for its pivotal role in music history. The band was inducted into the Rock & Roll Hall of Fame in 1995, received a Grammy Lifetime Achievement Award in 2005, and a year later was awarded with the Polar Music Prize in Stockholm. Founding members Jones, Page and Plant – along with Jason Bonham, the son of John Bonham – took the stage at London’s O2 Arena in 2007 to headline a tribute concert for Ahmet Ertegun, a dear friend and Atlantic Records’ founder. The band was honored for its lifetime contribution to American culture at the Kennedy Center Honors in 2012. In January of 2014, the band won their first ever Grammy award as <i>Celebration Day</i>, which captured their live performance at the Ertegun tribute concert, was named Best Rock Album.', NULL, NULL, 4, 20, 18, '6136bXOwo4L.jpg', 'led-zeppelin-iv-remastered-original-vinyl', 'B00M30T9F2', '', '6136bXOwo4L.SL160.jpg', 'LED ZEPPELIN');
INSERT INTO item_item VALUES (5812, 'Signature by Levi Strauss & Co Men''s Relaxed Jean, Marine, 32x32', 'Signature by Levi Strauss & co. Relaxed fit jeans offer classic, laid back style with room to move. Crafted from premium quality, durable denim, these relaxed fit jeans offers a relaxed fit through the seat to thigh and are cut straight from knee to ankle. Quality you trust from Levi Strauss & co, est. 1853.', NULL, NULL, 2, 19, 6, '41U5vZwFHcL.jpg', 'signature-by-levi-strauss-co-mens-relaxed-jean-marine-32x32', 'B01H7ENV2U', 'Marine', '41U5vZwFHcL.SL160.jpg', 'Signature by Levi Strauss & Co');
INSERT INTO item_item VALUES (5542, 'Calvin Klein Performance Women''s Woven Rollover Waist Cargo Short, Black, X-Large', 'Calvin Klein Performance creates active clothing for women that can be worn to the gym or for casual everyday wear. A special focus for Calvin Klein Performance is capturing fun, fashion trends and using easy-to-care fabrics to keep you looking stylish and comfortable for your workouts and all your casual activities. Calvin Klein Performance makes something for every woman, no matter what your size or lifestyle demands.', NULL, NULL, 2, 24, 10, '41OxiS1BSL.jpg', 'calvin-klein-performance-womens-woven-rollover-waist-cargo-short-black-x-large', 'B01BVAFTLW', 'Black', '41OxiS1BSL.SL160.jpg', 'Calvin Klein');


--
-- Name: item_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('item_item_id_seq', 6301, true);


--
-- Data for Name: newsletters_newsletter; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO newsletters_newsletter VALUES (6, 'andrewnyash@gmail.com');
INSERT INTO newsletters_newsletter VALUES (7, 'a@andrey.com');
INSERT INTO newsletters_newsletter VALUES (8, 'andrey@email.com');
INSERT INTO newsletters_newsletter VALUES (9, 'a@a.com123123');
INSERT INTO newsletters_newsletter VALUES (10, 'anton@email.cok');
INSERT INTO newsletters_newsletter VALUES (11, 'dashka@coder.ru');
INSERT INTO newsletters_newsletter VALUES (12, 'a@a.com');
INSERT INTO newsletters_newsletter VALUES (13, 'a@asfafaf.com');
INSERT INTO newsletters_newsletter VALUES (14, 'vk.com@vk.com');
INSERT INTO newsletters_newsletter VALUES (15, 'andrewnyash@gmail.com23');
INSERT INTO newsletters_newsletter VALUES (16, 'a@a.com23');
INSERT INTO newsletters_newsletter VALUES (17, 'andrey@email.com23');
INSERT INTO newsletters_newsletter VALUES (18, 'asdaaf@a.com');
INSERT INTO newsletters_newsletter VALUES (19, 'asdaaf@a.com132');
INSERT INTO newsletters_newsletter VALUES (20, 'asdaaf@a.com123');
INSERT INTO newsletters_newsletter VALUES (21, 'test.com@a.com');
INSERT INTO newsletters_newsletter VALUES (22, '123@a.com');


--
-- Name: newsletters_newsletter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('newsletters_newsletter_id_seq', 22, true);


--
-- Data for Name: order_userorder; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO order_userorder VALUES (10, 'Pending', 1972, NULL, 3, 1, NULL, 'Minsk', 'BY', 'Sukharevskaya 1-269', '220019', 'Andrey', 'andrewnyash@gmail.com');
INSERT INTO order_userorder VALUES (11, 'Pending', 1897, NULL, 2, 1, 1, 'Minsk', 'BY', 'Sukharevskaya 1-269', '220019', 'Andrey', 'karava3v@gmail.com');
INSERT INTO order_userorder VALUES (12, 'Pending', 26, NULL, 2, 2, 1, 'Minsk', 'BY', 'Sukharevskaya 1-269', '220019', 'Andrey', 'karava3v@gmail.com');
INSERT INTO order_userorder VALUES (13, 'Pending', 9, NULL, 2, 1, 1, 'Minsk', 'BY', 'Sukharevskaya 1-269', '220019', 'Andrey', 'karava3v@gmail.com');


--
-- Name: order_userorder_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('order_userorder_id_seq', 13, true);


--
-- Data for Name: payment_payment; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO payment_payment VALUES (2, 'Cash');
INSERT INTO payment_payment VALUES (1, 'Credit card');


--
-- Name: payment_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('payment_payment_id_seq', 2, true);


--
-- Data for Name: profiles_profile; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO profiles_profile VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 2, NULL, NULL, NULL);
INSERT INTO profiles_profile VALUES (5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 4, NULL, NULL, NULL);
INSERT INTO profiles_profile VALUES (6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 5, NULL, NULL, NULL);
INSERT INTO profiles_profile VALUES (7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 6, NULL, NULL, NULL);
INSERT INTO profiles_profile VALUES (8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 7, NULL, NULL, NULL);
INSERT INTO profiles_profile VALUES (9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 8, NULL, NULL, NULL);
INSERT INTO profiles_profile VALUES (10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 9, NULL, NULL, NULL);
INSERT INTO profiles_profile VALUES (11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 10, NULL, NULL, NULL);
INSERT INTO profiles_profile VALUES (2, 'Andrey', '', 'Minsk', 'Sukharevskaya 1-269', NULL, 'AD', '220019', 0, 'M', NULL, 1, 'Individual', 'andrewnyash@gmail.com', NULL);


--
-- Name: profiles_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('profiles_profile_id_seq', 11, true);


--
-- Name: user_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('user_user_id_seq', 5, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: cart_cartorder cart_cartorder_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY cart_cartorder
    ADD CONSTRAINT cart_cartorder_pkey PRIMARY KEY (id);


--
-- Name: category_category category_category_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY category_category
    ADD CONSTRAINT category_category_pkey PRIMARY KEY (id);


--
-- Name: contact_contact contact_contact_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY contact_contact
    ADD CONSTRAINT contact_contact_pkey PRIMARY KEY (id);


--
-- Name: delivery_delivery delivery_delivery_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY delivery_delivery
    ADD CONSTRAINT delivery_delivery_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: item_item item_item_amazon_id_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY item_item
    ADD CONSTRAINT item_item_amazon_id_key UNIQUE (amazon_id);


--
-- Name: item_item item_item_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY item_item
    ADD CONSTRAINT item_item_pkey PRIMARY KEY (id);


--
-- Name: item_item item_item_slug_ebb07c74_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY item_item
    ADD CONSTRAINT item_item_slug_ebb07c74_uniq UNIQUE (slug);


--
-- Name: newsletters_newsletter newsletters_newsletter_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY newsletters_newsletter
    ADD CONSTRAINT newsletters_newsletter_pkey PRIMARY KEY (id);


--
-- Name: order_userorder order_userorder_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY order_userorder
    ADD CONSTRAINT order_userorder_pkey PRIMARY KEY (id);


--
-- Name: payment_payment payment_payment_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY payment_payment
    ADD CONSTRAINT payment_payment_pkey PRIMARY KEY (id);


--
-- Name: profiles_profile profiles_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY profiles_profile
    ADD CONSTRAINT profiles_profile_pkey PRIMARY KEY (id);


--
-- Name: profiles_profile profiles_profile_user_id_a3e81f91_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY profiles_profile
    ADD CONSTRAINT profiles_profile_user_id_a3e81f91_uniq UNIQUE (user_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: cart_cartorder_3834d646; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX cart_cartorder_3834d646 ON cart_cartorder USING btree (item_id_id);


--
-- Name: category_category_2263e5df; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX category_category_2263e5df ON category_category USING btree (parent_category_id);


--
-- Name: category_category_slug_4f83d5f6_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX category_category_slug_4f83d5f6_like ON category_category USING btree (slug varchar_pattern_ops);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: item_item_2d5f8f90; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX item_item_2d5f8f90 ON item_item USING btree (category_id_id);


--
-- Name: item_item_amazon_id_5f1fff37_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX item_item_amazon_id_5f1fff37_like ON item_item USING btree (amazon_id varchar_pattern_ops);


--
-- Name: item_item_slug_ebb07c74_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX item_item_slug_ebb07c74_like ON item_item USING btree (slug varchar_pattern_ops);


--
-- Name: order_userorder_18624dd3; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX order_userorder_18624dd3 ON order_userorder USING btree (user_id_id);


--
-- Name: order_userorder_1e46f767; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX order_userorder_1e46f767 ON order_userorder USING btree (payment_id_id);


--
-- Name: order_userorder_235c7ab9; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX order_userorder_235c7ab9 ON order_userorder USING btree (delivery_id_id);


--
-- Name: profiles_profile_e8701ad4; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX profiles_profile_e8701ad4 ON profiles_profile USING btree (user_id);


--
-- Name: auth_group_permissions auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cart_cartorder cart_cartorder_item_id_id_4c169ea0_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY cart_cartorder
    ADD CONSTRAINT cart_cartorder_item_id_id_4c169ea0_fk FOREIGN KEY (item_id_id) REFERENCES item_item(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: category_category category_ca_parent_category_id_15ef278a_fk_category_category_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY category_category
    ADD CONSTRAINT category_ca_parent_category_id_15ef278a_fk_category_category_id FOREIGN KEY (parent_category_id) REFERENCES category_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_content_type_id_c4bce8eb_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_content_type_id_c4bce8eb_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: item_item item_item_category_id_id_d98f1b50_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY item_item
    ADD CONSTRAINT item_item_category_id_id_d98f1b50_fk FOREIGN KEY (category_id_id) REFERENCES category_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_userorder order_userorder_delivery_id_id_e225123f_fk_delivery_delivery_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY order_userorder
    ADD CONSTRAINT order_userorder_delivery_id_id_e225123f_fk_delivery_delivery_id FOREIGN KEY (delivery_id_id) REFERENCES delivery_delivery(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_userorder order_userorder_payment_id_id_9f01735a_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY order_userorder
    ADD CONSTRAINT order_userorder_payment_id_id_9f01735a_fk FOREIGN KEY (payment_id_id) REFERENCES payment_payment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_userorder order_userorder_user_id_id_1be064ba_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY order_userorder
    ADD CONSTRAINT order_userorder_user_id_id_1be064ba_fk_auth_user_id FOREIGN KEY (user_id_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: profiles_profile profiles_profile_user_id_a3e81f91_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY profiles_profile
    ADD CONSTRAINT profiles_profile_user_id_a3e81f91_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

