--
-- PostgreSQL database dump
--

create database dungcony
 db
\restrict 8k2FNQYmPxs8IRgxQUwMpyKrW6Vbc22VcESW7u85NNtXqsIrsgpr2WfNQTzVCib

-- Dumped from database version 17.6
-- Dumped by pg_dump version 18.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE IF EXISTS ONLY public.tbl_user_vouchers
    DROP CONSTRAINT IF EXISTS fk_uv_voucher;
ALTER TABLE IF EXISTS ONLY public.tbl_recivers
    DROP CONSTRAINT IF EXISTS fk_receiver_user;
ALTER TABLE IF EXISTS ONLY public.tbl_products
    DROP CONSTRAINT IF EXISTS fk_product_provider;
ALTER TABLE IF EXISTS ONLY public.tbl_products
    DROP CONSTRAINT IF EXISTS fk_product_category;
ALTER TABLE IF EXISTS ONLY public.tbl_promotion_product
    DROP CONSTRAINT IF EXISTS fk_pp_promotion;
ALTER TABLE IF EXISTS ONLY public.tbl_promotion_category
    DROP CONSTRAINT IF EXISTS fk_pc_promotion;
ALTER TABLE IF EXISTS ONLY public.tbl_order_items
    DROP CONSTRAINT IF EXISTS fk_oi_order;
ALTER TABLE IF EXISTS ONLY public.tbl_items
    DROP CONSTRAINT IF EXISTS fk_item_size;
ALTER TABLE IF EXISTS ONLY public.tbl_items
    DROP CONSTRAINT IF EXISTS fk_item_product;
ALTER TABLE IF EXISTS ONLY public.tbl_comments
    DROP CONSTRAINT IF EXISTS fk_comment_product;
ALTER TABLE IF EXISTS ONLY public.tbl_categories
    DROP CONSTRAINT IF EXISTS fk_category_parent;
ALTER TABLE IF EXISTS ONLY public.tbl_cart_items
    DROP CONSTRAINT IF EXISTS fk_cart_user;
ALTER TABLE IF EXISTS ONLY public.tbl_cart_items
    DROP CONSTRAINT IF EXISTS fk_cart_size;
ALTER TABLE IF EXISTS ONLY public.tbl_cart_items
    DROP CONSTRAINT IF EXISTS fk_cart_product;
ALTER TABLE IF EXISTS ONLY public.tbl_accounts
    DROP CONSTRAINT IF EXISTS ukoshwg9cg1y475p5ppsip091ed;
ALTER TABLE IF EXISTS ONLY public.tbl_user_vouchers
    DROP CONSTRAINT IF EXISTS uk_user_voucher;
ALTER TABLE IF EXISTS ONLY public.tbl_vouchers
    DROP CONSTRAINT IF EXISTS tbl_vouchers_pkey;
ALTER TABLE IF EXISTS ONLY public.tbl_vouchers
    DROP CONSTRAINT IF EXISTS tbl_vouchers_code_key;
ALTER TABLE IF EXISTS ONLY public.tbl_users
    DROP CONSTRAINT IF EXISTS tbl_users_pkey;
ALTER TABLE IF EXISTS ONLY public.tbl_user_vouchers
    DROP CONSTRAINT IF EXISTS tbl_user_vouchers_pkey;
ALTER TABLE IF EXISTS ONLY public.tbl_sizes
    DROP CONSTRAINT IF EXISTS tbl_sizes_pkey;
ALTER TABLE IF EXISTS ONLY public.tbl_recivers
    DROP CONSTRAINT IF EXISTS tbl_recivers_pkey;
ALTER TABLE IF EXISTS ONLY public.tbl_providers
    DROP CONSTRAINT IF EXISTS tbl_providers_pkey;
ALTER TABLE IF EXISTS ONLY public.tbl_promotions
    DROP CONSTRAINT IF EXISTS tbl_promotions_pkey;
ALTER TABLE IF EXISTS ONLY public.tbl_promotion_product
    DROP CONSTRAINT IF EXISTS tbl_promotion_product_pkey;
ALTER TABLE IF EXISTS ONLY public.tbl_promotion_category
    DROP CONSTRAINT IF EXISTS tbl_promotion_category_pkey;
ALTER TABLE IF EXISTS ONLY public.tbl_products
    DROP CONSTRAINT IF EXISTS tbl_products_pkey;
ALTER TABLE IF EXISTS ONLY public.tbl_orders
    DROP CONSTRAINT IF EXISTS tbl_orders_pkey;
ALTER TABLE IF EXISTS ONLY public.tbl_orders
    DROP CONSTRAINT IF EXISTS tbl_orders_code_key;
ALTER TABLE IF EXISTS ONLY public.tbl_order_items
    DROP CONSTRAINT IF EXISTS tbl_order_items_pkey;
ALTER TABLE IF EXISTS ONLY public.tbl_notifications
    DROP CONSTRAINT IF EXISTS tbl_notifications_pkey;
ALTER TABLE IF EXISTS ONLY public.tbl_notifications
    DROP CONSTRAINT IF EXISTS tbl_notifications_code_key;
ALTER TABLE IF EXISTS ONLY public.tbl_items
    DROP CONSTRAINT IF EXISTS tbl_items_pkey;
ALTER TABLE IF EXISTS ONLY public.tbl_comments
    DROP CONSTRAINT IF EXISTS tbl_comments_pkey;
ALTER TABLE IF EXISTS ONLY public.tbl_categories
    DROP CONSTRAINT IF EXISTS tbl_categories_pkey;
ALTER TABLE IF EXISTS ONLY public.tbl_cart_items
    DROP CONSTRAINT IF EXISTS tbl_cart_items_pkey;
ALTER TABLE IF EXISTS ONLY public.tbl_accounts
    DROP CONSTRAINT IF EXISTS tbl_accounts_username_key;
ALTER TABLE IF EXISTS ONLY public.tbl_accounts
    DROP CONSTRAINT IF EXISTS tbl_accounts_pkey;
ALTER TABLE IF EXISTS ONLY public.tbl_accounts
    DROP CONSTRAINT IF EXISTS tbl_accounts_email_key;
ALTER TABLE IF EXISTS public.tbl_vouchers
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.tbl_sizes
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.tbl_recivers
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.tbl_providers
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.tbl_promotions
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.tbl_products
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.tbl_orders
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.tbl_notifications
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.tbl_categories
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.tbl_accounts
    ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE IF EXISTS public.tbl_vouchers_id_seq;
DROP TABLE IF EXISTS public.tbl_vouchers;
DROP TABLE IF EXISTS public.tbl_users;
DROP TABLE IF EXISTS public.tbl_user_vouchers;
DROP SEQUENCE IF EXISTS public.tbl_sizes_id_seq;
DROP TABLE IF EXISTS public.tbl_sizes;
DROP SEQUENCE IF EXISTS public.tbl_recivers_id_seq;
DROP TABLE IF EXISTS public.tbl_recivers;
DROP SEQUENCE IF EXISTS public.tbl_providers_id_seq;
DROP TABLE IF EXISTS public.tbl_providers;
DROP SEQUENCE IF EXISTS public.tbl_promotions_id_seq;
DROP TABLE IF EXISTS public.tbl_promotions;
DROP TABLE IF EXISTS public.tbl_promotion_product;
DROP TABLE IF EXISTS public.tbl_promotion_category;
DROP SEQUENCE IF EXISTS public.tbl_products_id_seq;
DROP TABLE IF EXISTS public.tbl_products;
DROP SEQUENCE IF EXISTS public.tbl_orders_id_seq;
DROP TABLE IF EXISTS public.tbl_orders;
DROP TABLE IF EXISTS public.tbl_order_items;
DROP SEQUENCE IF EXISTS public.tbl_notifications_id_seq;
DROP TABLE IF EXISTS public.tbl_notifications;
DROP TABLE IF EXISTS public.tbl_items;
DROP TABLE IF EXISTS public.tbl_comments;
DROP SEQUENCE IF EXISTS public.tbl_categories_id_seq;
DROP TABLE IF EXISTS public.tbl_categories;
DROP TABLE IF EXISTS public.tbl_cart_items;
DROP SEQUENCE IF EXISTS public.tbl_accounts_id_seq;
DROP TABLE IF EXISTS public.tbl_accounts;
DROP SCHEMA IF EXISTS public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: tbl_accounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_accounts
(
    id         integer                                                        NOT NULL,
    username   character varying(50)                                          NOT NULL,
    password   character varying(255)                                         NOT NULL,
    role       character varying(10)    DEFAULT 'CUSTOMER'::character varying NOT NULL,
    email      character varying(100)                                         NOT NULL,
    verify     boolean                  DEFAULT false                         NOT NULL,
    status     character varying(10)    DEFAULT 'ACTIVE'::character varying   NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_accounts_role CHECK (((role)::text = ANY
                                         ((ARRAY ['CUSTOMER'::character varying, 'ADMIN'::character varying, 'EMPLOYEE'::character varying])::text[]))),
    CONSTRAINT chk_accounts_status CHECK (((status)::text = ANY
                                           ((ARRAY ['ACTIVE'::character varying, 'INACTIVE'::character varying, 'BANNED'::character varying])::text[])))
);


ALTER TABLE public.tbl_accounts
    OWNER TO postgres;

--
-- Name: tbl_accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tbl_accounts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tbl_accounts_id_seq OWNER TO postgres;

--
-- Name: tbl_accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tbl_accounts_id_seq OWNED BY public.tbl_accounts.id;


--
-- Name: tbl_cart_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_cart_items
(
    user_id    uuid    NOT NULL,
    product_id integer NOT NULL,
    size_id    integer NOT NULL,
    quantity   integer NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.tbl_cart_items
    OWNER TO postgres;

--
-- Name: tbl_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_categories
(
    id          integer                               NOT NULL,
    name        character varying(50)                 NOT NULL,
    code        character varying(10)                 NOT NULL,
    img_url     character varying(255),
    description character varying(50),
    status      character varying(20)    DEFAULT 'ACTIVE'::character varying,
    parent_id   integer,
    is_leaf     boolean                  DEFAULT true NOT NULL,
    level       integer                  DEFAULT 0    NOT NULL,
    path        character varying(255),
    version     bigint                   DEFAULT 0    NOT NULL,
    created_at  timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at  timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_category_status CHECK (((status)::text = ANY
                                           ((ARRAY ['ACTIVE'::character varying, 'HIDDEN'::character varying])::text[])))
);


ALTER TABLE public.tbl_categories
    OWNER TO postgres;

--
-- Name: tbl_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tbl_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tbl_categories_id_seq OWNER TO postgres;

--
-- Name: tbl_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tbl_categories_id_seq OWNED BY public.tbl_categories.id;


--
-- Name: tbl_comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_comments
(
    product_id integer NOT NULL,
    user_id    uuid    NOT NULL,
    content    text    NOT NULL,
    rating     real,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.tbl_comments
    OWNER TO postgres;

--
-- Name: tbl_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_items
(
    product_id integer           NOT NULL,
    size_id    integer           NOT NULL,
    quantity   integer DEFAULT 0 NOT NULL,
    status     character varying(255),
    CONSTRAINT chk_item_status CHECK (((status)::text = ANY
                                       ((ARRAY ['AVAILABLE'::character varying, 'OUT_OF_STOCK'::character varying, 'DISCONTINUED'::character varying])::text[])))
);


ALTER TABLE public.tbl_items
    OWNER TO postgres;

--
-- Name: tbl_notifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_notifications
(
    id          integer               NOT NULL,
    code        character varying(30),
    sender_id   uuid,
    receiver_id uuid,
    type        character varying(20) NOT NULL,
    title       character varying(100),
    message     text,
    created_at  timestamp(6) with time zone,
    updated_at  timestamp(6) with time zone,
    for_admin   boolean DEFAULT true  NOT NULL,
    is_delete   boolean DEFAULT false NOT NULL,
    readed      boolean DEFAULT false NOT NULL
);


ALTER TABLE public.tbl_notifications
    OWNER TO postgres;

--
-- Name: tbl_notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tbl_notifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tbl_notifications_id_seq OWNER TO postgres;

--
-- Name: tbl_notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tbl_notifications_id_seq OWNED BY public.tbl_notifications.id;


--
-- Name: tbl_order_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_order_items
(
    order_id       integer        NOT NULL,
    product_id     integer        NOT NULL,
    size_id        integer        NOT NULL,
    quantity       integer        NOT NULL,
    total_price    numeric(38, 2) NOT NULL,
    final_price    numeric(38, 2) NOT NULL,
    original_price numeric(38, 2) NOT NULL
);


ALTER TABLE public.tbl_order_items
    OWNER TO postgres;

--
-- Name: tbl_orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_orders
(
    id               integer                                                       NOT NULL,
    code             character varying(20)                                         NOT NULL,
    status           character varying(20)    DEFAULT 'PENDING'::character varying NOT NULL,
    voucher_code     character varying(30),
    total_price      numeric(38, 2)                                                NOT NULL,
    voucher_discount numeric(38, 2),
    final_price      numeric(38, 2)                                                NOT NULL,
    note             character varying(500),
    version          bigint                   DEFAULT 0                            NOT NULL,
    user_id          uuid                                                          NOT NULL,
    receiver_id      integer                                                       NOT NULL,
    created_at       timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at       timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    payment_type     character varying(255),
    CONSTRAINT chk_order_status CHECK (((status)::text = ANY
                                        ((ARRAY ['UNPAID'::character varying, 'PAID'::character varying, 'PENDING'::character varying, 'CONFIRMED'::character varying, 'SHIPPING'::character varying, 'DELIVERED'::character varying, 'COMPLETED'::character varying, 'CANCELLED'::character varying, 'RETURNED'::character varying])::text[]))),
    CONSTRAINT tbl_orders_payment_type_check CHECK (((payment_type)::text = ANY
                                                     ((ARRAY ['PAYMENT_UPON_DELIVER'::character varying, 'ONLINE'::character varying])::text[])))
);


ALTER TABLE public.tbl_orders
    OWNER TO postgres;

--
-- Name: tbl_orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tbl_orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tbl_orders_id_seq OWNER TO postgres;

--
-- Name: tbl_orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tbl_orders_id_seq OWNED BY public.tbl_orders.id;


--
-- Name: tbl_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_products
(
    id            integer                                                      NOT NULL,
    name          character varying(50)                                        NOT NULL,
    code          character varying(30)                                        NOT NULL,
    description   character varying(255),
    quantity_sold integer                  DEFAULT 0,
    price         numeric(38, 2)           DEFAULT 0,
    status        character varying(20)    DEFAULT 'ACTIVE'::character varying NOT NULL,
    rated         real,
    category_id   integer,
    provider_id   integer,
    version       bigint                   DEFAULT 0                           NOT NULL,
    img           character varying(255),
    video         character varying(255),
    created_at    timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at    timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_product_status CHECK (((status)::text = ANY
                                          ((ARRAY ['ACTIVE'::character varying, 'ON_SALE'::character varying, 'OUT_OF_STOCK'::character varying, 'BESTSELLER'::character varying, 'DELETED'::character varying])::text[])))
);


ALTER TABLE public.tbl_products
    OWNER TO postgres;

--
-- Name: tbl_products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tbl_products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tbl_products_id_seq OWNER TO postgres;

--
-- Name: tbl_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tbl_products_id_seq OWNED BY public.tbl_products.id;


--
-- Name: tbl_promotion_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_promotion_category
(
    category_id  integer NOT NULL,
    promotion_id integer NOT NULL
);


ALTER TABLE public.tbl_promotion_category
    OWNER TO postgres;

--
-- Name: tbl_promotion_product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_promotion_product
(
    product_id   integer NOT NULL,
    promotion_id integer NOT NULL
);


ALTER TABLE public.tbl_promotion_product
    OWNER TO postgres;

--
-- Name: tbl_promotions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_promotions
(
    id       integer                                                      NOT NULL,
    value    integer                                                      NOT NULL,
    start_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    end_at   timestamp with time zone,
    priority integer                  DEFAULT 1,
    status   character varying(20)    DEFAULT 'SCHEDULED'::character varying,
    scope    character varying(20)    DEFAULT 'GLOBAL'::character varying NOT NULL,
    version  bigint                   DEFAULT 0                           NOT NULL,
    CONSTRAINT chk_promo_scope CHECK (((scope)::text = ANY
                                       ((ARRAY ['GLOBAL'::character varying, 'PRODUCT'::character varying, 'CATEGORY'::character varying, 'PROVIDER'::character varying])::text[]))),
    CONSTRAINT chk_promo_status CHECK (((status)::text = ANY
                                        ((ARRAY ['SCHEDULED'::character varying, 'ACTIVE'::character varying, 'ENDED'::character varying, 'DELETED'::character varying])::text[])))
);


ALTER TABLE public.tbl_promotions
    OWNER TO postgres;

--
-- Name: tbl_promotions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tbl_promotions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tbl_promotions_id_seq OWNER TO postgres;

--
-- Name: tbl_promotions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tbl_promotions_id_seq OWNED BY public.tbl_promotions.id;


--
-- Name: tbl_providers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_providers
(
    id          integer                            NOT NULL,
    name        character varying(50)              NOT NULL,
    code        character varying(10)              NOT NULL,
    description character varying(255),
    email       character varying(100),
    phone       character varying(15),
    status      character varying(20)    DEFAULT 'ACTIVE'::character varying,
    logo        character varying(255),
    version     bigint                   DEFAULT 0 NOT NULL,
    created_at  timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at  timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_provider_status CHECK (((status)::text = ANY
                                           ((ARRAY ['ACTIVE'::character varying, 'INACTIVE'::character varying, 'FAMOUS'::character varying])::text[])))
);


ALTER TABLE public.tbl_providers
    OWNER TO postgres;

--
-- Name: tbl_providers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tbl_providers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tbl_providers_id_seq OWNER TO postgres;

--
-- Name: tbl_providers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tbl_providers_id_seq OWNED BY public.tbl_providers.id;


--
-- Name: tbl_recivers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_recivers
(
    id       integer                NOT NULL,
    f_name   character varying(100),
    l_name   character varying(100),
    phone    character varying(10)  NOT NULL,
    country  character varying(20)  NOT NULL,
    province character varying(20)  NOT NULL,
    district character varying(20)  NOT NULL,
    street   character varying(100) NOT NULL,
    detail   character varying(255),
    user_id  uuid                   NOT NULL
);


ALTER TABLE public.tbl_recivers
    OWNER TO postgres;

--
-- Name: tbl_recivers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tbl_recivers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tbl_recivers_id_seq OWNER TO postgres;

--
-- Name: tbl_recivers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tbl_recivers_id_seq OWNED BY public.tbl_recivers.id;


--
-- Name: tbl_sizes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_sizes
(
    id         integer NOT NULL,
    size       character varying(255),
    weight     double precision,
    height     double precision,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.tbl_sizes
    OWNER TO postgres;

--
-- Name: tbl_sizes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tbl_sizes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tbl_sizes_id_seq OWNER TO postgres;

--
-- Name: tbl_sizes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tbl_sizes_id_seq OWNED BY public.tbl_sizes.id;


--
-- Name: tbl_user_vouchers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_user_vouchers
(
    voucher_id      integer                                                      NOT NULL,
    user_id         uuid                                                         NOT NULL,
    status          character varying(20) DEFAULT 'AVAILABLE'::character varying NOT NULL,
    end_at          timestamp with time zone,
    min_price_apply numeric(38, 2),
    version         bigint                DEFAULT 0                              NOT NULL,
    CONSTRAINT chk_uv_status CHECK (((status)::text = ANY
                                     ((ARRAY ['AVAILABLE'::character varying, 'USED'::character varying, 'EXPIRED'::character varying])::text[])))
);


ALTER TABLE public.tbl_user_vouchers
    OWNER TO postgres;

--
-- Name: tbl_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_users
(
    id         uuid                     DEFAULT gen_random_uuid() NOT NULL,
    f_name     character varying(255),
    l_name     character varying(255),
    avatar     character varying(255),
    acc_id     integer,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.tbl_users
    OWNER TO postgres;

--
-- Name: tbl_vouchers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_vouchers
(
    id               integer                                                      NOT NULL,
    code             character varying(30)                                        NOT NULL,
    status           character varying(20)    DEFAULT 'ACTIVE'::character varying NOT NULL,
    value            integer                                                      NOT NULL,
    min_order_amount numeric(38, 2)           DEFAULT 0                           NOT NULL,
    start_at         timestamp with time zone,
    end_at           timestamp with time zone,
    version          bigint                   DEFAULT 0                           NOT NULL,
    created_at       timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at       timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    discount_type    character varying(20)                                        NOT NULL,
    voucher_type     character varying(20)                                        NOT NULL,
    CONSTRAINT chk_voucher_discount_type CHECK ((("discount_type")::text = ANY
                                                 ((ARRAY ['PERCENT'::character varying, 'FIXED'::character varying])::text[]))),
    CONSTRAINT chk_voucher_status CHECK (((status)::text = ANY
                                          ((ARRAY ['ACTIVE'::character varying, 'INACTIVE'::character varying, 'COMMING_SOON'::character varying])::text[]))),
    CONSTRAINT chk_voucher_type CHECK ((("voucher_type")::text = ANY
                                        ((ARRAY ['NEWBIE'::character varying, 'GLOBAL'::character varying])::text[]))),
    CONSTRAINT tbl_vouchers_discount_type_check CHECK (((discount_type)::text = ANY
                                                        ((ARRAY ['PERCENT'::character varying, 'FIXED'::character varying])::text[]))),
    CONSTRAINT tbl_vouchers_voucher_type_check CHECK (((voucher_type)::text = ANY
                                                       ((ARRAY ['NEWBIE'::character varying, 'GLOBAL'::character varying])::text[])))
);


ALTER TABLE public.tbl_vouchers
    OWNER TO postgres;

--
-- Name: tbl_vouchers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tbl_vouchers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tbl_vouchers_id_seq OWNER TO postgres;

--
-- Name: tbl_vouchers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tbl_vouchers_id_seq OWNED BY public.tbl_vouchers.id;


--
-- Name: tbl_accounts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_accounts
    ALTER COLUMN id SET DEFAULT nextval('public.tbl_accounts_id_seq'::regclass);


--
-- Name: tbl_categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_categories
    ALTER COLUMN id SET DEFAULT nextval('public.tbl_categories_id_seq'::regclass);


--
-- Name: tbl_notifications id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_notifications
    ALTER COLUMN id SET DEFAULT nextval('public.tbl_notifications_id_seq'::regclass);


--
-- Name: tbl_orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_orders
    ALTER COLUMN id SET DEFAULT nextval('public.tbl_orders_id_seq'::regclass);


--
-- Name: tbl_products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_products
    ALTER COLUMN id SET DEFAULT nextval('public.tbl_products_id_seq'::regclass);


--
-- Name: tbl_promotions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_promotions
    ALTER COLUMN id SET DEFAULT nextval('public.tbl_promotions_id_seq'::regclass);


--
-- Name: tbl_providers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_providers
    ALTER COLUMN id SET DEFAULT nextval('public.tbl_providers_id_seq'::regclass);


--
-- Name: tbl_recivers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_recivers
    ALTER COLUMN id SET DEFAULT nextval('public.tbl_recivers_id_seq'::regclass);


--
-- Name: tbl_sizes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_sizes
    ALTER COLUMN id SET DEFAULT nextval('public.tbl_sizes_id_seq'::regclass);


--
-- Name: tbl_vouchers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_vouchers
    ALTER COLUMN id SET DEFAULT nextval('public.tbl_vouchers_id_seq'::regclass);


--
-- Data for Name: tbl_accounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tbl_accounts
VALUES (6, 'admin', '$2a$10$so6pABz4rH8ssDUpSSXhU.Z72I8PF/i2qjwF6iAI5PQaFCJfdI6di', 'ADMIN', 'hi@gmail.com', true,
        'ACTIVE', '2026-04-23 15:01:06.630156+00', '2026-04-23 15:01:06.630156+00');
INSERT INTO public.tbl_accounts
VALUES (101, 'nguyenvanan', '$2a$10$dXJ3SW6G7P50lGmMQgel6uVktDQd6B6TlQ8VjYDd3h3gI0rDVxMT.', 'CUSTOMER',
        'an.nguyen@gmail.com', true, 'ACTIVE', '2026-04-23 15:02:47.756965+00', '2026-04-23 15:02:47.756965+00');
INSERT INTO public.tbl_accounts
VALUES (102, 'tranbinhchi', '$2a$10$dXJ3SW6G7P50lGmMQgel6uVktDQd6B6TlQ8VjYDd3h3gI0rDVxMT.', 'CUSTOMER',
        'binh.tran@gmail.com', true, 'ACTIVE', '2026-04-23 15:02:47.756965+00', '2026-04-23 15:02:47.756965+00');
INSERT INTO public.tbl_accounts
VALUES (103, 'lehoangcuong', '$2a$10$dXJ3SW6G7P50lGmMQgel6uVktDQd6B6TlQ8VjYDd3h3gI0rDVxMT.', 'CUSTOMER',
        'cuong.le@gmail.com', true, 'ACTIVE', '2026-04-23 15:02:47.756965+00', '2026-04-23 15:02:47.756965+00');
INSERT INTO public.tbl_accounts
VALUES (104, 'phamminhdung', '$2a$10$dXJ3SW6G7P50lGmMQgel6uVktDQd6B6TlQ8VjYDd3h3gI0rDVxMT.', 'CUSTOMER',
        'dung.pham@gmail.com', true, 'ACTIVE', '2026-04-23 15:02:47.756965+00', '2026-04-23 15:02:47.756965+00');
INSERT INTO public.tbl_accounts
VALUES (105, 'hoangthuha', '$2a$10$dXJ3SW6G7P50lGmMQgel6uVktDQd6B6TlQ8VjYDd3h3gI0rDVxMT.', 'CUSTOMER',
        'ha.hoang@gmail.com', true, 'ACTIVE', '2026-04-23 15:02:47.756965+00', '2026-04-23 15:02:47.756965+00');
INSERT INTO public.tbl_accounts
VALUES (106, 'vodinhkhoa', '$2a$10$dXJ3SW6G7P50lGmMQgel6uVktDQd6B6TlQ8VjYDd3h3gI0rDVxMT.', 'CUSTOMER',
        'khoa.vo@gmail.com', true, 'ACTIVE', '2026-04-23 15:02:47.756965+00', '2026-04-23 15:02:47.756965+00');
INSERT INTO public.tbl_accounts
VALUES (107, 'dangngoclinh', '$2a$10$dXJ3SW6G7P50lGmMQgel6uVktDQd6B6TlQ8VjYDd3h3gI0rDVxMT.', 'CUSTOMER',
        'linh.dang@gmail.com', true, 'ACTIVE', '2026-04-23 15:02:47.756965+00', '2026-04-23 15:02:47.756965+00');
INSERT INTO public.tbl_accounts
VALUES (108, 'buithanhmai', '$2a$10$dXJ3SW6G7P50lGmMQgel6uVktDQd6B6TlQ8VjYDd3h3gI0rDVxMT.', 'CUSTOMER',
        'mai.bui@gmail.com', true, 'ACTIVE', '2026-04-23 15:02:47.756965+00', '2026-04-23 15:02:47.756965+00');
INSERT INTO public.tbl_accounts
VALUES (109, 'ngoquocnam', '$2a$10$dXJ3SW6G7P50lGmMQgel6uVktDQd6B6TlQ8VjYDd3h3gI0rDVxMT.', 'CUSTOMER',
        'nam.ngo@gmail.com', true, 'ACTIVE', '2026-04-23 15:02:47.756965+00', '2026-04-23 15:02:47.756965+00');
INSERT INTO public.tbl_accounts
VALUES (110, 'duongthuyphuong', '$2a$10$dXJ3SW6G7P50lGmMQgel6uVktDQd6B6TlQ8VjYDd3h3gI0rDVxMT.', 'CUSTOMER',
        'phuong.duong@gmail.com', true, 'ACTIVE', '2026-04-23 15:02:47.756965+00', '2026-04-23 15:02:47.756965+00');
INSERT INTO public.tbl_accounts
VALUES (113, 'user', '$2a$10$g6po15P2zbRIulAyN1qAk.I4iBxuianekiE66NtfyFF3Q2PLuARFq', 'CUSTOMER',
        'dungcony070804@gmail.com', true, 'ACTIVE', '2026-05-18 17:37:51.163171+00', '2026-05-18 17:37:51.163171+00');
INSERT INTO public.tbl_accounts
VALUES (114, 'userr', '$2a$10$Iwj0i3/MyzlJt3Up22smH..zjPhlFn9xLPFqiDn6oAU1PpUz.IfOq', 'CUSTOMER',
        'dungcony07080@gmail.com', false, 'ACTIVE', '2026-05-18 17:39:09.451473+00', '2026-05-18 17:39:09.451473+00');


--
-- Data for Name: tbl_cart_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tbl_cart_items
VALUES ('54a4371a-76a7-4750-a1ad-99652d31f08f', 2, 1, 1, '2026-05-18 17:41:33.272419+00',
        '2026-05-18 17:41:33.272419+00');
INSERT INTO public.tbl_cart_items
VALUES ('54a4371a-76a7-4750-a1ad-99652d31f08f', 22, 3, 1, '2026-05-20 04:01:59.166045+00',
        '2026-05-20 04:14:49.886389+00');


--
-- Data for Name: tbl_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tbl_categories
VALUES (1, 'Thời trang nam', 'MEN', 'https://images.unsplash.com/photo-1552642986-ccb41e7059e7?w=200&h=200&fit=crop',
        'Quần áo nam', 'ACTIVE', NULL, false, 0, '1', 0, '2026-04-23 15:01:49.070516+00',
        '2026-04-23 15:01:49.070516+00');
INSERT INTO public.tbl_categories
VALUES (2, 'Thời trang nữ', 'WOMEN',
        'https://images.unsplash.com/photo-1595777457583-95e059d581b8?w=200&h=200&fit=crop', 'Quần áo nữ', 'ACTIVE',
        NULL, false, 0, '2', 0, '2026-04-23 15:01:49.070516+00', '2026-04-23 15:01:49.070516+00');
INSERT INTO public.tbl_categories
VALUES (3, 'Phụ kiện', 'ACC', 'https://images.unsplash.com/photo-1598532163257-ae3c6b2524b6?w=200&h=200&fit=crop',
        'Phụ kiện thời trang', 'ACTIVE', NULL, false, 0, '3', 0, '2026-04-23 15:01:49.070516+00',
        '2026-04-23 15:01:49.070516+00');
INSERT INTO public.tbl_categories
VALUES (4, 'Giày dép', 'SHOES',
        'https://images.pexels.com/photos/2048548/pexels-photo-2048548.jpeg?auto=compress&cs=tinysrgb&w=200',
        'Giày dép các loại', 'ACTIVE', NULL, false, 0, '4', 0, '2026-04-23 15:01:49.070516+00',
        '2026-04-23 15:01:49.070516+00');
INSERT INTO public.tbl_categories
VALUES (5, 'Áo thun nam', 'MTS', 'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=200&h=200&fit=crop',
        'Áo thun nam các loại', 'ACTIVE', 1, true, 1, '1/5', 0, '2026-04-23 15:01:49.568524+00',
        '2026-04-23 15:01:49.568524+00');
INSERT INTO public.tbl_categories
VALUES (6, 'Quần jeans nam', 'MJN', 'https://images.unsplash.com/photo-1563902575-bc2309dc76e4?w=200&h=200&fit=crop',
        'Quần jeans nam', 'ACTIVE', 1, true, 1, '1/6', 0, '2026-04-23 15:01:49.568524+00',
        '2026-04-23 15:01:49.568524+00');
INSERT INTO public.tbl_categories
VALUES (7, 'Áo khoác nam', 'MJK', 'https://images.unsplash.com/photo-1556821840-3a63f95609a7?w=200&h=200&fit=crop',
        'Áo khoác nam', 'ACTIVE', 1, true, 1, '1/7', 0, '2026-04-23 15:01:49.568524+00',
        '2026-04-23 15:01:49.568524+00');
INSERT INTO public.tbl_categories
VALUES (8, 'Áo thun nữ', 'WTS', 'https://images.unsplash.com/photo-1595777457583-95e059d581b8?w=200&h=200&fit=crop',
        'Áo thun nữ các loại', 'ACTIVE', 2, true, 1, '2/8', 0, '2026-04-23 15:01:49.568524+00',
        '2026-04-23 15:01:49.568524+00');
INSERT INTO public.tbl_categories
VALUES (9, 'Váy đầm', 'WDR',
        'https://images.unsplash.com/flagged/photo-1585052201332-b8c0ce30972f?w=200&h=200&fit=crop', 'Váy đầm nữ',
        'ACTIVE', 2, true, 1, '2/9', 0, '2026-04-23 15:01:49.568524+00', '2026-04-23 15:01:49.568524+00');
INSERT INTO public.tbl_categories
VALUES (10, 'Quần nữ', 'WPN', 'https://images.unsplash.com/photo-1594633312681-425c7b97ccd1?w=200&h=200&fit=crop',
        'Quần nữ các loại', 'ACTIVE', 2, true, 1, '2/10', 0, '2026-04-23 15:01:49.568524+00',
        '2026-04-23 15:01:49.568524+00');
INSERT INTO public.tbl_categories
VALUES (11, 'Mũ & Nón', 'HAT', 'https://images.unsplash.com/photo-1563319078-0b3ad9b6007a?w=200&h=200&fit=crop',
        'Mũ nón thời trang', 'ACTIVE', 3, true, 1, '3/11', 0, '2026-04-23 15:01:49.568524+00',
        '2026-04-23 15:01:49.568524+00');
INSERT INTO public.tbl_categories
VALUES (12, 'Túi xách', 'BAG', 'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=200&h=200&fit=crop',
        'Túi xách các loại', 'ACTIVE', 3, true, 1, '3/12', 0, '2026-04-23 15:01:49.568524+00',
        '2026-04-23 15:01:49.568524+00');
INSERT INTO public.tbl_categories
VALUES (13, 'Giày thể thao', 'SNK',
        'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=200',
        'Giày sneaker', 'ACTIVE', 4, true, 1, '4/13', 0, '2026-04-23 15:01:49.568524+00',
        '2026-04-23 15:01:49.568524+00');
INSERT INTO public.tbl_categories
VALUES (14, 'Dép & Sandal', 'SDL',
        'https://images.pexels.com/photos/267202/pexels-photo-267202.jpeg?auto=compress&cs=tinysrgb&w=200',
        'Dép và sandal', 'ACTIVE', 4, true, 1, '4/14', 0, '2026-04-23 15:01:49.568524+00',
        '2026-04-23 15:01:49.568524+00');


--
-- Data for Name: tbl_comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tbl_comments
VALUES (1, 'f47ac10b-58cc-4372-a567-0e02b2c3d401',
        'Vải cotton mềm mại, mặc rất thoáng. Mua lần 3 rồi, chất lượng ổn định.', 5, '2026-04-23 15:02:49.656479+00',
        '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (1, 'f47ac10b-58cc-4372-a567-0e02b2c3d403', 'Form áo vừa vặn, không bị rộng hay chật. Giao hàng nhanh nữa.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (1, 'f47ac10b-58cc-4372-a567-0e02b2c3d405', 'Áo đẹp lắm, mặc đi làm hay đi chơi đều được. Rất hài lòng!', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (1, 'f47ac10b-58cc-4372-a567-0e02b2c3d407', 'Chất vải tốt, giặt nhiều không bị giãn. Giá hợp lý.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (1, 'f47ac10b-58cc-4372-a567-0e02b2c3d409', 'Áo đẹp nhưng màu hơi khác so với hình. Vẫn ổn cho giá này.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (2, 'f47ac10b-58cc-4372-a567-0e02b2c3d401', 'Công nghệ Dri-FIT thật sự thoát mồ hôi tốt, chạy bộ mát lắm.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (2, 'f47ac10b-58cc-4372-a567-0e02b2c3d402', 'Mặc tập gym rất thoải mái, khô nhanh. Đáng tiền Nike.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (2, 'f47ac10b-58cc-4372-a567-0e02b2c3d404', 'Chất lượng tốt nhưng giá hơi cao so với áo thun bình thường.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (2, 'f47ac10b-58cc-4372-a567-0e02b2c3d406', 'Áo nhẹ, mau khô. Nhưng size hơi nhỏ so với bảng size thường.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (3, 'f47ac10b-58cc-4372-a567-0e02b2c3d402', 'Logo Trefoil cổ điển, phối streetwear rất đẹp!', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (3, 'f47ac10b-58cc-4372-a567-0e02b2c3d403', 'Áo ổn, nhưng vải hơi mỏng hơn mình nghĩ. Vẫn đáng mua.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (3, 'f47ac10b-58cc-4372-a567-0e02b2c3d408', 'Mặc đi chơi thì ok, nhưng giặt vài lần thấy phai màu nhẹ.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (4, 'f47ac10b-58cc-4372-a567-0e02b2c3d401', 'Supima Cotton đúng là khác biệt, mềm mượt hơn cotton thường nhiều.',
        5, '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (4, 'f47ac10b-58cc-4372-a567-0e02b2c3d405', 'Vải cao cấp, form đẹp. Uniqlo không bao giờ làm thất vọng.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (4, 'f47ac10b-58cc-4372-a567-0e02b2c3d406', 'Chất vải rất mịn nhưng hơi dễ nhăn, cần là hơi phiền.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (4, 'f47ac10b-58cc-4372-a567-0e02b2c3d407', 'Mua lần 2, chất lượng vẫn đều. Rất thích sự đơn giản của Uniqlo.',
        5, '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (4, 'f47ac10b-58cc-4372-a567-0e02b2c3d410', 'Áo mềm thật sự, nhưng size chart hơi lệch, mua lên 1 size nhé.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (5, 'f47ac10b-58cc-4372-a567-0e02b2c3d403', 'Graphic đẹp, form oversize đúng trend. Giá sale rất hời!', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (5, 'f47ac10b-58cc-4372-a567-0e02b2c3d404', 'Áo ok nhưng hình in có dấu hiệu bong sau vài lần giặt.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (5, 'f47ac10b-58cc-4372-a567-0e02b2c3d406', 'Form oversize thoải mái, mặc mùa hè mát. Graphic bắt mắt.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (5, 'f47ac10b-58cc-4372-a567-0e02b2c3d408', 'Thiết kế đẹp, nhưng vải hơi nóng hơn mong đợi.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (5, 'f47ac10b-58cc-4372-a567-0e02b2c3d409', 'Chất áo tạm ổn so với giá tiền. Graphic không bị nhòe.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (6, 'f47ac10b-58cc-4372-a567-0e02b2c3d401', 'Co giãn cực tốt, mặc cả ngày không bí. Form slim rất đẹp.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (6, 'f47ac10b-58cc-4372-a567-0e02b2c3d403', 'Quần Zara đúng chuẩn, chất jeans dày dặn mà vẫn thoáng.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (6, 'f47ac10b-58cc-4372-a567-0e02b2c3d407', 'Form slim fit chuẩn, phối với áo thun hay sơ mi đều đẹp.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (6, 'f47ac10b-58cc-4372-a567-0e02b2c3d409', 'Quần đẹp, nhưng ống hơi bó ở bắp chân với người chân to.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (7, 'f47ac10b-58cc-4372-a567-0e02b2c3d402', 'Ống đứng cổ điển, phối giày gì cũng hợp. Chất jeans bền.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (7, 'f47ac10b-58cc-4372-a567-0e02b2c3d404', 'Quần ok, nhưng màu thực tế nhạt hơn hình chút.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (7, 'f47ac10b-58cc-4372-a567-0e02b2c3d405', 'Form straight thoải mái, mặc đi làm hay đi chơi đều ổn.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (7, 'f47ac10b-58cc-4372-a567-0e02b2c3d408', 'Chất vải dày, đường may chắc chắn. Rất ưng ý.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (7, 'f47ac10b-58cc-4372-a567-0e02b2c3d410', 'Quần đẹp, giá tầm trung hợp lý. Hơi cứng khi mới mua.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (8, 'f47ac10b-58cc-4372-a567-0e02b2c3d401',
        'Regular fit thoải mái nhất, mặc cả ngày không mỏi. Uniqlo chất lượng!', 5, '2026-04-23 15:02:49.656479+00',
        '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (8, 'f47ac10b-58cc-4372-a567-0e02b2c3d406', 'Quần jeans Uniqlo giá rẻ mà chất lượng không thua hàng hiệu.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (8, 'f47ac10b-58cc-4372-a567-0e02b2c3d407', 'Vải ổn nhưng hơi mỏng so với jeans truyền thống.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (8, 'f47ac10b-58cc-4372-a567-0e02b2c3d409', 'Form regular vừa, không rộng quá. Phù hợp đi làm hàng ngày.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (9, 'f47ac10b-58cc-4372-a567-0e02b2c3d402', 'Siêu nhẹ, gấp gọn bỏ túi luôn. Chống gió tốt khi đi xe máy.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (9, 'f47ac10b-58cc-4372-a567-0e02b2c3d403', 'Áo khoác Nike chất lượng đỉnh, mặc chạy bộ sáng sớm rất ấm.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (9, 'f47ac10b-58cc-4372-a567-0e02b2c3d405', 'Nhẹ và thoáng nhưng chống nước chỉ ở mức nhẹ thôi.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (9, 'f47ac10b-58cc-4372-a567-0e02b2c3d408', 'Thiết kế đẹp, tiện lợi. Mua thêm cho cả nhà.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (9, 'f47ac10b-58cc-4372-a567-0e02b2c3d410', 'Chất lượng tốt nhưng túi áo hơi nhỏ, không để được điện thoại to.',
        4, '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (10, 'f47ac10b-58cc-4372-a567-0e02b2c3d401', 'Nỉ bông ấm áp, hoodie này mặc mùa đông Đà Lạt là perfect.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (10, 'f47ac10b-58cc-4372-a567-0e02b2c3d402', 'Chất nỉ mềm, không xù sau khi giặt. Coolmate chất lượng thật.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (10, 'f47ac10b-58cc-4372-a567-0e02b2c3d404', 'Form đẹp, mũ trùm vừa đầu. Màu sắc giống hình.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (10, 'f47ac10b-58cc-4372-a567-0e02b2c3d406', 'Hoodie xịn nhất mình từng mua trong tầm giá này!', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (10, 'f47ac10b-58cc-4372-a567-0e02b2c3d408', 'Áo ấm, đẹp. Chỉ tiếc là không có nhiều màu để chọn.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (11, 'f47ac10b-58cc-4372-a567-0e02b2c3d403', 'Style bomber cổ điển, mặc với quần jeans cực ngầu!', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (11, 'f47ac10b-58cc-4372-a567-0e02b2c3d404', 'Áo đẹp nhưng hơi nóng khi mặc trong nhà. Phù hợp ra ngoài.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (11, 'f47ac10b-58cc-4372-a567-0e02b2c3d410', 'Chất lượng ổn so với giá, nhưng khóa kéo hơi khó kéo.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (12, 'f47ac10b-58cc-4372-a567-0e02b2c3d402', 'Vải cotton mềm, mặc rất thoải mái. Phối đồ dễ dàng.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (12, 'f47ac10b-58cc-4372-a567-0e02b2c3d405', 'Áo basic nhưng chất lượng không basic chút nào! Rất thích.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (12, 'f47ac10b-58cc-4372-a567-0e02b2c3d407', 'Mua cả lố mặc thay nhau, giá H&M rất phải chăng.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (12, 'f47ac10b-58cc-4372-a567-0e02b2c3d410', 'Áo đẹp, hơi mỏng nhưng mặc mùa hè thì OK.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (13, 'f47ac10b-58cc-4372-a567-0e02b2c3d402', 'Crop top Zara kiểu dáng trẻ trung, phối quần cạp cao rất đẹp!', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (13, 'f47ac10b-58cc-4372-a567-0e02b2c3d405', 'Áo vừa vặn, chất vải co giãn tốt. Size đúng chuẩn.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (13, 'f47ac10b-58cc-4372-a567-0e02b2c3d407', 'Kiểu dáng đẹp nhưng vải hơi mỏng, cần mặc áo lót bên trong.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (13, 'f47ac10b-58cc-4372-a567-0e02b2c3d408', 'Siêu xinh luôn! Phối với chân váy hay quần jeans đều hợp.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (13, 'f47ac10b-58cc-4372-a567-0e02b2c3d410', 'Áo đẹp, nhưng độ dài hơi ngắn hơn mong đợi.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (14, 'f47ac10b-58cc-4372-a567-0e02b2c3d402', 'Áo peplum Ivy Moda thanh lịch, mặc đi làm rất sang.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (14, 'f47ac10b-58cc-4372-a567-0e02b2c3d405', 'Chất vải cao cấp xứng đáng với giá. Form rất tôn dáng.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (14, 'f47ac10b-58cc-4372-a567-0e02b2c3d407', 'Đẹp nhưng cần chọn size cẩn thận, hơi rộng so với bảng size.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (14, 'f47ac10b-58cc-4372-a567-0e02b2c3d408', 'Áo thanh lịch, đi tiệc hay đi làm đều phù hợp.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (15, 'f47ac10b-58cc-4372-a567-0e02b2c3d402', 'Đầm công sở chuẩn Ivy Moda, chất liệu tốt, không nhăn.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (15, 'f47ac10b-58cc-4372-a567-0e02b2c3d405', 'Mặc đi làm cả ngày vẫn thoải mái. Form suông che khuyết điểm tốt.',
        5, '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (15, 'f47ac10b-58cc-4372-a567-0e02b2c3d406', 'Đẹp nhưng hơi ngắn, mình cao 1m65 thì vừa đầu gối.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (15, 'f47ac10b-58cc-4372-a567-0e02b2c3d407', 'Đầm sang trọng, đồng nghiệp ai cũng khen.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (15, 'f47ac10b-58cc-4372-a567-0e02b2c3d410', 'Chất vải đẹp nhưng hơi nóng khi mặc mùa hè.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (16, 'f47ac10b-58cc-4372-a567-0e02b2c3d402', 'Hoa nhí vintage đẹp lắm, mặc đi biển là chuẩn bài!', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (16, 'f47ac10b-58cc-4372-a567-0e02b2c3d405', 'Đầm dài nên cần chú ý chiều cao. Mình 1m55 phải sửa lai.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (16, 'f47ac10b-58cc-4372-a567-0e02b2c3d408', 'Họa tiết đẹp, nhưng vải hơi mỏng cần mặc lót bên trong.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (17, 'f47ac10b-58cc-4372-a567-0e02b2c3d402', 'Đầm ôm sát tôn dáng cực kỳ! Mặc đi tiệc ai cũng nhìn.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (17, 'f47ac10b-58cc-4372-a567-0e02b2c3d405', 'Chất vải co giãn tốt nhưng dễ bám bụi, cần chú ý.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (17, 'f47ac10b-58cc-4372-a567-0e02b2c3d407', 'Form ôm body nên phải chọn đúng size. Size M vừa 55kg.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (17, 'f47ac10b-58cc-4372-a567-0e02b2c3d408', 'Đầm quyến rũ, Ivy Moda thiết kế rất tinh tế.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (17, 'f47ac10b-58cc-4372-a567-0e02b2c3d410', 'Đẹp nhưng giá hơi cao so với mặt bằng chung.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (18, 'f47ac10b-58cc-4372-a567-0e02b2c3d402', 'Ống rộng thoải mái, H&M luôn có form đẹp. Rất thích!', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (18, 'f47ac10b-58cc-4372-a567-0e02b2c3d405', 'Quần baggy này phối áo thun hay áo sơ mi đều hợp.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (18, 'f47ac10b-58cc-4372-a567-0e02b2c3d407', 'Vải ổn nhưng nhăn nhanh, cần là ủi thường xuyên.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (18, 'f47ac10b-58cc-4372-a567-0e02b2c3d409', 'Quần thoải mái cho mùa hè, giá cả hợp lý.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (19, 'f47ac10b-58cc-4372-a567-0e02b2c3d402', 'Co giãn 4 chiều thật sự! Tập yoga mà thoải mái vô cùng.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (19, 'f47ac10b-58cc-4372-a567-0e02b2c3d405', 'Legging Nike xịn, không bị trong suốt khi squat. Yên tâm tập.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (19, 'f47ac10b-58cc-4372-a567-0e02b2c3d407', 'Chất vải mát, thoáng khí. Mặc chạy bộ cũng rất ổn.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (19, 'f47ac10b-58cc-4372-a567-0e02b2c3d410', 'Legging đẹp nhưng dễ bám lông mèo. Ai nuôi thú cưng lưu ý.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (20, 'f47ac10b-58cc-4372-a567-0e02b2c3d401', 'Nón Nike chính hãng, logo thêu sắc nét. Chống nắng tốt.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (20, 'f47ac10b-58cc-4372-a567-0e02b2c3d403', 'Đội vừa đầu, quai sau điều chỉnh được. Đẹp như hình.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (20, 'f47ac10b-58cc-4372-a567-0e02b2c3d404', 'Nón ổn nhưng vải hơi nóng khi đội lâu dưới nắng.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (20, 'f47ac10b-58cc-4372-a567-0e02b2c3d406', 'Phong cách sporty, phối đồ thể thao hay casual đều hợp.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (20, 'f47ac10b-58cc-4372-a567-0e02b2c3d409', 'Nón đẹp, nhưng size one-size hơi nhỏ với đầu mình.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (21, 'f47ac10b-58cc-4372-a567-0e02b2c3d402', 'Bucket hat Adidas phong cách đường phố, rất cool!', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (21, 'f47ac10b-58cc-4372-a567-0e02b2c3d404', 'Che nắng khá tốt, nhưng vành mũ hơi mềm, gió thổi hay bay.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (21, 'f47ac10b-58cc-4372-a567-0e02b2c3d408', 'Mũ đẹp, đi chơi phố rất hợp. Giá tầm trung chấp nhận được.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (22, 'f47ac10b-58cc-4372-a567-0e02b2c3d401', 'Balo Nike ngăn chứa rộng, để laptop 15 inch thoải mái.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (22, 'f47ac10b-58cc-4372-a567-0e02b2c3d403', 'Chống nước nhẹ, đi mưa nhỏ không lo ướt đồ bên trong.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (22, 'f47ac10b-58cc-4372-a567-0e02b2c3d406', 'Balo đẹp nhưng quai hơi mỏng, đeo lâu hơi đau vai.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (22, 'f47ac10b-58cc-4372-a567-0e02b2c3d409', 'Thiết kế đẹp, nhiều ngăn tiện lợi. Dây kéo hơi cứng ban đầu.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (23, 'f47ac10b-58cc-4372-a567-0e02b2c3d402', 'Túi tote canvas phong cách minimalist, mang đi học đi làm đều ok.',
        5, '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (23, 'f47ac10b-58cc-4372-a567-0e02b2c3d405', 'Vải canvas dày dặn, khâu tay cẩn thận. Giá Uniqlo rất phải chăng.',
        4, '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (23, 'f47ac10b-58cc-4372-a567-0e02b2c3d407', 'Túi rộng nhưng không có khóa kéo, hơi lo lắng khi đi xe buýt.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (23, 'f47ac10b-58cc-4372-a567-0e02b2c3d408', 'Đơn giản mà đẹp, để đồ thoải mái. Mình rất thích style này!', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (23, 'f47ac10b-58cc-4372-a567-0e02b2c3d410', 'Túi ổn so với giá, nhưng quai hơi ngắn khi đeo vai.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (24, 'f47ac10b-58cc-4372-a567-0e02b2c3d401', 'Huyền thoại Air Max! Đệm Air êm ái, đi cả ngày không mỏi chân.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (24, 'f47ac10b-58cc-4372-a567-0e02b2c3d402', 'Giày đẹp xuất sắc, chất lượng Nike không phải bàn.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (24, 'f47ac10b-58cc-4372-a567-0e02b2c3d403', 'Air Max 90 kinh điển, mang mãi không chán. Worth every penny!', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (24, 'f47ac10b-58cc-4372-a567-0e02b2c3d404', 'Êm chân, nhẹ, phong cách retro rất đẹp. 10/10!', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (24, 'f47ac10b-58cc-4372-a567-0e02b2c3d405', 'Mua tặng bạn trai, anh ấy mê lắm. Đóng gói cẩn thận.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (24, 'f47ac10b-58cc-4372-a567-0e02b2c3d406', 'Đi bộ cả ngày mà chân vẫn thoải mái. Công nghệ Air xịn thật.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (24, 'f47ac10b-58cc-4372-a567-0e02b2c3d407', 'Phối đồ cực dễ, mang với quần jeans hay jogger đều đẹp.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (24, 'f47ac10b-58cc-4372-a567-0e02b2c3d408', 'Chất lượng tuyệt vời, đúng hàng chính hãng Nike.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (24, 'f47ac10b-58cc-4372-a567-0e02b2c3d409', 'Giày iconic, mua đúng size là chuẩn luôn. Không cần break in.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (24, 'f47ac10b-58cc-4372-a567-0e02b2c3d410', 'Giày đẹp lắm nhưng giá hơi cao. Nên canh sale để mua.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (25, 'f47ac10b-58cc-4372-a567-0e02b2c3d401', 'Boost êm nhất thị trường! Chạy bộ 10km mà chân như đi trên mây.',
        5, '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (25, 'f47ac10b-58cc-4372-a567-0e02b2c3d403', 'Nhẹ vô cùng, đế Boost hấp thụ lực rất tốt khi chạy.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (25, 'f47ac10b-58cc-4372-a567-0e02b2c3d405', 'Adidas Ultraboost không hổ danh, mang suốt ngày không đau chân.',
        5, '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (25, 'f47ac10b-58cc-4372-a567-0e02b2c3d406', 'Giày chạy bộ tốt nhất mình từng mua. Rất recommend!', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (25, 'f47ac10b-58cc-4372-a567-0e02b2c3d409', 'Giày êm, nhẹ nhưng đế Boost dễ bám bụi bẩn khó lau.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (26, 'f47ac10b-58cc-4372-a567-0e02b2c3d401', 'Vans Old Skool kinh điển, đi đâu cũng được compliment.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (26, 'f47ac10b-58cc-4372-a567-0e02b2c3d404', 'Sọc trắng bên hông quá iconic! Phối streetwear là đỉnh.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (26, 'f47ac10b-58cc-4372-a567-0e02b2c3d407', 'Giày đẹp, bền bỉ. Mang gần 2 năm vẫn chưa hỏng.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (26, 'f47ac10b-58cc-4372-a567-0e02b2c3d410', 'Classic đẹp nhưng đế hơi cứng, cần thời gian break in.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (27, 'f47ac10b-58cc-4372-a567-0e02b2c3d402', 'Converse cổ cao huyền thoại! Phối quần jeans là bất bại.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (27, 'f47ac10b-58cc-4372-a567-0e02b2c3d403', 'Giày Converse biểu tượng, ai cũng nên có 1 đôi trong tủ.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (27, 'f47ac10b-58cc-4372-a567-0e02b2c3d405', 'Mua đôi trắng classic, đi với gì cũng đẹp.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (27, 'f47ac10b-58cc-4372-a567-0e02b2c3d406', 'Converse All Star luôn là lựa chọn an toàn cho phong cách casual.',
        5, '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (27, 'f47ac10b-58cc-4372-a567-0e02b2c3d408', 'Giày đẹp nhưng đế bằng phẳng, đi lâu hơi mỏi so với giày có đệm.',
        4, '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (28, 'f47ac10b-58cc-4372-a567-0e02b2c3d401', 'Dép Nike êm chân, mang quanh nhà hay ra ngoài đều tiện.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (28, 'f47ac10b-58cc-4372-a567-0e02b2c3d404', 'Quai ngang Nike êm ái, phù hợp mang sau khi tập gym xong.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (28, 'f47ac10b-58cc-4372-a567-0e02b2c3d406', 'Dép đẹp nhưng đế hơi trơn khi đi trên sàn ướt.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (28, 'f47ac10b-58cc-4372-a567-0e02b2c3d409', 'Êm chân, thiết kế đơn giản. Giá cao hơn dép thường nhiều.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (29, 'f47ac10b-58cc-4372-a567-0e02b2c3d402', 'Adilette cổ điển, ba sọc quen thuộc. Mang mùa hè siêu mát.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (29, 'f47ac10b-58cc-4372-a567-0e02b2c3d403', 'Sandal ok nhưng quai hơi cứng khi mới mua, cần break in.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (29, 'f47ac10b-58cc-4372-a567-0e02b2c3d407', 'Mang thoải mái, nhưng dễ trượt khi chân ướt.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (29, 'f47ac10b-58cc-4372-a567-0e02b2c3d408', 'Sandal đẹp, đi biển hay đi dạo đều hợp. Logo 3 sọc nổi bật.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (29, 'f47ac10b-58cc-4372-a567-0e02b2c3d410', 'Chất lượng Adidas đúng chuẩn, nhưng giá khá đắt cho 1 đôi sandal.',
        4, '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (30, 'f47ac10b-58cc-4372-a567-0e02b2c3d401', 'Dép xỏ ngón Coolmate giá rẻ mà êm, đi ở nhà rất tiện.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (30, 'f47ac10b-58cc-4372-a567-0e02b2c3d404', 'Dép nhẹ, thoải mái cho mùa hè. Nhưng quai hơi mỏng.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (30, 'f47ac10b-58cc-4372-a567-0e02b2c3d406', 'Dép ok cho giá tiền, mang trong nhà thì ổn.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (30, 'f47ac10b-58cc-4372-a567-0e02b2c3d408', 'Dép mỏng quá, đế mòn nhanh. Chắc chỉ dùng được vài tháng.', 3,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (30, 'f47ac10b-58cc-4372-a567-0e02b2c3d409', 'Giá sale hợp lý nhưng chất lượng cũng chỉ tầm đó thôi.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');


--
-- Data for Name: tbl_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tbl_items
VALUES (2, 1, 59, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (1, 1, 118, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (31, 1, 1231212156, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (1, 2, 200, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (1, 3, 180, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (1, 4, 90, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (1, 5, 40, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (1, 6, 15, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (2, 2, 100, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (2, 3, 80, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (2, 4, 50, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (2, 5, 20, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (3, 1, 45, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (3, 2, 70, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (3, 3, 55, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (3, 4, 30, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (4, 1, 80, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (4, 2, 120, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (4, 3, 100, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (4, 4, 60, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (4, 5, 25, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (5, 2, 50, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (5, 3, 70, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (5, 4, 80, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (5, 5, 40, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (5, 6, 20, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (6, 1, 40, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (6, 2, 90, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (6, 3, 110, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (6, 4, 60, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (6, 5, 20, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (7, 1, 25, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (7, 2, 55, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (7, 3, 70, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (7, 4, 45, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (7, 5, 15, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (8, 1, 30, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (8, 2, 80, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (8, 3, 100, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (8, 4, 70, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (8, 5, 35, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (9, 1, 20, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (9, 2, 40, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (9, 3, 60, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (9, 4, 50, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (9, 5, 15, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (10, 1, 30, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (10, 2, 80, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (10, 3, 110, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (10, 4, 70, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (10, 5, 25, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (11, 1, 20, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (11, 2, 35, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (11, 3, 50, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (11, 4, 40, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (12, 1, 150, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (12, 2, 180, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (12, 3, 120, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (12, 4, 50, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (13, 1, 90, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (13, 2, 100, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (13, 3, 60, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (14, 1, 40, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (14, 2, 65, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (14, 3, 50, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (14, 4, 20, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (15, 1, 35, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (15, 2, 55, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (15, 3, 45, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (15, 4, 20, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (16, 1, 25, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (16, 2, 40, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (16, 3, 35, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (16, 4, 15, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (17, 1, 30, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (17, 2, 45, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (17, 3, 20, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (18, 1, 60, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (18, 2, 90, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (18, 3, 70, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (18, 4, 30, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (19, 1, 100, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (19, 2, 150, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (19, 3, 120, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (19, 4, 60, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (20, 1, 100, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (20, 2, 300, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (20, 3, 150, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (21, 1, 80, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (21, 2, 200, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (21, 3, 120, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (23, 3, 180, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (24, 1, 40, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (24, 2, 80, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (24, 3, 90, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (24, 4, 50, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (24, 5, 20, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (25, 1, 35, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (25, 2, 60, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (25, 3, 70, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (25, 4, 40, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (25, 5, 15, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (26, 1, 50, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (26, 2, 90, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (26, 3, 80, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (26, 4, 45, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (27, 1, 60, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (27, 2, 100, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (27, 3, 110, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (27, 4, 55, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (27, 5, 20, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (28, 1, 80, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (28, 2, 120, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (28, 3, 100, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (28, 4, 60, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (29, 1, 70, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (29, 2, 100, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (29, 3, 90, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (29, 4, 50, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (30, 1, 40, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (30, 2, 70, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (30, 3, 80, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (30, 4, 60, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (22, 3, 149, 'AVAILABLE');


--
-- Data for Name: tbl_notifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tbl_notifications
VALUES (2, 'zMJtzsM6YYA8HsdD', '54a4371a-76a7-4750-a1ad-99652d31f08f', NULL, 'ORDER_CREATED', 'create_order',
        'tạo đơn hàng', '2026-05-18 17:53:47.839682+00', '2026-05-18 17:53:47.839682+00', true, false, false);
INSERT INTO public.tbl_notifications
VALUES (3, 'ml-0-jWdPe_oyA4m', '54a4371a-76a7-4750-a1ad-99652d31f08f', NULL, 'ORDER_CREATED', 'create_order',
        'tạo đơn hàng', '2026-05-18 17:59:53.149427+00', '2026-05-18 17:59:53.149427+00', true, false, false);
INSERT INTO public.tbl_notifications
VALUES (4, 'cEyGR_x1T4LzH93Q', '54a4371a-76a7-4750-a1ad-99652d31f08f', NULL, 'ORDER_CREATED', 'create_order',
        'tạo đơn hàng', '2026-05-18 18:26:34.209885+00', '2026-05-18 18:26:34.209885+00', true, false, false);
INSERT INTO public.tbl_notifications
VALUES (5, 'eWxbbil_YisKPTCn', '54a4371a-76a7-4750-a1ad-99652d31f08f', NULL, 'ORDER_PAID', 'paid_order',
        'thanh toán đơn hàng', '2026-05-18 18:30:26.863923+00', '2026-05-18 18:30:26.863923+00', true, false, false);
INSERT INTO public.tbl_notifications
VALUES (6, '3kYih0A2kV-4Uoad', '54a4371a-76a7-4750-a1ad-99652d31f08f', NULL, 'ORDER_CREATED', 'create_order',
        'tạo đơn hàng', '2026-05-18 22:37:29.525139+00', '2026-05-18 22:37:29.525152+00', true, false, false);
INSERT INTO public.tbl_notifications
VALUES (7, 'S2lq-p02QkM1_pKV', '54a4371a-76a7-4750-a1ad-99652d31f08f', NULL, 'ORDER_PAID', 'paid_order',
        'thanh toán đơn hàng', '2026-05-18 22:42:50.117996+00', '2026-05-18 22:42:50.118005+00', true, false, false);


--
-- Data for Name: tbl_order_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tbl_order_items
VALUES (4, 1, 1, 1, 299000.00, 299000.00, 299000.00);
INSERT INTO public.tbl_order_items
VALUES (5, 1, 1, 1, 299000.00, 299000.00, 299000.00);
INSERT INTO public.tbl_order_items
VALUES (6, 31, 1, 1, 5000.00, 5000.00, 5000.00);
INSERT INTO public.tbl_order_items
VALUES (7, 31, 1, 1, 5000.00, 5000.00, 5000.00);


--
-- Data for Name: tbl_orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tbl_orders
VALUES (4, 'ORD-26826125-BC2A', 'UNPAID', NULL, 299000.00, 0.00, 299000.00, 'string', 0,
        '54a4371a-76a7-4750-a1ad-99652d31f08f', 1, '2026-05-18 17:53:47.410145+00', '2026-05-18 17:53:47.410145+00',
        'ONLINE');
INSERT INTO public.tbl_orders
VALUES (5, 'ORD-27191402-D53A', 'UNPAID', NULL, 299000.00, 0.00, 299000.00, 'string', 0,
        '54a4371a-76a7-4750-a1ad-99652d31f08f', 1, '2026-05-18 17:59:52.710973+00', '2026-05-18 17:59:52.711973+00',
        'ONLINE');
INSERT INTO public.tbl_orders
VALUES (6, 'ORD-28792455-9EDE', 'PAID', NULL, 5000.00, 0.00, 5000.00, 'string', 1,
        '54a4371a-76a7-4750-a1ad-99652d31f08f', 1, '2026-05-18 18:26:33.763903+00', '2026-05-18 18:30:27.007203+00',
        'ONLINE');
INSERT INTO public.tbl_orders
VALUES (7, 'ORD-43847749-B13C', 'PAID', NULL, 5000.00, 0.00, 5000.00, 'string', 1,
        '54a4371a-76a7-4750-a1ad-99652d31f08f', 1, '2026-05-18 22:37:29.036897+00', '2026-05-18 22:42:50.263468+00',
        'ONLINE');


--
-- Data for Name: tbl_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tbl_products
VALUES (31, 't', 'TEST', 'sdfsf', 1, 5000.00, 'ACTIVE', NULL, 1, 1, 0, NULL, NULL, '2026-05-18 18:04:56.212878+00',
        '2026-05-18 18:04:56.212878+00');
INSERT INTO public.tbl_products
VALUES (22, 'Balo thời trang nam', 'BAG-001', 'Balo laptop chống nước ngăn chứa rộng rãi', 730, 890000.00, 'ACTIVE',
        4.5, 12, 1, 0, 'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=400&h=400&fit=crop', NULL,
        '2026-04-23 15:01:54.481038+00', '2026-04-23 15:01:54.481038+00');
INSERT INTO public.tbl_products
VALUES (11, 'Áo khoác bomber nam', 'MJK-003', 'Áo bomber phong cách thời trang đường phố', 280, 790000.00, 'ACTIVE',
        4.3, 7, 7, 0, 'https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg', NULL, '2026-04-23 15:01:54.481038+00',
        '2026-04-23 15:01:54.481038+00');
INSERT INTO public.tbl_products
VALUES (9, 'Áo khoác gió nam nhẹ', 'MJK-001', 'Áo khoác gió siêu nhẹ chống nước nhẹ tiện lợi', 430, 690000.00, 'ACTIVE',
        4.6, 7, 1, 0, 'https://images.unsplash.com/photo-1620799140188-3b2a02fd9a77?w=400&h=400&fit=crop', NULL,
        '2026-04-23 15:01:54.481038+00', '2026-04-23 15:01:54.481038+00');
INSERT INTO public.tbl_products
VALUES (15, 'Đầm suông công sở', 'WDR-001', 'Đầm suông thanh lịch phù hợp môi trường công sở', 520, 680000.00, 'ACTIVE',
        4.6, 9, 8, 0, 'https://images.unsplash.com/flagged/photo-1585052201332-b8c0ce30972f?w=400&h=400&fit=crop', NULL,
        '2026-04-23 15:01:54.481038+00', '2026-04-23 15:01:54.481038+00');
INSERT INTO public.tbl_products
VALUES (26, 'Giày Old Skool', 'SNK-003', 'Giày classic với sọc trắng biểu tượng bên hông', 950, 1890000.00,
        'BESTSELLER', 4.8, 13, 9, 0,
        'https://images.pexels.com/photos/1240892/pexels-photo-1240892.jpeg?auto=compress&cs=tinysrgb&w=400', NULL,
        '2026-04-23 15:01:54.481038+00', '2026-04-23 15:01:54.481038+00');
INSERT INTO public.tbl_products
VALUES (19, 'Quần legging nữ', 'WPN-002', 'Quần legging co giãn 4 chiều tập gym yoga', 950, 350000.00, 'BESTSELLER',
        4.8, 10, 1, 0, 'https://images.unsplash.com/photo-1506629082955-511b1aa562c8?w=400&h=400&fit=crop', NULL,
        '2026-04-23 15:01:54.481038+00', '2026-04-23 15:01:54.481038+00');
INSERT INTO public.tbl_products
VALUES (30, 'Dép xỏ ngón nam', 'SDL-003', 'Dép xỏ ngón nhẹ nhàng tiện lợi cho mùa hè', 600, 190000.00, 'ON_SALE', 4, 14,
        6, 0, 'https://images.unsplash.com/photo-1562183241-b937e95585b6?w=400&h=400&fit=crop', NULL,
        '2026-04-23 15:01:54.481038+00', '2026-04-23 15:01:54.481038+00');
INSERT INTO public.tbl_products
VALUES (21, 'Mũ bucket unisex', 'HAT-002', 'Mũ bucket phong cách đường phố che nắng tốt', 680, 350000.00, 'ACTIVE', 4.3,
        11, 2, 0, 'https://images.unsplash.com/photo-1563319078-0b3ad9b6007a?w=400&h=400&fit=crop', NULL,
        '2026-04-23 15:01:54.481038+00', '2026-04-23 15:01:54.481038+00');
INSERT INTO public.tbl_products
VALUES (3, 'Áo thun nam Trefoil', 'MTS-003', 'Áo thun nam logo Trefoil cổ điển phong cách streetwear', 620, 750000.00,
        'ACTIVE', 4.3, 5, 2, 0, 'https://images.unsplash.com/photo-1626806851009-c98659eb1af0?w=400&h=400&fit=crop',
        NULL, '2026-04-23 15:01:54.481038+00', '2026-04-23 15:01:54.481038+00');
INSERT INTO public.tbl_products
VALUES (17, 'Đầm body ôm sát', 'WDR-003', 'Đầm bodycon tôn dáng quyến rũ cho buổi tiệc', 290, 750000.00, 'ACTIVE', 4.4,
        9, 8, 0, 'https://images.unsplash.com/photo-1572804013309-59a88b7e92f1?w=400&h=400&fit=crop', NULL,
        '2026-04-23 15:01:54.481038+00', '2026-04-23 15:01:54.481038+00');
INSERT INTO public.tbl_products
VALUES (28, 'Dép quai ngang Nike', 'SDL-001', 'Dép quai ngang êm ái cho ngày nghỉ thoải mái', 1800, 790000.00, 'ACTIVE',
        4.5, 14, 1, 0,
        'https://images.pexels.com/photos/267202/pexels-photo-267202.jpeg?auto=compress&cs=tinysrgb&w=400', NULL,
        '2026-04-23 15:01:54.481038+00', '2026-04-23 15:01:54.481038+00');
INSERT INTO public.tbl_products
VALUES (5, 'Áo thun nam oversize graphic', 'MTS-005', 'Áo thun oversize in họa tiết graphic trẻ trung', 310, 350000.00,
        'ON_SALE', 4.2, 5, 7, 0, 'https://fakestoreapi.com/img/71YXzeOuslL._AC_UY879_.jpg', NULL,
        '2026-04-23 15:01:54.481038+00', '2026-04-23 15:01:54.481038+00');
INSERT INTO public.tbl_products
VALUES (29, 'Sandal Adilette', 'SDL-002', 'Sandal quai ngang phong cách thể thao cổ điển', 1300, 690000.00, 'ACTIVE',
        4.4, 14, 2, 0, 'https://images.unsplash.com/photo-1603487742131-4160ec999306?w=400&h=400&fit=crop', NULL,
        '2026-04-23 15:01:54.481038+00', '2026-04-23 15:01:54.481038+00');
INSERT INTO public.tbl_products
VALUES (4, 'Áo thun nam Supima Cotton', 'MTS-004', 'Áo thun Supima Cotton cao cấp mềm mại co giãn tốt', 450, 390000.00,
        'ACTIVE', 4.6, 5, 3, 0, 'https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg', NULL,
        '2026-04-23 15:01:54.481038+00', '2026-04-23 15:01:54.481038+00');
INSERT INTO public.tbl_products
VALUES (10, 'Áo khoác hoodie nam', 'MJK-002', 'Áo hoodie nỉ bông ấm áp có mũ trùm đầu', 890, 550000.00, 'BESTSELLER',
        4.8, 7, 6, 0, 'https://images.unsplash.com/photo-1556821840-3a63f95609a7?w=400&h=400&fit=crop', NULL,
        '2026-04-23 15:01:54.481038+00', '2026-04-23 15:01:54.481038+00');
INSERT INTO public.tbl_products
VALUES (6, 'Quần jeans nam slim fit', 'MJN-001', 'Quần jeans co giãn form slim fit trẻ trung', 980, 590000.00,
        'BESTSELLER', 4.8, 6, 4, 0, 'https://images.unsplash.com/photo-1563902575-bc2309dc76e4?w=400&h=400&fit=crop',
        NULL, '2026-04-23 15:01:54.481038+00', '2026-04-23 15:01:54.481038+00');
INSERT INTO public.tbl_products
VALUES (14, 'Áo thun nữ peplum', 'WTS-003', 'Áo peplum thanh lịch phù hợp đi làm đi chơi', 340, 420000.00, 'ACTIVE',
        4.5, 8, 8, 0, 'https://fakestoreapi.com/img/61pHAEJ4NML._AC_UX679_.jpg', NULL, '2026-04-23 15:01:54.481038+00',
        '2026-04-23 15:01:54.481038+00');
INSERT INTO public.tbl_products
VALUES (13, 'Áo thun nữ crop top', 'WTS-002', 'Áo crop top trẻ trung năng động phối đồ dễ dàng', 670, 280000.00,
        'ACTIVE', 4.4, 8, 4, 0, 'https://fakestoreapi.com/img/51eg55uWmdL._AC_UX679_.jpg', NULL,
        '2026-04-23 15:01:54.481038+00', '2026-04-23 15:01:54.481038+00');
INSERT INTO public.tbl_products
VALUES (2, 'Áo thun nam Dri-FIT', 'MTS-002', 'Áo thun thể thao công nghệ Dri-FIT thoát ẩm nhanh', 870, 890000.00,
        'ACTIVE', 4.5, 5, 1, 0, 'https://images.unsplash.com/photo-1552642986-ccb41e7059e7?w=400&h=400&fit=crop', NULL,
        '2026-04-23 15:01:54.481038+00', '2026-04-23 15:01:54.481038+00');
INSERT INTO public.tbl_products
VALUES (16, 'Đầm maxi hoa nhí', 'WDR-002', 'Đầm maxi họa tiết hoa nhí phong cách vintage', 380, 590000.00, 'ON_SALE',
        4.3, 9, 4, 0, 'https://images.unsplash.com/photo-1595777457583-95e059d581b8?w=400&h=400&fit=crop', NULL,
        '2026-04-23 15:01:54.481038+00', '2026-04-23 15:01:54.481038+00');
INSERT INTO public.tbl_products
VALUES (7, 'Quần jeans nam straight', 'MJN-002', 'Quần jeans ống đứng phong cách cổ điển', 560, 490000.00, 'ACTIVE',
        4.4, 6, 5, 0, 'https://images.unsplash.com/photo-1617114919297-3c8ddb01f599?w=400&h=400&fit=crop', NULL,
        '2026-04-23 15:01:54.481038+00', '2026-04-23 15:01:54.481038+00');
INSERT INTO public.tbl_products
VALUES (12, 'Áo thun nữ cổ tròn basic', 'WTS-001', 'Áo thun nữ cotton mềm mại thoáng mát', 1100, 250000.00,
        'BESTSELLER', 4.8, 8, 5, 0, 'https://fakestoreapi.com/img/71z3kpMAYsL._AC_UY879_.jpg', NULL,
        '2026-04-23 15:01:54.481038+00', '2026-04-23 15:01:54.481038+00');
INSERT INTO public.tbl_products
VALUES (24, 'Giày Air Max 90', 'SNK-001', 'Giày thể thao huyền thoại đệm Air thoải mái', 1100, 3290000.00, 'BESTSELLER',
        4.9, 13, 1, 0,
        'https://images.pexels.com/photos/2048548/pexels-photo-2048548.jpeg?auto=compress&cs=tinysrgb&w=400', NULL,
        '2026-04-23 15:01:54.481038+00', '2026-04-23 15:01:54.481038+00');
INSERT INTO public.tbl_products
VALUES (25, 'Giày Ultraboost', 'SNK-002', 'Giày chạy bộ công nghệ Boost êm ái nhẹ nhàng', 870, 3890000.00, 'ACTIVE',
        4.8, 13, 2, 0,
        'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=400', NULL,
        '2026-04-23 15:01:54.481038+00', '2026-04-23 15:01:54.481038+00');
INSERT INTO public.tbl_products
VALUES (20, 'Nón lưỡi trai logo', 'HAT-001', 'Nón lưỡi trai thêu logo thời trang unisex', 1500, 450000.00, 'BESTSELLER',
        4.6, 11, 1, 0, 'https://images.unsplash.com/photo-1588850561407-ed78c334e67a?w=400&h=400&fit=crop', NULL,
        '2026-04-23 15:01:54.481038+00', '2026-04-23 15:01:54.481038+00');
INSERT INTO public.tbl_products
VALUES (1, 'Áo thun nam cổ tròn basic', 'MTS-001', 'Áo thun cotton 100% thoáng mát, form regular fit', 1250, 299000.00,
        'BESTSELLER', 4.8, 5, 6, 0, 'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=400&h=400&fit=crop',
        NULL, '2026-04-23 15:01:54.481038+00', '2026-04-23 15:01:54.481038+00');
INSERT INTO public.tbl_products
VALUES (18, 'Quần baggy nữ', 'WPN-001', 'Quần baggy ống rộng thoải mái thời trang', 810, 390000.00, 'ACTIVE', 4.5, 10,
        5, 0, 'https://images.unsplash.com/photo-1594633312681-425c7b97ccd1?w=400&h=400&fit=crop', NULL,
        '2026-04-23 15:01:54.481038+00', '2026-04-23 15:01:54.481038+00');
INSERT INTO public.tbl_products
VALUES (27, 'Giày Chuck Taylor', 'SNK-004', 'Giày Converse cổ cao biểu tượng thời trang', 1200, 1590000.00,
        'BESTSELLER', 4.8, 13, 10, 0,
        'https://images.unsplash.com/photo-1601131831144-5d096d7a832c?w=400&h=400&fit=crop', NULL,
        '2026-04-23 15:01:54.481038+00', '2026-04-23 15:01:54.481038+00');
INSERT INTO public.tbl_products
VALUES (23, 'Túi tote nữ canvas', 'BAG-002', 'Túi tote vải canvas phong cách minimalist', 420, 290000.00, 'ACTIVE', 4.4,
        12, 3, 0, 'https://images.unsplash.com/photo-1598532163257-ae3c6b2524b6?w=400&h=400&fit=crop', NULL,
        '2026-04-23 15:01:54.481038+00', '2026-04-23 15:01:54.481038+00');
INSERT INTO public.tbl_products
VALUES (8, 'Quần jeans nam regular', 'MJN-003', 'Quần jeans regular fit thoải mái cho mọi hoạt động', 720, 450000.00,
        'ACTIVE', 4.5, 6, 3, 0, 'https://images.unsplash.com/photo-1542272604-787c3835535d?w=400&h=400&fit=crop', NULL,
        '2026-04-23 15:01:54.481038+00', '2026-04-23 15:01:54.481038+00');


--
-- Data for Name: tbl_promotion_category; Type: TABLE DATA; Schema: public; Owner: postgres
--


--
-- Data for Name: tbl_promotion_product; Type: TABLE DATA; Schema: public; Owner: postgres
--


--
-- Data for Name: tbl_promotions; Type: TABLE DATA; Schema: public; Owner: postgres
--


--
-- Data for Name: tbl_providers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tbl_providers
VALUES (1, 'Nike', 'NIKE', 'Thương hiệu thể thao hàng đầu thế giới', 'contact@nike.com', '0901000001', 'FAMOUS',
        'https://logo.clearbit.com/nike.com', 0, '2026-04-23 15:01:51.588112+00', '2026-04-23 15:01:51.588112+00');
INSERT INTO public.tbl_providers
VALUES (2, 'Adidas', 'ADIDAS', 'Thương hiệu thể thao toàn cầu từ Đức', 'contact@adidas.com', '0901000002', 'FAMOUS',
        'https://logo.clearbit.com/adidas.com', 0, '2026-04-23 15:01:51.588112+00', '2026-04-23 15:01:51.588112+00');
INSERT INTO public.tbl_providers
VALUES (3, 'Uniqlo', 'UNIQLO', 'Thời trang cơ bản chất lượng cao từ Nhật', 'contact@uniqlo.com', '0901000003', 'FAMOUS',
        'https://logo.clearbit.com/uniqlo.com', 0, '2026-04-23 15:01:51.588112+00', '2026-04-23 15:01:51.588112+00');
INSERT INTO public.tbl_providers
VALUES (4, 'Zara', 'ZARA', 'Thời trang nhanh đến từ Tây Ban Nha', 'contact@zara.com', '0901000004', 'FAMOUS',
        'https://logo.clearbit.com/zara.com', 0, '2026-04-23 15:01:51.588112+00', '2026-04-23 15:01:51.588112+00');
INSERT INTO public.tbl_providers
VALUES (5, 'H&M', 'HM', 'Thời trang bình dân từ Thụy Điển', 'contact@hm.com', '0901000005', 'ACTIVE',
        'https://logo.clearbit.com/hm.com', 0, '2026-04-23 15:01:51.588112+00', '2026-04-23 15:01:51.588112+00');
INSERT INTO public.tbl_providers
VALUES (6, 'Coolmate', 'COOL', 'Thương hiệu thời trang nam Việt Nam', 'hello@coolmate.me', '0901000006', 'ACTIVE',
        'https://logo.clearbit.com/coolmate.me', 0, '2026-04-23 15:01:51.588112+00', '2026-04-23 15:01:51.588112+00');
INSERT INTO public.tbl_providers
VALUES (7, 'Routine', 'RTN', 'Thời trang nam thiết kế tối giản', 'contact@routine.vn', '0901000007', 'ACTIVE',
        'https://logo.clearbit.com/routine.vn', 0, '2026-04-23 15:01:51.588112+00', '2026-04-23 15:01:51.588112+00');
INSERT INTO public.tbl_providers
VALUES (8, 'Ivy Moda', 'IVY', 'Thời trang nữ cao cấp Việt Nam', 'contact@ivymoda.com', '0901000008', 'ACTIVE',
        'https://logo.clearbit.com/ivymoda.com', 0, '2026-04-23 15:01:51.588112+00', '2026-04-23 15:01:51.588112+00');
INSERT INTO public.tbl_providers
VALUES (9, 'Vans', 'VANS', 'Giày thời trang đường phố từ Mỹ', 'contact@vans.com', '0901000009', 'ACTIVE',
        'https://logo.clearbit.com/vans.com', 0, '2026-04-23 15:01:51.588112+00', '2026-04-23 15:01:51.588112+00');
INSERT INTO public.tbl_providers
VALUES (10, 'Converse', 'CVS', 'Giày thời trang biểu tượng từ Mỹ', 'contact@converse.com', '0901000010', 'FAMOUS',
        'https://logo.clearbit.com/converse.com', 0, '2026-04-23 15:01:51.588112+00', '2026-04-23 15:01:51.588112+00');


--
-- Data for Name: tbl_recivers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tbl_recivers
VALUES (1, 'string', 'string', 'string', 'string', 'string', 'string', 'string', 'string',
        '54a4371a-76a7-4750-a1ad-99652d31f08f');


--
-- Data for Name: tbl_sizes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tbl_sizes
VALUES (1, 'S', 0.2, 65, '2026-04-23 15:01:53.033068+00', '2026-04-23 15:01:53.033068+00');
INSERT INTO public.tbl_sizes
VALUES (2, 'M', 0.25, 70, '2026-04-23 15:01:53.033068+00', '2026-04-23 15:01:53.033068+00');
INSERT INTO public.tbl_sizes
VALUES (3, 'L', 0.3, 75, '2026-04-23 15:01:53.033068+00', '2026-04-23 15:01:53.033068+00');
INSERT INTO public.tbl_sizes
VALUES (4, 'XL', 0.35, 80, '2026-04-23 15:01:53.033068+00', '2026-04-23 15:01:53.033068+00');
INSERT INTO public.tbl_sizes
VALUES (5, 'XXL', 0.4, 85, '2026-04-23 15:01:53.033068+00', '2026-04-23 15:01:53.033068+00');
INSERT INTO public.tbl_sizes
VALUES (6, 'XXXL', 0.45, 90, '2026-04-23 15:01:53.033068+00', '2026-04-23 15:01:53.033068+00');


--
-- Data for Name: tbl_user_vouchers; Type: TABLE DATA; Schema: public; Owner: postgres
--


--
-- Data for Name: tbl_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tbl_users
VALUES ('f47ac10b-58cc-4372-a567-0e02b2c3d401', 'An', 'Nguyễn Văn', 'https://i.pravatar.cc/150?u=an', 101,
        '2026-04-23 15:02:49.195316+00', '2026-04-23 15:02:49.195316+00');
INSERT INTO public.tbl_users
VALUES ('f47ac10b-58cc-4372-a567-0e02b2c3d402', 'Bình', 'Trần Thị', 'https://i.pravatar.cc/150?u=binh', 102,
        '2026-04-23 15:02:49.195316+00', '2026-04-23 15:02:49.195316+00');
INSERT INTO public.tbl_users
VALUES ('f47ac10b-58cc-4372-a567-0e02b2c3d403', 'Cường', 'Lê Hoàng', 'https://i.pravatar.cc/150?u=cuong', 103,
        '2026-04-23 15:02:49.195316+00', '2026-04-23 15:02:49.195316+00');
INSERT INTO public.tbl_users
VALUES ('f47ac10b-58cc-4372-a567-0e02b2c3d404', 'Dũng', 'Phạm Minh', 'https://i.pravatar.cc/150?u=dung', 104,
        '2026-04-23 15:02:49.195316+00', '2026-04-23 15:02:49.195316+00');
INSERT INTO public.tbl_users
VALUES ('f47ac10b-58cc-4372-a567-0e02b2c3d405', 'Hà', 'Hoàng Thu', 'https://i.pravatar.cc/150?u=ha', 105,
        '2026-04-23 15:02:49.195316+00', '2026-04-23 15:02:49.195316+00');
INSERT INTO public.tbl_users
VALUES ('f47ac10b-58cc-4372-a567-0e02b2c3d406', 'Khoa', 'Võ Đình', 'https://i.pravatar.cc/150?u=khoa', 106,
        '2026-04-23 15:02:49.195316+00', '2026-04-23 15:02:49.195316+00');
INSERT INTO public.tbl_users
VALUES ('f47ac10b-58cc-4372-a567-0e02b2c3d407', 'Linh', 'Đặng Ngọc', 'https://i.pravatar.cc/150?u=linh', 107,
        '2026-04-23 15:02:49.195316+00', '2026-04-23 15:02:49.195316+00');
INSERT INTO public.tbl_users
VALUES ('f47ac10b-58cc-4372-a567-0e02b2c3d408', 'Mai', 'Bùi Thanh', 'https://i.pravatar.cc/150?u=mai', 108,
        '2026-04-23 15:02:49.195316+00', '2026-04-23 15:02:49.195316+00');
INSERT INTO public.tbl_users
VALUES ('f47ac10b-58cc-4372-a567-0e02b2c3d409', 'Nam', 'Ngô Quốc', 'https://i.pravatar.cc/150?u=nam', 109,
        '2026-04-23 15:02:49.195316+00', '2026-04-23 15:02:49.195316+00');
INSERT INTO public.tbl_users
VALUES ('f47ac10b-58cc-4372-a567-0e02b2c3d410', 'Phương', 'Dương Thùy', 'https://i.pravatar.cc/150?u=phuong', 110,
        '2026-04-23 15:02:49.195316+00', '2026-04-23 15:02:49.195316+00');
INSERT INTO public.tbl_users
VALUES ('d54d389a-87fb-410c-a8b5-1b7d8c98b848', NULL, NULL, NULL, 2, '2026-05-18 17:18:19.587691+00',
        '2026-05-18 17:18:19.587691+00');
INSERT INTO public.tbl_users
VALUES ('54a4371a-76a7-4750-a1ad-99652d31f08f', NULL, NULL, NULL, 113, '2026-05-18 17:39:49.583034+00',
        '2026-05-18 17:39:49.583034+00');
INSERT INTO public.tbl_users
VALUES ('aece85b7-c2c9-4415-a6b4-55f6d1afad47', NULL, NULL, NULL, 6, '2026-05-19 11:09:55.178093+00',
        '2026-05-19 11:09:55.178104+00');


--
-- Data for Name: tbl_vouchers; Type: TABLE DATA; Schema: public; Owner: postgres
--


--
-- Name: tbl_accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tbl_accounts_id_seq', 119, true);


--
-- Name: tbl_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tbl_categories_id_seq', 14, true);


--
-- Name: tbl_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tbl_notifications_id_seq', 7, true);


--
-- Name: tbl_orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tbl_orders_id_seq', 7, true);


--
-- Name: tbl_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tbl_products_id_seq', 31, true);


--
-- Name: tbl_promotions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tbl_promotions_id_seq', 1, false);


--
-- Name: tbl_providers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tbl_providers_id_seq', 10, true);


--
-- Name: tbl_recivers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tbl_recivers_id_seq', 1, true);


--
-- Name: tbl_sizes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tbl_sizes_id_seq', 6, true);


--
-- Name: tbl_vouchers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tbl_vouchers_id_seq', 1, false);


--
-- Name: tbl_accounts tbl_accounts_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_accounts
    ADD CONSTRAINT tbl_accounts_email_key UNIQUE (email);


--
-- Name: tbl_accounts tbl_accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_accounts
    ADD CONSTRAINT tbl_accounts_pkey PRIMARY KEY (id);


--
-- Name: tbl_accounts tbl_accounts_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_accounts
    ADD CONSTRAINT tbl_accounts_username_key UNIQUE (username);


--
-- Name: tbl_cart_items tbl_cart_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_cart_items
    ADD CONSTRAINT tbl_cart_items_pkey PRIMARY KEY (user_id, product_id, size_id);


--
-- Name: tbl_categories tbl_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_categories
    ADD CONSTRAINT tbl_categories_pkey PRIMARY KEY (id);


--
-- Name: tbl_comments tbl_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_comments
    ADD CONSTRAINT tbl_comments_pkey PRIMARY KEY (product_id, user_id);


--
-- Name: tbl_items tbl_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_items
    ADD CONSTRAINT tbl_items_pkey PRIMARY KEY (product_id, size_id);


--
-- Name: tbl_notifications tbl_notifications_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_notifications
    ADD CONSTRAINT tbl_notifications_code_key UNIQUE (code);


--
-- Name: tbl_notifications tbl_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_notifications
    ADD CONSTRAINT tbl_notifications_pkey PRIMARY KEY (id);


--
-- Name: tbl_order_items tbl_order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_order_items
    ADD CONSTRAINT tbl_order_items_pkey PRIMARY KEY (order_id, product_id, size_id);


--
-- Name: tbl_orders tbl_orders_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_orders
    ADD CONSTRAINT tbl_orders_code_key UNIQUE (code);


--
-- Name: tbl_orders tbl_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_orders
    ADD CONSTRAINT tbl_orders_pkey PRIMARY KEY (id);


--
-- Name: tbl_products tbl_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_products
    ADD CONSTRAINT tbl_products_pkey PRIMARY KEY (id);


--
-- Name: tbl_promotion_category tbl_promotion_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_promotion_category
    ADD CONSTRAINT tbl_promotion_category_pkey PRIMARY KEY (category_id, promotion_id);


--
-- Name: tbl_promotion_product tbl_promotion_product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_promotion_product
    ADD CONSTRAINT tbl_promotion_product_pkey PRIMARY KEY (product_id, promotion_id);


--
-- Name: tbl_promotions tbl_promotions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_promotions
    ADD CONSTRAINT tbl_promotions_pkey PRIMARY KEY (id);


--
-- Name: tbl_providers tbl_providers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_providers
    ADD CONSTRAINT tbl_providers_pkey PRIMARY KEY (id);


--
-- Name: tbl_recivers tbl_recivers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_recivers
    ADD CONSTRAINT tbl_recivers_pkey PRIMARY KEY (id);


--
-- Name: tbl_sizes tbl_sizes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_sizes
    ADD CONSTRAINT tbl_sizes_pkey PRIMARY KEY (id);


--
-- Name: tbl_user_vouchers tbl_user_vouchers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_user_vouchers
    ADD CONSTRAINT tbl_user_vouchers_pkey PRIMARY KEY (voucher_id, user_id);


--
-- Name: tbl_users tbl_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_users
    ADD CONSTRAINT tbl_users_pkey PRIMARY KEY (id);


--
-- Name: tbl_vouchers tbl_vouchers_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_vouchers
    ADD CONSTRAINT tbl_vouchers_code_key UNIQUE (code);


--
-- Name: tbl_vouchers tbl_vouchers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_vouchers
    ADD CONSTRAINT tbl_vouchers_pkey PRIMARY KEY (id);


--
-- Name: tbl_user_vouchers uk_user_voucher; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_user_vouchers
    ADD CONSTRAINT uk_user_voucher UNIQUE (user_id, voucher_id);


--
-- Name: tbl_accounts ukoshwg9cg1y475p5ppsip091ed; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_accounts
    ADD CONSTRAINT ukoshwg9cg1y475p5ppsip091ed UNIQUE (email);


--
-- Name: tbl_cart_items fk_cart_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_cart_items
    ADD CONSTRAINT fk_cart_product FOREIGN KEY (product_id) REFERENCES public.tbl_products (id);


--
-- Name: tbl_cart_items fk_cart_size; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_cart_items
    ADD CONSTRAINT fk_cart_size FOREIGN KEY (size_id) REFERENCES public.tbl_sizes (id);


--
-- Name: tbl_cart_items fk_cart_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_cart_items
    ADD CONSTRAINT fk_cart_user FOREIGN KEY (user_id) REFERENCES public.tbl_users (id);


--
-- Name: tbl_categories fk_category_parent; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_categories
    ADD CONSTRAINT fk_category_parent FOREIGN KEY (parent_id) REFERENCES public.tbl_categories (id) ON DELETE SET NULL;


--
-- Name: tbl_comments fk_comment_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_comments
    ADD CONSTRAINT fk_comment_product FOREIGN KEY (product_id) REFERENCES public.tbl_products (id);


--
-- Name: tbl_items fk_item_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_items
    ADD CONSTRAINT fk_item_product FOREIGN KEY (product_id) REFERENCES public.tbl_products (id) ON DELETE CASCADE;


--
-- Name: tbl_items fk_item_size; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_items
    ADD CONSTRAINT fk_item_size FOREIGN KEY (size_id) REFERENCES public.tbl_sizes (id) ON DELETE CASCADE;


--
-- Name: tbl_order_items fk_oi_order; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_order_items
    ADD CONSTRAINT fk_oi_order FOREIGN KEY (order_id) REFERENCES public.tbl_orders (id);


--
-- Name: tbl_promotion_category fk_pc_promotion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_promotion_category
    ADD CONSTRAINT fk_pc_promotion FOREIGN KEY (promotion_id) REFERENCES public.tbl_promotions (id) ON DELETE CASCADE;


--
-- Name: tbl_promotion_product fk_pp_promotion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_promotion_product
    ADD CONSTRAINT fk_pp_promotion FOREIGN KEY (promotion_id) REFERENCES public.tbl_promotions (id);


--
-- Name: tbl_products fk_product_category; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_products
    ADD CONSTRAINT fk_product_category FOREIGN KEY (category_id) REFERENCES public.tbl_categories (id);


--
-- Name: tbl_products fk_product_provider; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_products
    ADD CONSTRAINT fk_product_provider FOREIGN KEY (provider_id) REFERENCES public.tbl_providers (id);


--
-- Name: tbl_recivers fk_receiver_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_recivers
    ADD CONSTRAINT fk_receiver_user FOREIGN KEY (user_id) REFERENCES public.tbl_users (id);


--
-- Name: tbl_user_vouchers fk_uv_voucher; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_user_vouchers
    ADD CONSTRAINT fk_uv_voucher FOREIGN KEY (voucher_id) REFERENCES public.tbl_vouchers (id);


--
-- PostgreSQL database dump complete
--

\unrestrict 8k2FNQYmPxs8IRgxQUwMpyKrW6Vbc22VcESW7u85NNtXqsIrsgpr2WfNQTzVCib

--
-- PostgreSQL database dump
--

create database dungcony

\restrict 8k2FNQYmPxs8IRgxQUwMpyKrW6Vbc22VcESW7u85NNtXqsIrsgpr2WfNQTzVCib

-- Dumped from database version 17.6
-- Dumped by pg_dump version 18.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE IF EXISTS ONLY public.tbl_user_vouchers
    DROP CONSTRAINT IF EXISTS fk_uv_voucher;
ALTER TABLE IF EXISTS ONLY public.tbl_recivers
    DROP CONSTRAINT IF EXISTS fk_receiver_user;
ALTER TABLE IF EXISTS ONLY public.tbl_products
    DROP CONSTRAINT IF EXISTS fk_product_provider;
ALTER TABLE IF EXISTS ONLY public.tbl_products
    DROP CONSTRAINT IF EXISTS fk_product_category;
ALTER TABLE IF EXISTS ONLY public.tbl_promotion_product
    DROP CONSTRAINT IF EXISTS fk_pp_promotion;
ALTER TABLE IF EXISTS ONLY public.tbl_promotion_category
    DROP CONSTRAINT IF EXISTS fk_pc_promotion;
ALTER TABLE IF EXISTS ONLY public.tbl_order_items
    DROP CONSTRAINT IF EXISTS fk_oi_order;
ALTER TABLE IF EXISTS ONLY public.tbl_items
    DROP CONSTRAINT IF EXISTS fk_item_size;
ALTER TABLE IF EXISTS ONLY public.tbl_items
    DROP CONSTRAINT IF EXISTS fk_item_product;
ALTER TABLE IF EXISTS ONLY public.tbl_comments
    DROP CONSTRAINT IF EXISTS fk_comment_product;
ALTER TABLE IF EXISTS ONLY public.tbl_categories
    DROP CONSTRAINT IF EXISTS fk_category_parent;
ALTER TABLE IF EXISTS ONLY public.tbl_cart_items
    DROP CONSTRAINT IF EXISTS fk_cart_user;
ALTER TABLE IF EXISTS ONLY public.tbl_cart_items
    DROP CONSTRAINT IF EXISTS fk_cart_size;
ALTER TABLE IF EXISTS ONLY public.tbl_cart_items
    DROP CONSTRAINT IF EXISTS fk_cart_product;
ALTER TABLE IF EXISTS ONLY public.tbl_accounts
    DROP CONSTRAINT IF EXISTS ukoshwg9cg1y475p5ppsip091ed;
ALTER TABLE IF EXISTS ONLY public.tbl_user_vouchers
    DROP CONSTRAINT IF EXISTS uk_user_voucher;
ALTER TABLE IF EXISTS ONLY public.tbl_vouchers
    DROP CONSTRAINT IF EXISTS tbl_vouchers_pkey;
ALTER TABLE IF EXISTS ONLY public.tbl_vouchers
    DROP CONSTRAINT IF EXISTS tbl_vouchers_code_key;
ALTER TABLE IF EXISTS ONLY public.tbl_users
    DROP CONSTRAINT IF EXISTS tbl_users_pkey;
ALTER TABLE IF EXISTS ONLY public.tbl_user_vouchers
    DROP CONSTRAINT IF EXISTS tbl_user_vouchers_pkey;
ALTER TABLE IF EXISTS ONLY public.tbl_sizes
    DROP CONSTRAINT IF EXISTS tbl_sizes_pkey;
ALTER TABLE IF EXISTS ONLY public.tbl_recivers
    DROP CONSTRAINT IF EXISTS tbl_recivers_pkey;
ALTER TABLE IF EXISTS ONLY public.tbl_providers
    DROP CONSTRAINT IF EXISTS tbl_providers_pkey;
ALTER TABLE IF EXISTS ONLY public.tbl_promotions
    DROP CONSTRAINT IF EXISTS tbl_promotions_pkey;
ALTER TABLE IF EXISTS ONLY public.tbl_promotion_product
    DROP CONSTRAINT IF EXISTS tbl_promotion_product_pkey;
ALTER TABLE IF EXISTS ONLY public.tbl_promotion_category
    DROP CONSTRAINT IF EXISTS tbl_promotion_category_pkey;
ALTER TABLE IF EXISTS ONLY public.tbl_products
    DROP CONSTRAINT IF EXISTS tbl_products_pkey;
ALTER TABLE IF EXISTS ONLY public.tbl_orders
    DROP CONSTRAINT IF EXISTS tbl_orders_pkey;
ALTER TABLE IF EXISTS ONLY public.tbl_orders
    DROP CONSTRAINT IF EXISTS tbl_orders_code_key;
ALTER TABLE IF EXISTS ONLY public.tbl_order_items
    DROP CONSTRAINT IF EXISTS tbl_order_items_pkey;
ALTER TABLE IF EXISTS ONLY public.tbl_notifications
    DROP CONSTRAINT IF EXISTS tbl_notifications_pkey;
ALTER TABLE IF EXISTS ONLY public.tbl_notifications
    DROP CONSTRAINT IF EXISTS tbl_notifications_code_key;
ALTER TABLE IF EXISTS ONLY public.tbl_items
    DROP CONSTRAINT IF EXISTS tbl_items_pkey;
ALTER TABLE IF EXISTS ONLY public.tbl_comments
    DROP CONSTRAINT IF EXISTS tbl_comments_pkey;
ALTER TABLE IF EXISTS ONLY public.tbl_categories
    DROP CONSTRAINT IF EXISTS tbl_categories_pkey;
ALTER TABLE IF EXISTS ONLY public.tbl_cart_items
    DROP CONSTRAINT IF EXISTS tbl_cart_items_pkey;
ALTER TABLE IF EXISTS ONLY public.tbl_accounts
    DROP CONSTRAINT IF EXISTS tbl_accounts_username_key;
ALTER TABLE IF EXISTS ONLY public.tbl_accounts
    DROP CONSTRAINT IF EXISTS tbl_accounts_pkey;
ALTER TABLE IF EXISTS ONLY public.tbl_accounts
    DROP CONSTRAINT IF EXISTS tbl_accounts_email_key;
ALTER TABLE IF EXISTS public.tbl_vouchers
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.tbl_sizes
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.tbl_recivers
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.tbl_providers
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.tbl_promotions
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.tbl_products
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.tbl_orders
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.tbl_notifications
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.tbl_categories
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.tbl_accounts
    ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE IF EXISTS public.tbl_vouchers_id_seq;
DROP TABLE IF EXISTS public.tbl_vouchers;
DROP TABLE IF EXISTS public.tbl_users;
DROP TABLE IF EXISTS public.tbl_user_vouchers;
DROP SEQUENCE IF EXISTS public.tbl_sizes_id_seq;
DROP TABLE IF EXISTS public.tbl_sizes;
DROP SEQUENCE IF EXISTS public.tbl_recivers_id_seq;
DROP TABLE IF EXISTS public.tbl_recivers;
DROP SEQUENCE IF EXISTS public.tbl_providers_id_seq;
DROP TABLE IF EXISTS public.tbl_providers;
DROP SEQUENCE IF EXISTS public.tbl_promotions_id_seq;
DROP TABLE IF EXISTS public.tbl_promotions;
DROP TABLE IF EXISTS public.tbl_promotion_product;
DROP TABLE IF EXISTS public.tbl_promotion_category;
DROP SEQUENCE IF EXISTS public.tbl_products_id_seq;
DROP TABLE IF EXISTS public.tbl_products;
DROP SEQUENCE IF EXISTS public.tbl_orders_id_seq;
DROP TABLE IF EXISTS public.tbl_orders;
DROP TABLE IF EXISTS public.tbl_order_items;
DROP SEQUENCE IF EXISTS public.tbl_notifications_id_seq;
DROP TABLE IF EXISTS public.tbl_notifications;
DROP TABLE IF EXISTS public.tbl_items;
DROP TABLE IF EXISTS public.tbl_comments;
DROP SEQUENCE IF EXISTS public.tbl_categories_id_seq;
DROP TABLE IF EXISTS public.tbl_categories;
DROP TABLE IF EXISTS public.tbl_cart_items;
DROP SEQUENCE IF EXISTS public.tbl_accounts_id_seq;
DROP TABLE IF EXISTS public.tbl_accounts;
DROP SCHEMA IF EXISTS public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: tbl_accounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_accounts
(
    id         integer                                                        NOT NULL,
    username   character varying(50)                                          NOT NULL,
    password   character varying(255)                                         NOT NULL,
    role       character varying(10)    DEFAULT 'CUSTOMER'::character varying NOT NULL,
    email      character varying(100)                                         NOT NULL,
    verify     boolean                  DEFAULT false                         NOT NULL,
    status     character varying(10)    DEFAULT 'ACTIVE'::character varying   NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_accounts_role CHECK (((role)::text = ANY
                                         ((ARRAY ['CUSTOMER'::character varying, 'ADMIN'::character varying, 'EMPLOYEE'::character varying])::text[]))),
    CONSTRAINT chk_accounts_status CHECK (((status)::text = ANY
                                           ((ARRAY ['ACTIVE'::character varying, 'INACTIVE'::character varying, 'BANNED'::character varying])::text[])))
);


ALTER TABLE public.tbl_accounts
    OWNER TO postgres;

--
-- Name: tbl_accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tbl_accounts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tbl_accounts_id_seq OWNER TO postgres;

--
-- Name: tbl_accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tbl_accounts_id_seq OWNED BY public.tbl_accounts.id;


--
-- Name: tbl_cart_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_cart_items
(
    user_id    uuid    NOT NULL,
    product_id integer NOT NULL,
    size_id    integer NOT NULL,
    quantity   integer NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.tbl_cart_items
    OWNER TO postgres;

--
-- Name: tbl_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_categories
(
    id          integer                               NOT NULL,
    name        character varying(50)                 NOT NULL,
    code        character varying(10)                 NOT NULL,
    img_url     character varying(255),
    description character varying(50),
    status      character varying(20)    DEFAULT 'ACTIVE'::character varying,
    parent_id   integer,
    is_leaf     boolean                  DEFAULT true NOT NULL,
    level       integer                  DEFAULT 0    NOT NULL,
    path        character varying(255),
    version     bigint                   DEFAULT 0    NOT NULL,
    created_at  timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at  timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_category_status CHECK (((status)::text = ANY
                                           ((ARRAY ['ACTIVE'::character varying, 'HIDDEN'::character varying])::text[])))
);


ALTER TABLE public.tbl_categories
    OWNER TO postgres;

--
-- Name: tbl_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tbl_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tbl_categories_id_seq OWNER TO postgres;

--
-- Name: tbl_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tbl_categories_id_seq OWNED BY public.tbl_categories.id;


--
-- Name: tbl_comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_comments
(
    product_id integer NOT NULL,
    user_id    uuid    NOT NULL,
    content    text    NOT NULL,
    rating     real,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.tbl_comments
    OWNER TO postgres;

--
-- Name: tbl_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_items
(
    product_id integer           NOT NULL,
    size_id    integer           NOT NULL,
    quantity   integer DEFAULT 0 NOT NULL,
    status     character varying(255),
    CONSTRAINT chk_item_status CHECK (((status)::text = ANY
                                       ((ARRAY ['AVAILABLE'::character varying, 'OUT_OF_STOCK'::character varying, 'DISCONTINUED'::character varying])::text[])))
);


ALTER TABLE public.tbl_items
    OWNER TO postgres;

--
-- Name: tbl_notifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_notifications
(
    id          integer               NOT NULL,
    code        character varying(30),
    sender_id   uuid,
    receiver_id uuid,
    type        character varying(20) NOT NULL,
    title       character varying(100),
    message     text,
    created_at  timestamp(6) with time zone,
    updated_at  timestamp(6) with time zone,
    for_admin   boolean DEFAULT true  NOT NULL,
    is_delete   boolean DEFAULT false NOT NULL,
    readed      boolean DEFAULT false NOT NULL
);


ALTER TABLE public.tbl_notifications
    OWNER TO postgres;

--
-- Name: tbl_notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tbl_notifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tbl_notifications_id_seq OWNER TO postgres;

--
-- Name: tbl_notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tbl_notifications_id_seq OWNED BY public.tbl_notifications.id;


--
-- Name: tbl_order_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_order_items
(
    order_id       integer        NOT NULL,
    product_id     integer        NOT NULL,
    size_id        integer        NOT NULL,
    quantity       integer        NOT NULL,
    total_price    numeric(38, 2) NOT NULL,
    final_price    numeric(38, 2) NOT NULL,
    original_price numeric(38, 2) NOT NULL
);


ALTER TABLE public.tbl_order_items
    OWNER TO postgres;

--
-- Name: tbl_orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_orders
(
    id               integer                                                       NOT NULL,
    code             character varying(20)                                         NOT NULL,
    status           character varying(20)    DEFAULT 'PENDING'::character varying NOT NULL,
    voucher_code     character varying(30),
    total_price      numeric(38, 2)                                                NOT NULL,
    voucher_discount numeric(38, 2),
    final_price      numeric(38, 2)                                                NOT NULL,
    note             character varying(500),
    version          bigint                   DEFAULT 0                            NOT NULL,
    user_id          uuid                                                          NOT NULL,
    receiver_id      integer                                                       NOT NULL,
    created_at       timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at       timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    payment_type     character varying(255),
    CONSTRAINT chk_order_status CHECK (((status)::text = ANY
                                        ((ARRAY ['UNPAID'::character varying, 'PAID'::character varying, 'PENDING'::character varying, 'CONFIRMED'::character varying, 'SHIPPING'::character varying, 'DELIVERED'::character varying, 'COMPLETED'::character varying, 'CANCELLED'::character varying, 'RETURNED'::character varying])::text[]))),
    CONSTRAINT tbl_orders_payment_type_check CHECK (((payment_type)::text = ANY
                                                     ((ARRAY ['PAYMENT_UPON_DELIVER'::character varying, 'ONLINE'::character varying])::text[])))
);


ALTER TABLE public.tbl_orders
    OWNER TO postgres;

--
-- Name: tbl_orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tbl_orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tbl_orders_id_seq OWNER TO postgres;

--
-- Name: tbl_orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tbl_orders_id_seq OWNED BY public.tbl_orders.id;


--
-- Name: tbl_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_products
(
    id            integer                                                      NOT NULL,
    name          character varying(50)                                        NOT NULL,
    code          character varying(30)                                        NOT NULL,
    description   character varying(255),
    quantity_sold integer                  DEFAULT 0,
    price         numeric(38, 2)           DEFAULT 0,
    status        character varying(20)    DEFAULT 'ACTIVE'::character varying NOT NULL,
    rated         real,
    category_id   integer,
    provider_id   integer,
    version       bigint                   DEFAULT 0                           NOT NULL,
    img           character varying(255),
    video         character varying(255),
    created_at    timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at    timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_product_status CHECK (((status)::text = ANY
                                          ((ARRAY ['ACTIVE'::character varying, 'ON_SALE'::character varying, 'OUT_OF_STOCK'::character varying, 'BESTSELLER'::character varying, 'DELETED'::character varying])::text[])))
);


ALTER TABLE public.tbl_products
    OWNER TO postgres;

--
-- Name: tbl_products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tbl_products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tbl_products_id_seq OWNER TO postgres;

--
-- Name: tbl_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tbl_products_id_seq OWNED BY public.tbl_products.id;


--
-- Name: tbl_promotion_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_promotion_category
(
    category_id  integer NOT NULL,
    promotion_id integer NOT NULL
);


ALTER TABLE public.tbl_promotion_category
    OWNER TO postgres;

--
-- Name: tbl_promotion_product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_promotion_product
(
    product_id   integer NOT NULL,
    promotion_id integer NOT NULL
);


ALTER TABLE public.tbl_promotion_product
    OWNER TO postgres;

--
-- Name: tbl_promotions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_promotions
(
    id       integer                                                      NOT NULL,
    value    integer                                                      NOT NULL,
    start_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    end_at   timestamp with time zone,
    priority integer                  DEFAULT 1,
    status   character varying(20)    DEFAULT 'SCHEDULED'::character varying,
    scope    character varying(20)    DEFAULT 'GLOBAL'::character varying NOT NULL,
    version  bigint                   DEFAULT 0                           NOT NULL,
    CONSTRAINT chk_promo_scope CHECK (((scope)::text = ANY
                                       ((ARRAY ['GLOBAL'::character varying, 'PRODUCT'::character varying, 'CATEGORY'::character varying, 'PROVIDER'::character varying])::text[]))),
    CONSTRAINT chk_promo_status CHECK (((status)::text = ANY
                                        ((ARRAY ['SCHEDULED'::character varying, 'ACTIVE'::character varying, 'ENDED'::character varying, 'DELETED'::character varying])::text[])))
);


ALTER TABLE public.tbl_promotions
    OWNER TO postgres;

--
-- Name: tbl_promotions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tbl_promotions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tbl_promotions_id_seq OWNER TO postgres;

--
-- Name: tbl_promotions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tbl_promotions_id_seq OWNED BY public.tbl_promotions.id;


--
-- Name: tbl_providers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_providers
(
    id          integer                            NOT NULL,
    name        character varying(50)              NOT NULL,
    code        character varying(10)              NOT NULL,
    description character varying(255),
    email       character varying(100),
    phone       character varying(15),
    status      character varying(20)    DEFAULT 'ACTIVE'::character varying,
    logo        character varying(255),
    version     bigint                   DEFAULT 0 NOT NULL,
    created_at  timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at  timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_provider_status CHECK (((status)::text = ANY
                                           ((ARRAY ['ACTIVE'::character varying, 'INACTIVE'::character varying, 'FAMOUS'::character varying])::text[])))
);


ALTER TABLE public.tbl_providers
    OWNER TO postgres;

--
-- Name: tbl_providers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tbl_providers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tbl_providers_id_seq OWNER TO postgres;

--
-- Name: tbl_providers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tbl_providers_id_seq OWNED BY public.tbl_providers.id;


--
-- Name: tbl_recivers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_recivers
(
    id       integer                NOT NULL,
    f_name   character varying(100),
    l_name   character varying(100),
    phone    character varying(10)  NOT NULL,
    country  character varying(20)  NOT NULL,
    province character varying(20)  NOT NULL,
    district character varying(20)  NOT NULL,
    street   character varying(100) NOT NULL,
    detail   character varying(255),
    user_id  uuid                   NOT NULL
);


ALTER TABLE public.tbl_recivers
    OWNER TO postgres;

--
-- Name: tbl_recivers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tbl_recivers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tbl_recivers_id_seq OWNER TO postgres;

--
-- Name: tbl_recivers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tbl_recivers_id_seq OWNED BY public.tbl_recivers.id;


--
-- Name: tbl_sizes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_sizes
(
    id         integer NOT NULL,
    size       character varying(255),
    weight     double precision,
    height     double precision,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.tbl_sizes
    OWNER TO postgres;

--
-- Name: tbl_sizes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tbl_sizes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tbl_sizes_id_seq OWNER TO postgres;

--
-- Name: tbl_sizes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tbl_sizes_id_seq OWNED BY public.tbl_sizes.id;


--
-- Name: tbl_user_vouchers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_user_vouchers
(
    voucher_id      integer                                                      NOT NULL,
    user_id         uuid                                                         NOT NULL,
    status          character varying(20) DEFAULT 'AVAILABLE'::character varying NOT NULL,
    end_at          timestamp with time zone,
    min_price_apply numeric(38, 2),
    version         bigint                DEFAULT 0                              NOT NULL,
    CONSTRAINT chk_uv_status CHECK (((status)::text = ANY
                                     ((ARRAY ['AVAILABLE'::character varying, 'USED'::character varying, 'EXPIRED'::character varying])::text[])))
);


ALTER TABLE public.tbl_user_vouchers
    OWNER TO postgres;

--
-- Name: tbl_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_users
(
    id         uuid                     DEFAULT gen_random_uuid() NOT NULL,
    f_name     character varying(255),
    l_name     character varying(255),
    avatar     character varying(255),
    acc_id     integer,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.tbl_users
    OWNER TO postgres;

--
-- Name: tbl_vouchers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_vouchers
(
    id               integer                                                      NOT NULL,
    code             character varying(30)                                        NOT NULL,
    status           character varying(20)    DEFAULT 'ACTIVE'::character varying NOT NULL,
    value            integer                                                      NOT NULL,
    min_order_amount numeric(38, 2)           DEFAULT 0                           NOT NULL,
    start_at         timestamp with time zone,
    end_at           timestamp with time zone,
    version          bigint                   DEFAULT 0                           NOT NULL,
    created_at       timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at       timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    discount_type    character varying(20)                                        NOT NULL,
    voucher_type     character varying(20)                                        NOT NULL,
    CONSTRAINT chk_voucher_discount_type CHECK ((("discount_type")::text = ANY
                                                 ((ARRAY ['PERCENT'::character varying, 'FIXED'::character varying])::text[]))),
    CONSTRAINT chk_voucher_status CHECK (((status)::text = ANY
                                          ((ARRAY ['ACTIVE'::character varying, 'INACTIVE'::character varying, 'COMMING_SOON'::character varying])::text[]))),
    CONSTRAINT chk_voucher_type CHECK ((("voucher_type")::text = ANY
                                        ((ARRAY ['NEWBIE'::character varying, 'GLOBAL'::character varying])::text[]))),
    CONSTRAINT tbl_vouchers_discount_type_check CHECK (((discount_type)::text = ANY
                                                        ((ARRAY ['PERCENT'::character varying, 'FIXED'::character varying])::text[]))),
    CONSTRAINT tbl_vouchers_voucher_type_check CHECK (((voucher_type)::text = ANY
                                                       ((ARRAY ['NEWBIE'::character varying, 'GLOBAL'::character varying])::text[])))
);


ALTER TABLE public.tbl_vouchers
    OWNER TO postgres;

--
-- Name: tbl_vouchers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tbl_vouchers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tbl_vouchers_id_seq OWNER TO postgres;

--
-- Name: tbl_vouchers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tbl_vouchers_id_seq OWNED BY public.tbl_vouchers.id;


--
-- Name: tbl_accounts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_accounts
    ALTER COLUMN id SET DEFAULT nextval('public.tbl_accounts_id_seq'::regclass);


--
-- Name: tbl_categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_categories
    ALTER COLUMN id SET DEFAULT nextval('public.tbl_categories_id_seq'::regclass);


--
-- Name: tbl_notifications id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_notifications
    ALTER COLUMN id SET DEFAULT nextval('public.tbl_notifications_id_seq'::regclass);


--
-- Name: tbl_orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_orders
    ALTER COLUMN id SET DEFAULT nextval('public.tbl_orders_id_seq'::regclass);


--
-- Name: tbl_products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_products
    ALTER COLUMN id SET DEFAULT nextval('public.tbl_products_id_seq'::regclass);


--
-- Name: tbl_promotions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_promotions
    ALTER COLUMN id SET DEFAULT nextval('public.tbl_promotions_id_seq'::regclass);


--
-- Name: tbl_providers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_providers
    ALTER COLUMN id SET DEFAULT nextval('public.tbl_providers_id_seq'::regclass);


--
-- Name: tbl_recivers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_recivers
    ALTER COLUMN id SET DEFAULT nextval('public.tbl_recivers_id_seq'::regclass);


--
-- Name: tbl_sizes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_sizes
    ALTER COLUMN id SET DEFAULT nextval('public.tbl_sizes_id_seq'::regclass);


--
-- Name: tbl_vouchers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_vouchers
    ALTER COLUMN id SET DEFAULT nextval('public.tbl_vouchers_id_seq'::regclass);


--
-- Data for Name: tbl_accounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tbl_accounts
VALUES (6, 'admin', '$2a$10$so6pABz4rH8ssDUpSSXhU.Z72I8PF/i2qjwF6iAI5PQaFCJfdI6di', 'ADMIN', 'hi@gmail.com', true,
        'ACTIVE', '2026-04-23 15:01:06.630156+00', '2026-04-23 15:01:06.630156+00');
INSERT INTO public.tbl_accounts
VALUES (101, 'nguyenvanan', '$2a$10$dXJ3SW6G7P50lGmMQgel6uVktDQd6B6TlQ8VjYDd3h3gI0rDVxMT.', 'CUSTOMER',
        'an.nguyen@gmail.com', true, 'ACTIVE', '2026-04-23 15:02:47.756965+00', '2026-04-23 15:02:47.756965+00');
INSERT INTO public.tbl_accounts
VALUES (102, 'tranbinhchi', '$2a$10$dXJ3SW6G7P50lGmMQgel6uVktDQd6B6TlQ8VjYDd3h3gI0rDVxMT.', 'CUSTOMER',
        'binh.tran@gmail.com', true, 'ACTIVE', '2026-04-23 15:02:47.756965+00', '2026-04-23 15:02:47.756965+00');
INSERT INTO public.tbl_accounts
VALUES (103, 'lehoangcuong', '$2a$10$dXJ3SW6G7P50lGmMQgel6uVktDQd6B6TlQ8VjYDd3h3gI0rDVxMT.', 'CUSTOMER',
        'cuong.le@gmail.com', true, 'ACTIVE', '2026-04-23 15:02:47.756965+00', '2026-04-23 15:02:47.756965+00');
INSERT INTO public.tbl_accounts
VALUES (104, 'phamminhdung', '$2a$10$dXJ3SW6G7P50lGmMQgel6uVktDQd6B6TlQ8VjYDd3h3gI0rDVxMT.', 'CUSTOMER',
        'dung.pham@gmail.com', true, 'ACTIVE', '2026-04-23 15:02:47.756965+00', '2026-04-23 15:02:47.756965+00');
INSERT INTO public.tbl_accounts
VALUES (105, 'hoangthuha', '$2a$10$dXJ3SW6G7P50lGmMQgel6uVktDQd6B6TlQ8VjYDd3h3gI0rDVxMT.', 'CUSTOMER',
        'ha.hoang@gmail.com', true, 'ACTIVE', '2026-04-23 15:02:47.756965+00', '2026-04-23 15:02:47.756965+00');
INSERT INTO public.tbl_accounts
VALUES (106, 'vodinhkhoa', '$2a$10$dXJ3SW6G7P50lGmMQgel6uVktDQd6B6TlQ8VjYDd3h3gI0rDVxMT.', 'CUSTOMER',
        'khoa.vo@gmail.com', true, 'ACTIVE', '2026-04-23 15:02:47.756965+00', '2026-04-23 15:02:47.756965+00');
INSERT INTO public.tbl_accounts
VALUES (107, 'dangngoclinh', '$2a$10$dXJ3SW6G7P50lGmMQgel6uVktDQd6B6TlQ8VjYDd3h3gI0rDVxMT.', 'CUSTOMER',
        'linh.dang@gmail.com', true, 'ACTIVE', '2026-04-23 15:02:47.756965+00', '2026-04-23 15:02:47.756965+00');
INSERT INTO public.tbl_accounts
VALUES (108, 'buithanhmai', '$2a$10$dXJ3SW6G7P50lGmMQgel6uVktDQd6B6TlQ8VjYDd3h3gI0rDVxMT.', 'CUSTOMER',
        'mai.bui@gmail.com', true, 'ACTIVE', '2026-04-23 15:02:47.756965+00', '2026-04-23 15:02:47.756965+00');
INSERT INTO public.tbl_accounts
VALUES (109, 'ngoquocnam', '$2a$10$dXJ3SW6G7P50lGmMQgel6uVktDQd6B6TlQ8VjYDd3h3gI0rDVxMT.', 'CUSTOMER',
        'nam.ngo@gmail.com', true, 'ACTIVE', '2026-04-23 15:02:47.756965+00', '2026-04-23 15:02:47.756965+00');
INSERT INTO public.tbl_accounts
VALUES (110, 'duongthuyphuong', '$2a$10$dXJ3SW6G7P50lGmMQgel6uVktDQd6B6TlQ8VjYDd3h3gI0rDVxMT.', 'CUSTOMER',
        'phuong.duong@gmail.com', true, 'ACTIVE', '2026-04-23 15:02:47.756965+00', '2026-04-23 15:02:47.756965+00');
INSERT INTO public.tbl_accounts
VALUES (113, 'user', '$2a$10$g6po15P2zbRIulAyN1qAk.I4iBxuianekiE66NtfyFF3Q2PLuARFq', 'CUSTOMER',
        'dungcony070804@gmail.com', true, 'ACTIVE', '2026-05-18 17:37:51.163171+00', '2026-05-18 17:37:51.163171+00');
INSERT INTO public.tbl_accounts
VALUES (114, 'userr', '$2a$10$Iwj0i3/MyzlJt3Up22smH..zjPhlFn9xLPFqiDn6oAU1PpUz.IfOq', 'CUSTOMER',
        'dungcony07080@gmail.com', false, 'ACTIVE', '2026-05-18 17:39:09.451473+00', '2026-05-18 17:39:09.451473+00');


--
-- Data for Name: tbl_cart_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tbl_cart_items
VALUES ('54a4371a-76a7-4750-a1ad-99652d31f08f', 2, 1, 1, '2026-05-18 17:41:33.272419+00',
        '2026-05-18 17:41:33.272419+00');
INSERT INTO public.tbl_cart_items
VALUES ('54a4371a-76a7-4750-a1ad-99652d31f08f', 22, 3, 1, '2026-05-20 04:01:59.166045+00',
        '2026-05-20 04:14:49.886389+00');


--
-- Data for Name: tbl_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tbl_categories
VALUES (1, 'Thời trang nam', 'MEN', 'https://images.unsplash.com/photo-1552642986-ccb41e7059e7?w=200&h=200&fit=crop',
        'Quần áo nam', 'ACTIVE', NULL, false, 0, '1', 0, '2026-04-23 15:01:49.070516+00',
        '2026-04-23 15:01:49.070516+00');
INSERT INTO public.tbl_categories
VALUES (2, 'Thời trang nữ', 'WOMEN',
        'https://images.unsplash.com/photo-1595777457583-95e059d581b8?w=200&h=200&fit=crop', 'Quần áo nữ', 'ACTIVE',
        NULL, false, 0, '2', 0, '2026-04-23 15:01:49.070516+00', '2026-04-23 15:01:49.070516+00');
INSERT INTO public.tbl_categories
VALUES (3, 'Phụ kiện', 'ACC', 'https://images.unsplash.com/photo-1598532163257-ae3c6b2524b6?w=200&h=200&fit=crop',
        'Phụ kiện thời trang', 'ACTIVE', NULL, false, 0, '3', 0, '2026-04-23 15:01:49.070516+00',
        '2026-04-23 15:01:49.070516+00');
INSERT INTO public.tbl_categories
VALUES (4, 'Giày dép', 'SHOES',
        'https://images.pexels.com/photos/2048548/pexels-photo-2048548.jpeg?auto=compress&cs=tinysrgb&w=200',
        'Giày dép các loại', 'ACTIVE', NULL, false, 0, '4', 0, '2026-04-23 15:01:49.070516+00',
        '2026-04-23 15:01:49.070516+00');
INSERT INTO public.tbl_categories
VALUES (5, 'Áo thun nam', 'MTS', 'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=200&h=200&fit=crop',
        'Áo thun nam các loại', 'ACTIVE', 1, true, 1, '1/5', 0, '2026-04-23 15:01:49.568524+00',
        '2026-04-23 15:01:49.568524+00');
INSERT INTO public.tbl_categories
VALUES (6, 'Quần jeans nam', 'MJN', 'https://images.unsplash.com/photo-1563902575-bc2309dc76e4?w=200&h=200&fit=crop',
        'Quần jeans nam', 'ACTIVE', 1, true, 1, '1/6', 0, '2026-04-23 15:01:49.568524+00',
        '2026-04-23 15:01:49.568524+00');
INSERT INTO public.tbl_categories
VALUES (7, 'Áo khoác nam', 'MJK', 'https://images.unsplash.com/photo-1556821840-3a63f95609a7?w=200&h=200&fit=crop',
        'Áo khoác nam', 'ACTIVE', 1, true, 1, '1/7', 0, '2026-04-23 15:01:49.568524+00',
        '2026-04-23 15:01:49.568524+00');
INSERT INTO public.tbl_categories
VALUES (8, 'Áo thun nữ', 'WTS', 'https://images.unsplash.com/photo-1595777457583-95e059d581b8?w=200&h=200&fit=crop',
        'Áo thun nữ các loại', 'ACTIVE', 2, true, 1, '2/8', 0, '2026-04-23 15:01:49.568524+00',
        '2026-04-23 15:01:49.568524+00');
INSERT INTO public.tbl_categories
VALUES (9, 'Váy đầm', 'WDR',
        'https://images.unsplash.com/flagged/photo-1585052201332-b8c0ce30972f?w=200&h=200&fit=crop', 'Váy đầm nữ',
        'ACTIVE', 2, true, 1, '2/9', 0, '2026-04-23 15:01:49.568524+00', '2026-04-23 15:01:49.568524+00');
INSERT INTO public.tbl_categories
VALUES (10, 'Quần nữ', 'WPN', 'https://images.unsplash.com/photo-1594633312681-425c7b97ccd1?w=200&h=200&fit=crop',
        'Quần nữ các loại', 'ACTIVE', 2, true, 1, '2/10', 0, '2026-04-23 15:01:49.568524+00',
        '2026-04-23 15:01:49.568524+00');
INSERT INTO public.tbl_categories
VALUES (11, 'Mũ & Nón', 'HAT', 'https://images.unsplash.com/photo-1563319078-0b3ad9b6007a?w=200&h=200&fit=crop',
        'Mũ nón thời trang', 'ACTIVE', 3, true, 1, '3/11', 0, '2026-04-23 15:01:49.568524+00',
        '2026-04-23 15:01:49.568524+00');
INSERT INTO public.tbl_categories
VALUES (12, 'Túi xách', 'BAG', 'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=200&h=200&fit=crop',
        'Túi xách các loại', 'ACTIVE', 3, true, 1, '3/12', 0, '2026-04-23 15:01:49.568524+00',
        '2026-04-23 15:01:49.568524+00');
INSERT INTO public.tbl_categories
VALUES (13, 'Giày thể thao', 'SNK',
        'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=200',
        'Giày sneaker', 'ACTIVE', 4, true, 1, '4/13', 0, '2026-04-23 15:01:49.568524+00',
        '2026-04-23 15:01:49.568524+00');
INSERT INTO public.tbl_categories
VALUES (14, 'Dép & Sandal', 'SDL',
        'https://images.pexels.com/photos/267202/pexels-photo-267202.jpeg?auto=compress&cs=tinysrgb&w=200',
        'Dép và sandal', 'ACTIVE', 4, true, 1, '4/14', 0, '2026-04-23 15:01:49.568524+00',
        '2026-04-23 15:01:49.568524+00');


--
-- Data for Name: tbl_comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tbl_comments
VALUES (1, 'f47ac10b-58cc-4372-a567-0e02b2c3d401',
        'Vải cotton mềm mại, mặc rất thoáng. Mua lần 3 rồi, chất lượng ổn định.', 5, '2026-04-23 15:02:49.656479+00',
        '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (1, 'f47ac10b-58cc-4372-a567-0e02b2c3d403', 'Form áo vừa vặn, không bị rộng hay chật. Giao hàng nhanh nữa.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (1, 'f47ac10b-58cc-4372-a567-0e02b2c3d405', 'Áo đẹp lắm, mặc đi làm hay đi chơi đều được. Rất hài lòng!', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (1, 'f47ac10b-58cc-4372-a567-0e02b2c3d407', 'Chất vải tốt, giặt nhiều không bị giãn. Giá hợp lý.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (1, 'f47ac10b-58cc-4372-a567-0e02b2c3d409', 'Áo đẹp nhưng màu hơi khác so với hình. Vẫn ổn cho giá này.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (2, 'f47ac10b-58cc-4372-a567-0e02b2c3d401', 'Công nghệ Dri-FIT thật sự thoát mồ hôi tốt, chạy bộ mát lắm.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (2, 'f47ac10b-58cc-4372-a567-0e02b2c3d402', 'Mặc tập gym rất thoải mái, khô nhanh. Đáng tiền Nike.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (2, 'f47ac10b-58cc-4372-a567-0e02b2c3d404', 'Chất lượng tốt nhưng giá hơi cao so với áo thun bình thường.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (2, 'f47ac10b-58cc-4372-a567-0e02b2c3d406', 'Áo nhẹ, mau khô. Nhưng size hơi nhỏ so với bảng size thường.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (3, 'f47ac10b-58cc-4372-a567-0e02b2c3d402', 'Logo Trefoil cổ điển, phối streetwear rất đẹp!', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (3, 'f47ac10b-58cc-4372-a567-0e02b2c3d403', 'Áo ổn, nhưng vải hơi mỏng hơn mình nghĩ. Vẫn đáng mua.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (3, 'f47ac10b-58cc-4372-a567-0e02b2c3d408', 'Mặc đi chơi thì ok, nhưng giặt vài lần thấy phai màu nhẹ.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (4, 'f47ac10b-58cc-4372-a567-0e02b2c3d401', 'Supima Cotton đúng là khác biệt, mềm mượt hơn cotton thường nhiều.',
        5, '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (4, 'f47ac10b-58cc-4372-a567-0e02b2c3d405', 'Vải cao cấp, form đẹp. Uniqlo không bao giờ làm thất vọng.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (4, 'f47ac10b-58cc-4372-a567-0e02b2c3d406', 'Chất vải rất mịn nhưng hơi dễ nhăn, cần là hơi phiền.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (4, 'f47ac10b-58cc-4372-a567-0e02b2c3d407', 'Mua lần 2, chất lượng vẫn đều. Rất thích sự đơn giản của Uniqlo.',
        5, '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (4, 'f47ac10b-58cc-4372-a567-0e02b2c3d410', 'Áo mềm thật sự, nhưng size chart hơi lệch, mua lên 1 size nhé.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (5, 'f47ac10b-58cc-4372-a567-0e02b2c3d403', 'Graphic đẹp, form oversize đúng trend. Giá sale rất hời!', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (5, 'f47ac10b-58cc-4372-a567-0e02b2c3d404', 'Áo ok nhưng hình in có dấu hiệu bong sau vài lần giặt.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (5, 'f47ac10b-58cc-4372-a567-0e02b2c3d406', 'Form oversize thoải mái, mặc mùa hè mát. Graphic bắt mắt.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (5, 'f47ac10b-58cc-4372-a567-0e02b2c3d408', 'Thiết kế đẹp, nhưng vải hơi nóng hơn mong đợi.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (5, 'f47ac10b-58cc-4372-a567-0e02b2c3d409', 'Chất áo tạm ổn so với giá tiền. Graphic không bị nhòe.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (6, 'f47ac10b-58cc-4372-a567-0e02b2c3d401', 'Co giãn cực tốt, mặc cả ngày không bí. Form slim rất đẹp.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (6, 'f47ac10b-58cc-4372-a567-0e02b2c3d403', 'Quần Zara đúng chuẩn, chất jeans dày dặn mà vẫn thoáng.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (6, 'f47ac10b-58cc-4372-a567-0e02b2c3d407', 'Form slim fit chuẩn, phối với áo thun hay sơ mi đều đẹp.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (6, 'f47ac10b-58cc-4372-a567-0e02b2c3d409', 'Quần đẹp, nhưng ống hơi bó ở bắp chân với người chân to.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (7, 'f47ac10b-58cc-4372-a567-0e02b2c3d402', 'Ống đứng cổ điển, phối giày gì cũng hợp. Chất jeans bền.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (7, 'f47ac10b-58cc-4372-a567-0e02b2c3d404', 'Quần ok, nhưng màu thực tế nhạt hơn hình chút.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (7, 'f47ac10b-58cc-4372-a567-0e02b2c3d405', 'Form straight thoải mái, mặc đi làm hay đi chơi đều ổn.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (7, 'f47ac10b-58cc-4372-a567-0e02b2c3d408', 'Chất vải dày, đường may chắc chắn. Rất ưng ý.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (7, 'f47ac10b-58cc-4372-a567-0e02b2c3d410', 'Quần đẹp, giá tầm trung hợp lý. Hơi cứng khi mới mua.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (8, 'f47ac10b-58cc-4372-a567-0e02b2c3d401',
        'Regular fit thoải mái nhất, mặc cả ngày không mỏi. Uniqlo chất lượng!', 5, '2026-04-23 15:02:49.656479+00',
        '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (8, 'f47ac10b-58cc-4372-a567-0e02b2c3d406', 'Quần jeans Uniqlo giá rẻ mà chất lượng không thua hàng hiệu.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (8, 'f47ac10b-58cc-4372-a567-0e02b2c3d407', 'Vải ổn nhưng hơi mỏng so với jeans truyền thống.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (8, 'f47ac10b-58cc-4372-a567-0e02b2c3d409', 'Form regular vừa, không rộng quá. Phù hợp đi làm hàng ngày.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (9, 'f47ac10b-58cc-4372-a567-0e02b2c3d402', 'Siêu nhẹ, gấp gọn bỏ túi luôn. Chống gió tốt khi đi xe máy.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (9, 'f47ac10b-58cc-4372-a567-0e02b2c3d403', 'Áo khoác Nike chất lượng đỉnh, mặc chạy bộ sáng sớm rất ấm.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (9, 'f47ac10b-58cc-4372-a567-0e02b2c3d405', 'Nhẹ và thoáng nhưng chống nước chỉ ở mức nhẹ thôi.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (9, 'f47ac10b-58cc-4372-a567-0e02b2c3d408', 'Thiết kế đẹp, tiện lợi. Mua thêm cho cả nhà.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (9, 'f47ac10b-58cc-4372-a567-0e02b2c3d410', 'Chất lượng tốt nhưng túi áo hơi nhỏ, không để được điện thoại to.',
        4, '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (10, 'f47ac10b-58cc-4372-a567-0e02b2c3d401', 'Nỉ bông ấm áp, hoodie này mặc mùa đông Đà Lạt là perfect.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (10, 'f47ac10b-58cc-4372-a567-0e02b2c3d402', 'Chất nỉ mềm, không xù sau khi giặt. Coolmate chất lượng thật.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (10, 'f47ac10b-58cc-4372-a567-0e02b2c3d404', 'Form đẹp, mũ trùm vừa đầu. Màu sắc giống hình.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (10, 'f47ac10b-58cc-4372-a567-0e02b2c3d406', 'Hoodie xịn nhất mình từng mua trong tầm giá này!', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (10, 'f47ac10b-58cc-4372-a567-0e02b2c3d408', 'Áo ấm, đẹp. Chỉ tiếc là không có nhiều màu để chọn.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (11, 'f47ac10b-58cc-4372-a567-0e02b2c3d403', 'Style bomber cổ điển, mặc với quần jeans cực ngầu!', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (11, 'f47ac10b-58cc-4372-a567-0e02b2c3d404', 'Áo đẹp nhưng hơi nóng khi mặc trong nhà. Phù hợp ra ngoài.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (11, 'f47ac10b-58cc-4372-a567-0e02b2c3d410', 'Chất lượng ổn so với giá, nhưng khóa kéo hơi khó kéo.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (12, 'f47ac10b-58cc-4372-a567-0e02b2c3d402', 'Vải cotton mềm, mặc rất thoải mái. Phối đồ dễ dàng.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (12, 'f47ac10b-58cc-4372-a567-0e02b2c3d405', 'Áo basic nhưng chất lượng không basic chút nào! Rất thích.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (12, 'f47ac10b-58cc-4372-a567-0e02b2c3d407', 'Mua cả lố mặc thay nhau, giá H&M rất phải chăng.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (12, 'f47ac10b-58cc-4372-a567-0e02b2c3d410', 'Áo đẹp, hơi mỏng nhưng mặc mùa hè thì OK.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (13, 'f47ac10b-58cc-4372-a567-0e02b2c3d402', 'Crop top Zara kiểu dáng trẻ trung, phối quần cạp cao rất đẹp!', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (13, 'f47ac10b-58cc-4372-a567-0e02b2c3d405', 'Áo vừa vặn, chất vải co giãn tốt. Size đúng chuẩn.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (13, 'f47ac10b-58cc-4372-a567-0e02b2c3d407', 'Kiểu dáng đẹp nhưng vải hơi mỏng, cần mặc áo lót bên trong.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (13, 'f47ac10b-58cc-4372-a567-0e02b2c3d408', 'Siêu xinh luôn! Phối với chân váy hay quần jeans đều hợp.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (13, 'f47ac10b-58cc-4372-a567-0e02b2c3d410', 'Áo đẹp, nhưng độ dài hơi ngắn hơn mong đợi.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (14, 'f47ac10b-58cc-4372-a567-0e02b2c3d402', 'Áo peplum Ivy Moda thanh lịch, mặc đi làm rất sang.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (14, 'f47ac10b-58cc-4372-a567-0e02b2c3d405', 'Chất vải cao cấp xứng đáng với giá. Form rất tôn dáng.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (14, 'f47ac10b-58cc-4372-a567-0e02b2c3d407', 'Đẹp nhưng cần chọn size cẩn thận, hơi rộng so với bảng size.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (14, 'f47ac10b-58cc-4372-a567-0e02b2c3d408', 'Áo thanh lịch, đi tiệc hay đi làm đều phù hợp.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (15, 'f47ac10b-58cc-4372-a567-0e02b2c3d402', 'Đầm công sở chuẩn Ivy Moda, chất liệu tốt, không nhăn.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (15, 'f47ac10b-58cc-4372-a567-0e02b2c3d405', 'Mặc đi làm cả ngày vẫn thoải mái. Form suông che khuyết điểm tốt.',
        5, '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (15, 'f47ac10b-58cc-4372-a567-0e02b2c3d406', 'Đẹp nhưng hơi ngắn, mình cao 1m65 thì vừa đầu gối.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (15, 'f47ac10b-58cc-4372-a567-0e02b2c3d407', 'Đầm sang trọng, đồng nghiệp ai cũng khen.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (15, 'f47ac10b-58cc-4372-a567-0e02b2c3d410', 'Chất vải đẹp nhưng hơi nóng khi mặc mùa hè.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (16, 'f47ac10b-58cc-4372-a567-0e02b2c3d402', 'Hoa nhí vintage đẹp lắm, mặc đi biển là chuẩn bài!', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (16, 'f47ac10b-58cc-4372-a567-0e02b2c3d405', 'Đầm dài nên cần chú ý chiều cao. Mình 1m55 phải sửa lai.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (16, 'f47ac10b-58cc-4372-a567-0e02b2c3d408', 'Họa tiết đẹp, nhưng vải hơi mỏng cần mặc lót bên trong.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (17, 'f47ac10b-58cc-4372-a567-0e02b2c3d402', 'Đầm ôm sát tôn dáng cực kỳ! Mặc đi tiệc ai cũng nhìn.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (17, 'f47ac10b-58cc-4372-a567-0e02b2c3d405', 'Chất vải co giãn tốt nhưng dễ bám bụi, cần chú ý.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (17, 'f47ac10b-58cc-4372-a567-0e02b2c3d407', 'Form ôm body nên phải chọn đúng size. Size M vừa 55kg.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (17, 'f47ac10b-58cc-4372-a567-0e02b2c3d408', 'Đầm quyến rũ, Ivy Moda thiết kế rất tinh tế.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (17, 'f47ac10b-58cc-4372-a567-0e02b2c3d410', 'Đẹp nhưng giá hơi cao so với mặt bằng chung.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (18, 'f47ac10b-58cc-4372-a567-0e02b2c3d402', 'Ống rộng thoải mái, H&M luôn có form đẹp. Rất thích!', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (18, 'f47ac10b-58cc-4372-a567-0e02b2c3d405', 'Quần baggy này phối áo thun hay áo sơ mi đều hợp.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (18, 'f47ac10b-58cc-4372-a567-0e02b2c3d407', 'Vải ổn nhưng nhăn nhanh, cần là ủi thường xuyên.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (18, 'f47ac10b-58cc-4372-a567-0e02b2c3d409', 'Quần thoải mái cho mùa hè, giá cả hợp lý.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (19, 'f47ac10b-58cc-4372-a567-0e02b2c3d402', 'Co giãn 4 chiều thật sự! Tập yoga mà thoải mái vô cùng.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (19, 'f47ac10b-58cc-4372-a567-0e02b2c3d405', 'Legging Nike xịn, không bị trong suốt khi squat. Yên tâm tập.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (19, 'f47ac10b-58cc-4372-a567-0e02b2c3d407', 'Chất vải mát, thoáng khí. Mặc chạy bộ cũng rất ổn.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (19, 'f47ac10b-58cc-4372-a567-0e02b2c3d410', 'Legging đẹp nhưng dễ bám lông mèo. Ai nuôi thú cưng lưu ý.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (20, 'f47ac10b-58cc-4372-a567-0e02b2c3d401', 'Nón Nike chính hãng, logo thêu sắc nét. Chống nắng tốt.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (20, 'f47ac10b-58cc-4372-a567-0e02b2c3d403', 'Đội vừa đầu, quai sau điều chỉnh được. Đẹp như hình.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (20, 'f47ac10b-58cc-4372-a567-0e02b2c3d404', 'Nón ổn nhưng vải hơi nóng khi đội lâu dưới nắng.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (20, 'f47ac10b-58cc-4372-a567-0e02b2c3d406', 'Phong cách sporty, phối đồ thể thao hay casual đều hợp.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (20, 'f47ac10b-58cc-4372-a567-0e02b2c3d409', 'Nón đẹp, nhưng size one-size hơi nhỏ với đầu mình.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (21, 'f47ac10b-58cc-4372-a567-0e02b2c3d402', 'Bucket hat Adidas phong cách đường phố, rất cool!', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (21, 'f47ac10b-58cc-4372-a567-0e02b2c3d404', 'Che nắng khá tốt, nhưng vành mũ hơi mềm, gió thổi hay bay.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (21, 'f47ac10b-58cc-4372-a567-0e02b2c3d408', 'Mũ đẹp, đi chơi phố rất hợp. Giá tầm trung chấp nhận được.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (22, 'f47ac10b-58cc-4372-a567-0e02b2c3d401', 'Balo Nike ngăn chứa rộng, để laptop 15 inch thoải mái.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (22, 'f47ac10b-58cc-4372-a567-0e02b2c3d403', 'Chống nước nhẹ, đi mưa nhỏ không lo ướt đồ bên trong.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (22, 'f47ac10b-58cc-4372-a567-0e02b2c3d406', 'Balo đẹp nhưng quai hơi mỏng, đeo lâu hơi đau vai.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (22, 'f47ac10b-58cc-4372-a567-0e02b2c3d409', 'Thiết kế đẹp, nhiều ngăn tiện lợi. Dây kéo hơi cứng ban đầu.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (23, 'f47ac10b-58cc-4372-a567-0e02b2c3d402', 'Túi tote canvas phong cách minimalist, mang đi học đi làm đều ok.',
        5, '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (23, 'f47ac10b-58cc-4372-a567-0e02b2c3d405', 'Vải canvas dày dặn, khâu tay cẩn thận. Giá Uniqlo rất phải chăng.',
        4, '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (23, 'f47ac10b-58cc-4372-a567-0e02b2c3d407', 'Túi rộng nhưng không có khóa kéo, hơi lo lắng khi đi xe buýt.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (23, 'f47ac10b-58cc-4372-a567-0e02b2c3d408', 'Đơn giản mà đẹp, để đồ thoải mái. Mình rất thích style này!', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (23, 'f47ac10b-58cc-4372-a567-0e02b2c3d410', 'Túi ổn so với giá, nhưng quai hơi ngắn khi đeo vai.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (24, 'f47ac10b-58cc-4372-a567-0e02b2c3d401', 'Huyền thoại Air Max! Đệm Air êm ái, đi cả ngày không mỏi chân.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (24, 'f47ac10b-58cc-4372-a567-0e02b2c3d402', 'Giày đẹp xuất sắc, chất lượng Nike không phải bàn.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (24, 'f47ac10b-58cc-4372-a567-0e02b2c3d403', 'Air Max 90 kinh điển, mang mãi không chán. Worth every penny!', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (24, 'f47ac10b-58cc-4372-a567-0e02b2c3d404', 'Êm chân, nhẹ, phong cách retro rất đẹp. 10/10!', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (24, 'f47ac10b-58cc-4372-a567-0e02b2c3d405', 'Mua tặng bạn trai, anh ấy mê lắm. Đóng gói cẩn thận.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (24, 'f47ac10b-58cc-4372-a567-0e02b2c3d406', 'Đi bộ cả ngày mà chân vẫn thoải mái. Công nghệ Air xịn thật.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (24, 'f47ac10b-58cc-4372-a567-0e02b2c3d407', 'Phối đồ cực dễ, mang với quần jeans hay jogger đều đẹp.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (24, 'f47ac10b-58cc-4372-a567-0e02b2c3d408', 'Chất lượng tuyệt vời, đúng hàng chính hãng Nike.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (24, 'f47ac10b-58cc-4372-a567-0e02b2c3d409', 'Giày iconic, mua đúng size là chuẩn luôn. Không cần break in.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (24, 'f47ac10b-58cc-4372-a567-0e02b2c3d410', 'Giày đẹp lắm nhưng giá hơi cao. Nên canh sale để mua.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (25, 'f47ac10b-58cc-4372-a567-0e02b2c3d401', 'Boost êm nhất thị trường! Chạy bộ 10km mà chân như đi trên mây.',
        5, '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (25, 'f47ac10b-58cc-4372-a567-0e02b2c3d403', 'Nhẹ vô cùng, đế Boost hấp thụ lực rất tốt khi chạy.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (25, 'f47ac10b-58cc-4372-a567-0e02b2c3d405', 'Adidas Ultraboost không hổ danh, mang suốt ngày không đau chân.',
        5, '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (25, 'f47ac10b-58cc-4372-a567-0e02b2c3d406', 'Giày chạy bộ tốt nhất mình từng mua. Rất recommend!', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (25, 'f47ac10b-58cc-4372-a567-0e02b2c3d409', 'Giày êm, nhẹ nhưng đế Boost dễ bám bụi bẩn khó lau.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (26, 'f47ac10b-58cc-4372-a567-0e02b2c3d401', 'Vans Old Skool kinh điển, đi đâu cũng được compliment.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (26, 'f47ac10b-58cc-4372-a567-0e02b2c3d404', 'Sọc trắng bên hông quá iconic! Phối streetwear là đỉnh.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (26, 'f47ac10b-58cc-4372-a567-0e02b2c3d407', 'Giày đẹp, bền bỉ. Mang gần 2 năm vẫn chưa hỏng.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (26, 'f47ac10b-58cc-4372-a567-0e02b2c3d410', 'Classic đẹp nhưng đế hơi cứng, cần thời gian break in.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (27, 'f47ac10b-58cc-4372-a567-0e02b2c3d402', 'Converse cổ cao huyền thoại! Phối quần jeans là bất bại.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (27, 'f47ac10b-58cc-4372-a567-0e02b2c3d403', 'Giày Converse biểu tượng, ai cũng nên có 1 đôi trong tủ.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (27, 'f47ac10b-58cc-4372-a567-0e02b2c3d405', 'Mua đôi trắng classic, đi với gì cũng đẹp.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (27, 'f47ac10b-58cc-4372-a567-0e02b2c3d406', 'Converse All Star luôn là lựa chọn an toàn cho phong cách casual.',
        5, '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (27, 'f47ac10b-58cc-4372-a567-0e02b2c3d408', 'Giày đẹp nhưng đế bằng phẳng, đi lâu hơi mỏi so với giày có đệm.',
        4, '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (28, 'f47ac10b-58cc-4372-a567-0e02b2c3d401', 'Dép Nike êm chân, mang quanh nhà hay ra ngoài đều tiện.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (28, 'f47ac10b-58cc-4372-a567-0e02b2c3d404', 'Quai ngang Nike êm ái, phù hợp mang sau khi tập gym xong.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (28, 'f47ac10b-58cc-4372-a567-0e02b2c3d406', 'Dép đẹp nhưng đế hơi trơn khi đi trên sàn ướt.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (28, 'f47ac10b-58cc-4372-a567-0e02b2c3d409', 'Êm chân, thiết kế đơn giản. Giá cao hơn dép thường nhiều.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (29, 'f47ac10b-58cc-4372-a567-0e02b2c3d402', 'Adilette cổ điển, ba sọc quen thuộc. Mang mùa hè siêu mát.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (29, 'f47ac10b-58cc-4372-a567-0e02b2c3d403', 'Sandal ok nhưng quai hơi cứng khi mới mua, cần break in.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (29, 'f47ac10b-58cc-4372-a567-0e02b2c3d407', 'Mang thoải mái, nhưng dễ trượt khi chân ướt.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (29, 'f47ac10b-58cc-4372-a567-0e02b2c3d408', 'Sandal đẹp, đi biển hay đi dạo đều hợp. Logo 3 sọc nổi bật.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (29, 'f47ac10b-58cc-4372-a567-0e02b2c3d410', 'Chất lượng Adidas đúng chuẩn, nhưng giá khá đắt cho 1 đôi sandal.',
        4, '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (30, 'f47ac10b-58cc-4372-a567-0e02b2c3d401', 'Dép xỏ ngón Coolmate giá rẻ mà êm, đi ở nhà rất tiện.', 5,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (30, 'f47ac10b-58cc-4372-a567-0e02b2c3d404', 'Dép nhẹ, thoải mái cho mùa hè. Nhưng quai hơi mỏng.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (30, 'f47ac10b-58cc-4372-a567-0e02b2c3d406', 'Dép ok cho giá tiền, mang trong nhà thì ổn.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (30, 'f47ac10b-58cc-4372-a567-0e02b2c3d408', 'Dép mỏng quá, đế mòn nhanh. Chắc chỉ dùng được vài tháng.', 3,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');
INSERT INTO public.tbl_comments
VALUES (30, 'f47ac10b-58cc-4372-a567-0e02b2c3d409', 'Giá sale hợp lý nhưng chất lượng cũng chỉ tầm đó thôi.', 4,
        '2026-04-23 15:02:49.656479+00', '2026-04-23 15:02:49.656479+00');


--
-- Data for Name: tbl_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tbl_items
VALUES (2, 1, 59, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (1, 1, 118, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (31, 1, 1231212156, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (1, 2, 200, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (1, 3, 180, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (1, 4, 90, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (1, 5, 40, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (1, 6, 15, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (2, 2, 100, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (2, 3, 80, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (2, 4, 50, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (2, 5, 20, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (3, 1, 45, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (3, 2, 70, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (3, 3, 55, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (3, 4, 30, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (4, 1, 80, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (4, 2, 120, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (4, 3, 100, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (4, 4, 60, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (4, 5, 25, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (5, 2, 50, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (5, 3, 70, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (5, 4, 80, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (5, 5, 40, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (5, 6, 20, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (6, 1, 40, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (6, 2, 90, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (6, 3, 110, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (6, 4, 60, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (6, 5, 20, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (7, 1, 25, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (7, 2, 55, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (7, 3, 70, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (7, 4, 45, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (7, 5, 15, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (8, 1, 30, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (8, 2, 80, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (8, 3, 100, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (8, 4, 70, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (8, 5, 35, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (9, 1, 20, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (9, 2, 40, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (9, 3, 60, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (9, 4, 50, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (9, 5, 15, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (10, 1, 30, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (10, 2, 80, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (10, 3, 110, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (10, 4, 70, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (10, 5, 25, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (11, 1, 20, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (11, 2, 35, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (11, 3, 50, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (11, 4, 40, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (12, 1, 150, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (12, 2, 180, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (12, 3, 120, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (12, 4, 50, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (13, 1, 90, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (13, 2, 100, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (13, 3, 60, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (14, 1, 40, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (14, 2, 65, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (14, 3, 50, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (14, 4, 20, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (15, 1, 35, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (15, 2, 55, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (15, 3, 45, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (15, 4, 20, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (16, 1, 25, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (16, 2, 40, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (16, 3, 35, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (16, 4, 15, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (17, 1, 30, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (17, 2, 45, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (17, 3, 20, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (18, 1, 60, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (18, 2, 90, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (18, 3, 70, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (18, 4, 30, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (19, 1, 100, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (19, 2, 150, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (19, 3, 120, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (19, 4, 60, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (20, 1, 100, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (20, 2, 300, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (20, 3, 150, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (21, 1, 80, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (21, 2, 200, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (21, 3, 120, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (23, 3, 180, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (24, 1, 40, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (24, 2, 80, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (24, 3, 90, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (24, 4, 50, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (24, 5, 20, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (25, 1, 35, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (25, 2, 60, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (25, 3, 70, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (25, 4, 40, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (25, 5, 15, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (26, 1, 50, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (26, 2, 90, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (26, 3, 80, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (26, 4, 45, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (27, 1, 60, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (27, 2, 100, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (27, 3, 110, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (27, 4, 55, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (27, 5, 20, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (28, 1, 80, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (28, 2, 120, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (28, 3, 100, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (28, 4, 60, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (29, 1, 70, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (29, 2, 100, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (29, 3, 90, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (29, 4, 50, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (30, 1, 40, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (30, 2, 70, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (30, 3, 80, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (30, 4, 60, 'AVAILABLE');
INSERT INTO public.tbl_items
VALUES (22, 3, 149, 'AVAILABLE');


--
-- Data for Name: tbl_notifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tbl_notifications
VALUES (2, 'zMJtzsM6YYA8HsdD', '54a4371a-76a7-4750-a1ad-99652d31f08f', NULL, 'ORDER_CREATED', 'create_order',
        'tạo đơn hàng', '2026-05-18 17:53:47.839682+00', '2026-05-18 17:53:47.839682+00', true, false, false);
INSERT INTO public.tbl_notifications
VALUES (3, 'ml-0-jWdPe_oyA4m', '54a4371a-76a7-4750-a1ad-99652d31f08f', NULL, 'ORDER_CREATED', 'create_order',
        'tạo đơn hàng', '2026-05-18 17:59:53.149427+00', '2026-05-18 17:59:53.149427+00', true, false, false);
INSERT INTO public.tbl_notifications
VALUES (4, 'cEyGR_x1T4LzH93Q', '54a4371a-76a7-4750-a1ad-99652d31f08f', NULL, 'ORDER_CREATED', 'create_order',
        'tạo đơn hàng', '2026-05-18 18:26:34.209885+00', '2026-05-18 18:26:34.209885+00', true, false, false);
INSERT INTO public.tbl_notifications
VALUES (5, 'eWxbbil_YisKPTCn', '54a4371a-76a7-4750-a1ad-99652d31f08f', NULL, 'ORDER_PAID', 'paid_order',
        'thanh toán đơn hàng', '2026-05-18 18:30:26.863923+00', '2026-05-18 18:30:26.863923+00', true, false, false);
INSERT INTO public.tbl_notifications
VALUES (6, '3kYih0A2kV-4Uoad', '54a4371a-76a7-4750-a1ad-99652d31f08f', NULL, 'ORDER_CREATED', 'create_order',
        'tạo đơn hàng', '2026-05-18 22:37:29.525139+00', '2026-05-18 22:37:29.525152+00', true, false, false);
INSERT INTO public.tbl_notifications
VALUES (7, 'S2lq-p02QkM1_pKV', '54a4371a-76a7-4750-a1ad-99652d31f08f', NULL, 'ORDER_PAID', 'paid_order',
        'thanh toán đơn hàng', '2026-05-18 22:42:50.117996+00', '2026-05-18 22:42:50.118005+00', true, false, false);


--
-- Data for Name: tbl_order_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tbl_order_items
VALUES (4, 1, 1, 1, 299000.00, 299000.00, 299000.00);
INSERT INTO public.tbl_order_items
VALUES (5, 1, 1, 1, 299000.00, 299000.00, 299000.00);
INSERT INTO public.tbl_order_items
VALUES (6, 31, 1, 1, 5000.00, 5000.00, 5000.00);
INSERT INTO public.tbl_order_items
VALUES (7, 31, 1, 1, 5000.00, 5000.00, 5000.00);


--
-- Data for Name: tbl_orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tbl_orders
VALUES (4, 'ORD-26826125-BC2A', 'UNPAID', NULL, 299000.00, 0.00, 299000.00, 'string', 0,
        '54a4371a-76a7-4750-a1ad-99652d31f08f', 1, '2026-05-18 17:53:47.410145+00', '2026-05-18 17:53:47.410145+00',
        'ONLINE');
INSERT INTO public.tbl_orders
VALUES (5, 'ORD-27191402-D53A', 'UNPAID', NULL, 299000.00, 0.00, 299000.00, 'string', 0,
        '54a4371a-76a7-4750-a1ad-99652d31f08f', 1, '2026-05-18 17:59:52.710973+00', '2026-05-18 17:59:52.711973+00',
        'ONLINE');
INSERT INTO public.tbl_orders
VALUES (6, 'ORD-28792455-9EDE', 'PAID', NULL, 5000.00, 0.00, 5000.00, 'string', 1,
        '54a4371a-76a7-4750-a1ad-99652d31f08f', 1, '2026-05-18 18:26:33.763903+00', '2026-05-18 18:30:27.007203+00',
        'ONLINE');
INSERT INTO public.tbl_orders
VALUES (7, 'ORD-43847749-B13C', 'PAID', NULL, 5000.00, 0.00, 5000.00, 'string', 1,
        '54a4371a-76a7-4750-a1ad-99652d31f08f', 1, '2026-05-18 22:37:29.036897+00', '2026-05-18 22:42:50.263468+00',
        'ONLINE');


--
-- Data for Name: tbl_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tbl_products
VALUES (31, 't', 'TEST', 'sdfsf', 1, 5000.00, 'ACTIVE', NULL, 1, 1, 0, NULL, NULL, '2026-05-18 18:04:56.212878+00',
        '2026-05-18 18:04:56.212878+00');
INSERT INTO public.tbl_products
VALUES (22, 'Balo thời trang nam', 'BAG-001', 'Balo laptop chống nước ngăn chứa rộng rãi', 730, 890000.00, 'ACTIVE',
        4.5, 12, 1, 0, 'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=400&h=400&fit=crop', NULL,
        '2026-04-23 15:01:54.481038+00', '2026-04-23 15:01:54.481038+00');
INSERT INTO public.tbl_products
VALUES (11, 'Áo khoác bomber nam', 'MJK-003', 'Áo bomber phong cách thời trang đường phố', 280, 790000.00, 'ACTIVE',
        4.3, 7, 7, 0, 'https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg', NULL, '2026-04-23 15:01:54.481038+00',
        '2026-04-23 15:01:54.481038+00');
INSERT INTO public.tbl_products
VALUES (9, 'Áo khoác gió nam nhẹ', 'MJK-001', 'Áo khoác gió siêu nhẹ chống nước nhẹ tiện lợi', 430, 690000.00, 'ACTIVE',
        4.6, 7, 1, 0, 'https://images.unsplash.com/photo-1620799140188-3b2a02fd9a77?w=400&h=400&fit=crop', NULL,
        '2026-04-23 15:01:54.481038+00', '2026-04-23 15:01:54.481038+00');
INSERT INTO public.tbl_products
VALUES (15, 'Đầm suông công sở', 'WDR-001', 'Đầm suông thanh lịch phù hợp môi trường công sở', 520, 680000.00, 'ACTIVE',
        4.6, 9, 8, 0, 'https://images.unsplash.com/flagged/photo-1585052201332-b8c0ce30972f?w=400&h=400&fit=crop', NULL,
        '2026-04-23 15:01:54.481038+00', '2026-04-23 15:01:54.481038+00');
INSERT INTO public.tbl_products
VALUES (26, 'Giày Old Skool', 'SNK-003', 'Giày classic với sọc trắng biểu tượng bên hông', 950, 1890000.00,
        'BESTSELLER', 4.8, 13, 9, 0,
        'https://images.pexels.com/photos/1240892/pexels-photo-1240892.jpeg?auto=compress&cs=tinysrgb&w=400', NULL,
        '2026-04-23 15:01:54.481038+00', '2026-04-23 15:01:54.481038+00');
INSERT INTO public.tbl_products
VALUES (19, 'Quần legging nữ', 'WPN-002', 'Quần legging co giãn 4 chiều tập gym yoga', 950, 350000.00, 'BESTSELLER',
        4.8, 10, 1, 0, 'https://images.unsplash.com/photo-1506629082955-511b1aa562c8?w=400&h=400&fit=crop', NULL,
        '2026-04-23 15:01:54.481038+00', '2026-04-23 15:01:54.481038+00');
INSERT INTO public.tbl_products
VALUES (30, 'Dép xỏ ngón nam', 'SDL-003', 'Dép xỏ ngón nhẹ nhàng tiện lợi cho mùa hè', 600, 190000.00, 'ON_SALE', 4, 14,
        6, 0, 'https://images.unsplash.com/photo-1562183241-b937e95585b6?w=400&h=400&fit=crop', NULL,
        '2026-04-23 15:01:54.481038+00', '2026-04-23 15:01:54.481038+00');
INSERT INTO public.tbl_products
VALUES (21, 'Mũ bucket unisex', 'HAT-002', 'Mũ bucket phong cách đường phố che nắng tốt', 680, 350000.00, 'ACTIVE', 4.3,
        11, 2, 0, 'https://images.unsplash.com/photo-1563319078-0b3ad9b6007a?w=400&h=400&fit=crop', NULL,
        '2026-04-23 15:01:54.481038+00', '2026-04-23 15:01:54.481038+00');
INSERT INTO public.tbl_products
VALUES (3, 'Áo thun nam Trefoil', 'MTS-003', 'Áo thun nam logo Trefoil cổ điển phong cách streetwear', 620, 750000.00,
        'ACTIVE', 4.3, 5, 2, 0, 'https://images.unsplash.com/photo-1626806851009-c98659eb1af0?w=400&h=400&fit=crop',
        NULL, '2026-04-23 15:01:54.481038+00', '2026-04-23 15:01:54.481038+00');
INSERT INTO public.tbl_products
VALUES (17, 'Đầm body ôm sát', 'WDR-003', 'Đầm bodycon tôn dáng quyến rũ cho buổi tiệc', 290, 750000.00, 'ACTIVE', 4.4,
        9, 8, 0, 'https://images.unsplash.com/photo-1572804013309-59a88b7e92f1?w=400&h=400&fit=crop', NULL,
        '2026-04-23 15:01:54.481038+00', '2026-04-23 15:01:54.481038+00');
INSERT INTO public.tbl_products
VALUES (28, 'Dép quai ngang Nike', 'SDL-001', 'Dép quai ngang êm ái cho ngày nghỉ thoải mái', 1800, 790000.00, 'ACTIVE',
        4.5, 14, 1, 0,
        'https://images.pexels.com/photos/267202/pexels-photo-267202.jpeg?auto=compress&cs=tinysrgb&w=400', NULL,
        '2026-04-23 15:01:54.481038+00', '2026-04-23 15:01:54.481038+00');
INSERT INTO public.tbl_products
VALUES (5, 'Áo thun nam oversize graphic', 'MTS-005', 'Áo thun oversize in họa tiết graphic trẻ trung', 310, 350000.00,
        'ON_SALE', 4.2, 5, 7, 0, 'https://fakestoreapi.com/img/71YXzeOuslL._AC_UY879_.jpg', NULL,
        '2026-04-23 15:01:54.481038+00', '2026-04-23 15:01:54.481038+00');
INSERT INTO public.tbl_products
VALUES (29, 'Sandal Adilette', 'SDL-002', 'Sandal quai ngang phong cách thể thao cổ điển', 1300, 690000.00, 'ACTIVE',
        4.4, 14, 2, 0, 'https://images.unsplash.com/photo-1603487742131-4160ec999306?w=400&h=400&fit=crop', NULL,
        '2026-04-23 15:01:54.481038+00', '2026-04-23 15:01:54.481038+00');
INSERT INTO public.tbl_products
VALUES (4, 'Áo thun nam Supima Cotton', 'MTS-004', 'Áo thun Supima Cotton cao cấp mềm mại co giãn tốt', 450, 390000.00,
        'ACTIVE', 4.6, 5, 3, 0, 'https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg', NULL,
        '2026-04-23 15:01:54.481038+00', '2026-04-23 15:01:54.481038+00');
INSERT INTO public.tbl_products
VALUES (10, 'Áo khoác hoodie nam', 'MJK-002', 'Áo hoodie nỉ bông ấm áp có mũ trùm đầu', 890, 550000.00, 'BESTSELLER',
        4.8, 7, 6, 0, 'https://images.unsplash.com/photo-1556821840-3a63f95609a7?w=400&h=400&fit=crop', NULL,
        '2026-04-23 15:01:54.481038+00', '2026-04-23 15:01:54.481038+00');
INSERT INTO public.tbl_products
VALUES (6, 'Quần jeans nam slim fit', 'MJN-001', 'Quần jeans co giãn form slim fit trẻ trung', 980, 590000.00,
        'BESTSELLER', 4.8, 6, 4, 0, 'https://images.unsplash.com/photo-1563902575-bc2309dc76e4?w=400&h=400&fit=crop',
        NULL, '2026-04-23 15:01:54.481038+00', '2026-04-23 15:01:54.481038+00');
INSERT INTO public.tbl_products
VALUES (14, 'Áo thun nữ peplum', 'WTS-003', 'Áo peplum thanh lịch phù hợp đi làm đi chơi', 340, 420000.00, 'ACTIVE',
        4.5, 8, 8, 0, 'https://fakestoreapi.com/img/61pHAEJ4NML._AC_UX679_.jpg', NULL, '2026-04-23 15:01:54.481038+00',
        '2026-04-23 15:01:54.481038+00');
INSERT INTO public.tbl_products
VALUES (13, 'Áo thun nữ crop top', 'WTS-002', 'Áo crop top trẻ trung năng động phối đồ dễ dàng', 670, 280000.00,
        'ACTIVE', 4.4, 8, 4, 0, 'https://fakestoreapi.com/img/51eg55uWmdL._AC_UX679_.jpg', NULL,
        '2026-04-23 15:01:54.481038+00', '2026-04-23 15:01:54.481038+00');
INSERT INTO public.tbl_products
VALUES (2, 'Áo thun nam Dri-FIT', 'MTS-002', 'Áo thun thể thao công nghệ Dri-FIT thoát ẩm nhanh', 870, 890000.00,
        'ACTIVE', 4.5, 5, 1, 0, 'https://images.unsplash.com/photo-1552642986-ccb41e7059e7?w=400&h=400&fit=crop', NULL,
        '2026-04-23 15:01:54.481038+00', '2026-04-23 15:01:54.481038+00');
INSERT INTO public.tbl_products
VALUES (16, 'Đầm maxi hoa nhí', 'WDR-002', 'Đầm maxi họa tiết hoa nhí phong cách vintage', 380, 590000.00, 'ON_SALE',
        4.3, 9, 4, 0, 'https://images.unsplash.com/photo-1595777457583-95e059d581b8?w=400&h=400&fit=crop', NULL,
        '2026-04-23 15:01:54.481038+00', '2026-04-23 15:01:54.481038+00');
INSERT INTO public.tbl_products
VALUES (7, 'Quần jeans nam straight', 'MJN-002', 'Quần jeans ống đứng phong cách cổ điển', 560, 490000.00, 'ACTIVE',
        4.4, 6, 5, 0, 'https://images.unsplash.com/photo-1617114919297-3c8ddb01f599?w=400&h=400&fit=crop', NULL,
        '2026-04-23 15:01:54.481038+00', '2026-04-23 15:01:54.481038+00');
INSERT INTO public.tbl_products
VALUES (12, 'Áo thun nữ cổ tròn basic', 'WTS-001', 'Áo thun nữ cotton mềm mại thoáng mát', 1100, 250000.00,
        'BESTSELLER', 4.8, 8, 5, 0, 'https://fakestoreapi.com/img/71z3kpMAYsL._AC_UY879_.jpg', NULL,
        '2026-04-23 15:01:54.481038+00', '2026-04-23 15:01:54.481038+00');
INSERT INTO public.tbl_products
VALUES (24, 'Giày Air Max 90', 'SNK-001', 'Giày thể thao huyền thoại đệm Air thoải mái', 1100, 3290000.00, 'BESTSELLER',
        4.9, 13, 1, 0,
        'https://images.pexels.com/photos/2048548/pexels-photo-2048548.jpeg?auto=compress&cs=tinysrgb&w=400', NULL,
        '2026-04-23 15:01:54.481038+00', '2026-04-23 15:01:54.481038+00');
INSERT INTO public.tbl_products
VALUES (25, 'Giày Ultraboost', 'SNK-002', 'Giày chạy bộ công nghệ Boost êm ái nhẹ nhàng', 870, 3890000.00, 'ACTIVE',
        4.8, 13, 2, 0,
        'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=400', NULL,
        '2026-04-23 15:01:54.481038+00', '2026-04-23 15:01:54.481038+00');
INSERT INTO public.tbl_products
VALUES (20, 'Nón lưỡi trai logo', 'HAT-001', 'Nón lưỡi trai thêu logo thời trang unisex', 1500, 450000.00, 'BESTSELLER',
        4.6, 11, 1, 0, 'https://images.unsplash.com/photo-1588850561407-ed78c334e67a?w=400&h=400&fit=crop', NULL,
        '2026-04-23 15:01:54.481038+00', '2026-04-23 15:01:54.481038+00');
INSERT INTO public.tbl_products
VALUES (1, 'Áo thun nam cổ tròn basic', 'MTS-001', 'Áo thun cotton 100% thoáng mát, form regular fit', 1250, 299000.00,
        'BESTSELLER', 4.8, 5, 6, 0, 'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=400&h=400&fit=crop',
        NULL, '2026-04-23 15:01:54.481038+00', '2026-04-23 15:01:54.481038+00');
INSERT INTO public.tbl_products
VALUES (18, 'Quần baggy nữ', 'WPN-001', 'Quần baggy ống rộng thoải mái thời trang', 810, 390000.00, 'ACTIVE', 4.5, 10,
        5, 0, 'https://images.unsplash.com/photo-1594633312681-425c7b97ccd1?w=400&h=400&fit=crop', NULL,
        '2026-04-23 15:01:54.481038+00', '2026-04-23 15:01:54.481038+00');
INSERT INTO public.tbl_products
VALUES (27, 'Giày Chuck Taylor', 'SNK-004', 'Giày Converse cổ cao biểu tượng thời trang', 1200, 1590000.00,
        'BESTSELLER', 4.8, 13, 10, 0,
        'https://images.unsplash.com/photo-1601131831144-5d096d7a832c?w=400&h=400&fit=crop', NULL,
        '2026-04-23 15:01:54.481038+00', '2026-04-23 15:01:54.481038+00');
INSERT INTO public.tbl_products
VALUES (23, 'Túi tote nữ canvas', 'BAG-002', 'Túi tote vải canvas phong cách minimalist', 420, 290000.00, 'ACTIVE', 4.4,
        12, 3, 0, 'https://images.unsplash.com/photo-1598532163257-ae3c6b2524b6?w=400&h=400&fit=crop', NULL,
        '2026-04-23 15:01:54.481038+00', '2026-04-23 15:01:54.481038+00');
INSERT INTO public.tbl_products
VALUES (8, 'Quần jeans nam regular', 'MJN-003', 'Quần jeans regular fit thoải mái cho mọi hoạt động', 720, 450000.00,
        'ACTIVE', 4.5, 6, 3, 0, 'https://images.unsplash.com/photo-1542272604-787c3835535d?w=400&h=400&fit=crop', NULL,
        '2026-04-23 15:01:54.481038+00', '2026-04-23 15:01:54.481038+00');


--
-- Data for Name: tbl_promotion_category; Type: TABLE DATA; Schema: public; Owner: postgres
--


--
-- Data for Name: tbl_promotion_product; Type: TABLE DATA; Schema: public; Owner: postgres
--


--
-- Data for Name: tbl_promotions; Type: TABLE DATA; Schema: public; Owner: postgres
--


--
-- Data for Name: tbl_providers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tbl_providers
VALUES (1, 'Nike', 'NIKE', 'Thương hiệu thể thao hàng đầu thế giới', 'contact@nike.com', '0901000001', 'FAMOUS',
        'https://logo.clearbit.com/nike.com', 0, '2026-04-23 15:01:51.588112+00', '2026-04-23 15:01:51.588112+00');
INSERT INTO public.tbl_providers
VALUES (2, 'Adidas', 'ADIDAS', 'Thương hiệu thể thao toàn cầu từ Đức', 'contact@adidas.com', '0901000002', 'FAMOUS',
        'https://logo.clearbit.com/adidas.com', 0, '2026-04-23 15:01:51.588112+00', '2026-04-23 15:01:51.588112+00');
INSERT INTO public.tbl_providers
VALUES (3, 'Uniqlo', 'UNIQLO', 'Thời trang cơ bản chất lượng cao từ Nhật', 'contact@uniqlo.com', '0901000003', 'FAMOUS',
        'https://logo.clearbit.com/uniqlo.com', 0, '2026-04-23 15:01:51.588112+00', '2026-04-23 15:01:51.588112+00');
INSERT INTO public.tbl_providers
VALUES (4, 'Zara', 'ZARA', 'Thời trang nhanh đến từ Tây Ban Nha', 'contact@zara.com', '0901000004', 'FAMOUS',
        'https://logo.clearbit.com/zara.com', 0, '2026-04-23 15:01:51.588112+00', '2026-04-23 15:01:51.588112+00');
INSERT INTO public.tbl_providers
VALUES (5, 'H&M', 'HM', 'Thời trang bình dân từ Thụy Điển', 'contact@hm.com', '0901000005', 'ACTIVE',
        'https://logo.clearbit.com/hm.com', 0, '2026-04-23 15:01:51.588112+00', '2026-04-23 15:01:51.588112+00');
INSERT INTO public.tbl_providers
VALUES (6, 'Coolmate', 'COOL', 'Thương hiệu thời trang nam Việt Nam', 'hello@coolmate.me', '0901000006', 'ACTIVE',
        'https://logo.clearbit.com/coolmate.me', 0, '2026-04-23 15:01:51.588112+00', '2026-04-23 15:01:51.588112+00');
INSERT INTO public.tbl_providers
VALUES (7, 'Routine', 'RTN', 'Thời trang nam thiết kế tối giản', 'contact@routine.vn', '0901000007', 'ACTIVE',
        'https://logo.clearbit.com/routine.vn', 0, '2026-04-23 15:01:51.588112+00', '2026-04-23 15:01:51.588112+00');
INSERT INTO public.tbl_providers
VALUES (8, 'Ivy Moda', 'IVY', 'Thời trang nữ cao cấp Việt Nam', 'contact@ivymoda.com', '0901000008', 'ACTIVE',
        'https://logo.clearbit.com/ivymoda.com', 0, '2026-04-23 15:01:51.588112+00', '2026-04-23 15:01:51.588112+00');
INSERT INTO public.tbl_providers
VALUES (9, 'Vans', 'VANS', 'Giày thời trang đường phố từ Mỹ', 'contact@vans.com', '0901000009', 'ACTIVE',
        'https://logo.clearbit.com/vans.com', 0, '2026-04-23 15:01:51.588112+00', '2026-04-23 15:01:51.588112+00');
INSERT INTO public.tbl_providers
VALUES (10, 'Converse', 'CVS', 'Giày thời trang biểu tượng từ Mỹ', 'contact@converse.com', '0901000010', 'FAMOUS',
        'https://logo.clearbit.com/converse.com', 0, '2026-04-23 15:01:51.588112+00', '2026-04-23 15:01:51.588112+00');


--
-- Data for Name: tbl_recivers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tbl_recivers
VALUES (1, 'string', 'string', 'string', 'string', 'string', 'string', 'string', 'string',
        '54a4371a-76a7-4750-a1ad-99652d31f08f');


--
-- Data for Name: tbl_sizes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tbl_sizes
VALUES (1, 'S', 0.2, 65, '2026-04-23 15:01:53.033068+00', '2026-04-23 15:01:53.033068+00');
INSERT INTO public.tbl_sizes
VALUES (2, 'M', 0.25, 70, '2026-04-23 15:01:53.033068+00', '2026-04-23 15:01:53.033068+00');
INSERT INTO public.tbl_sizes
VALUES (3, 'L', 0.3, 75, '2026-04-23 15:01:53.033068+00', '2026-04-23 15:01:53.033068+00');
INSERT INTO public.tbl_sizes
VALUES (4, 'XL', 0.35, 80, '2026-04-23 15:01:53.033068+00', '2026-04-23 15:01:53.033068+00');
INSERT INTO public.tbl_sizes
VALUES (5, 'XXL', 0.4, 85, '2026-04-23 15:01:53.033068+00', '2026-04-23 15:01:53.033068+00');
INSERT INTO public.tbl_sizes
VALUES (6, 'XXXL', 0.45, 90, '2026-04-23 15:01:53.033068+00', '2026-04-23 15:01:53.033068+00');


--
-- Data for Name: tbl_user_vouchers; Type: TABLE DATA; Schema: public; Owner: postgres
--


--
-- Data for Name: tbl_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tbl_users
VALUES ('f47ac10b-58cc-4372-a567-0e02b2c3d401', 'An', 'Nguyễn Văn', 'https://i.pravatar.cc/150?u=an', 101,
        '2026-04-23 15:02:49.195316+00', '2026-04-23 15:02:49.195316+00');
INSERT INTO public.tbl_users
VALUES ('f47ac10b-58cc-4372-a567-0e02b2c3d402', 'Bình', 'Trần Thị', 'https://i.pravatar.cc/150?u=binh', 102,
        '2026-04-23 15:02:49.195316+00', '2026-04-23 15:02:49.195316+00');
INSERT INTO public.tbl_users
VALUES ('f47ac10b-58cc-4372-a567-0e02b2c3d403', 'Cường', 'Lê Hoàng', 'https://i.pravatar.cc/150?u=cuong', 103,
        '2026-04-23 15:02:49.195316+00', '2026-04-23 15:02:49.195316+00');
INSERT INTO public.tbl_users
VALUES ('f47ac10b-58cc-4372-a567-0e02b2c3d404', 'Dũng', 'Phạm Minh', 'https://i.pravatar.cc/150?u=dung', 104,
        '2026-04-23 15:02:49.195316+00', '2026-04-23 15:02:49.195316+00');
INSERT INTO public.tbl_users
VALUES ('f47ac10b-58cc-4372-a567-0e02b2c3d405', 'Hà', 'Hoàng Thu', 'https://i.pravatar.cc/150?u=ha', 105,
        '2026-04-23 15:02:49.195316+00', '2026-04-23 15:02:49.195316+00');
INSERT INTO public.tbl_users
VALUES ('f47ac10b-58cc-4372-a567-0e02b2c3d406', 'Khoa', 'Võ Đình', 'https://i.pravatar.cc/150?u=khoa', 106,
        '2026-04-23 15:02:49.195316+00', '2026-04-23 15:02:49.195316+00');
INSERT INTO public.tbl_users
VALUES ('f47ac10b-58cc-4372-a567-0e02b2c3d407', 'Linh', 'Đặng Ngọc', 'https://i.pravatar.cc/150?u=linh', 107,
        '2026-04-23 15:02:49.195316+00', '2026-04-23 15:02:49.195316+00');
INSERT INTO public.tbl_users
VALUES ('f47ac10b-58cc-4372-a567-0e02b2c3d408', 'Mai', 'Bùi Thanh', 'https://i.pravatar.cc/150?u=mai', 108,
        '2026-04-23 15:02:49.195316+00', '2026-04-23 15:02:49.195316+00');
INSERT INTO public.tbl_users
VALUES ('f47ac10b-58cc-4372-a567-0e02b2c3d409', 'Nam', 'Ngô Quốc', 'https://i.pravatar.cc/150?u=nam', 109,
        '2026-04-23 15:02:49.195316+00', '2026-04-23 15:02:49.195316+00');
INSERT INTO public.tbl_users
VALUES ('f47ac10b-58cc-4372-a567-0e02b2c3d410', 'Phương', 'Dương Thùy', 'https://i.pravatar.cc/150?u=phuong', 110,
        '2026-04-23 15:02:49.195316+00', '2026-04-23 15:02:49.195316+00');
INSERT INTO public.tbl_users
VALUES ('d54d389a-87fb-410c-a8b5-1b7d8c98b848', NULL, NULL, NULL, 2, '2026-05-18 17:18:19.587691+00',
        '2026-05-18 17:18:19.587691+00');
INSERT INTO public.tbl_users
VALUES ('54a4371a-76a7-4750-a1ad-99652d31f08f', NULL, NULL, NULL, 113, '2026-05-18 17:39:49.583034+00',
        '2026-05-18 17:39:49.583034+00');
INSERT INTO public.tbl_users
VALUES ('aece85b7-c2c9-4415-a6b4-55f6d1afad47', NULL, NULL, NULL, 6, '2026-05-19 11:09:55.178093+00',
        '2026-05-19 11:09:55.178104+00');


--
-- Data for Name: tbl_vouchers; Type: TABLE DATA; Schema: public; Owner: postgres
--


--
-- Name: tbl_accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tbl_accounts_id_seq', 119, true);


--
-- Name: tbl_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tbl_categories_id_seq', 14, true);


--
-- Name: tbl_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tbl_notifications_id_seq', 7, true);


--
-- Name: tbl_orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tbl_orders_id_seq', 7, true);


--
-- Name: tbl_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tbl_products_id_seq', 31, true);


--
-- Name: tbl_promotions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tbl_promotions_id_seq', 1, false);


--
-- Name: tbl_providers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tbl_providers_id_seq', 10, true);


--
-- Name: tbl_recivers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tbl_recivers_id_seq', 1, true);


--
-- Name: tbl_sizes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tbl_sizes_id_seq', 6, true);


--
-- Name: tbl_vouchers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tbl_vouchers_id_seq', 1, false);


--
-- Name: tbl_accounts tbl_accounts_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_accounts
    ADD CONSTRAINT tbl_accounts_email_key UNIQUE (email);


--
-- Name: tbl_accounts tbl_accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_accounts
    ADD CONSTRAINT tbl_accounts_pkey PRIMARY KEY (id);


--
-- Name: tbl_accounts tbl_accounts_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_accounts
    ADD CONSTRAINT tbl_accounts_username_key UNIQUE (username);


--
-- Name: tbl_cart_items tbl_cart_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_cart_items
    ADD CONSTRAINT tbl_cart_items_pkey PRIMARY KEY (user_id, product_id, size_id);


--
-- Name: tbl_categories tbl_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_categories
    ADD CONSTRAINT tbl_categories_pkey PRIMARY KEY (id);


--
-- Name: tbl_comments tbl_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_comments
    ADD CONSTRAINT tbl_comments_pkey PRIMARY KEY (product_id, user_id);


--
-- Name: tbl_items tbl_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_items
    ADD CONSTRAINT tbl_items_pkey PRIMARY KEY (product_id, size_id);


--
-- Name: tbl_notifications tbl_notifications_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_notifications
    ADD CONSTRAINT tbl_notifications_code_key UNIQUE (code);


--
-- Name: tbl_notifications tbl_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_notifications
    ADD CONSTRAINT tbl_notifications_pkey PRIMARY KEY (id);


--
-- Name: tbl_order_items tbl_order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_order_items
    ADD CONSTRAINT tbl_order_items_pkey PRIMARY KEY (order_id, product_id, size_id);


--
-- Name: tbl_orders tbl_orders_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_orders
    ADD CONSTRAINT tbl_orders_code_key UNIQUE (code);


--
-- Name: tbl_orders tbl_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_orders
    ADD CONSTRAINT tbl_orders_pkey PRIMARY KEY (id);


--
-- Name: tbl_products tbl_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_products
    ADD CONSTRAINT tbl_products_pkey PRIMARY KEY (id);


--
-- Name: tbl_promotion_category tbl_promotion_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_promotion_category
    ADD CONSTRAINT tbl_promotion_category_pkey PRIMARY KEY (category_id, promotion_id);


--
-- Name: tbl_promotion_product tbl_promotion_product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_promotion_product
    ADD CONSTRAINT tbl_promotion_product_pkey PRIMARY KEY (product_id, promotion_id);


--
-- Name: tbl_promotions tbl_promotions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_promotions
    ADD CONSTRAINT tbl_promotions_pkey PRIMARY KEY (id);


--
-- Name: tbl_providers tbl_providers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_providers
    ADD CONSTRAINT tbl_providers_pkey PRIMARY KEY (id);


--
-- Name: tbl_recivers tbl_recivers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_recivers
    ADD CONSTRAINT tbl_recivers_pkey PRIMARY KEY (id);


--
-- Name: tbl_sizes tbl_sizes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_sizes
    ADD CONSTRAINT tbl_sizes_pkey PRIMARY KEY (id);


--
-- Name: tbl_user_vouchers tbl_user_vouchers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_user_vouchers
    ADD CONSTRAINT tbl_user_vouchers_pkey PRIMARY KEY (voucher_id, user_id);


--
-- Name: tbl_users tbl_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_users
    ADD CONSTRAINT tbl_users_pkey PRIMARY KEY (id);


--
-- Name: tbl_vouchers tbl_vouchers_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_vouchers
    ADD CONSTRAINT tbl_vouchers_code_key UNIQUE (code);


--
-- Name: tbl_vouchers tbl_vouchers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_vouchers
    ADD CONSTRAINT tbl_vouchers_pkey PRIMARY KEY (id);


--
-- Name: tbl_user_vouchers uk_user_voucher; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_user_vouchers
    ADD CONSTRAINT uk_user_voucher UNIQUE (user_id, voucher_id);


--
-- Name: tbl_accounts ukoshwg9cg1y475p5ppsip091ed; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_accounts
    ADD CONSTRAINT ukoshwg9cg1y475p5ppsip091ed UNIQUE (email);


--
-- Name: tbl_cart_items fk_cart_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_cart_items
    ADD CONSTRAINT fk_cart_product FOREIGN KEY (product_id) REFERENCES public.tbl_products (id);


--
-- Name: tbl_cart_items fk_cart_size; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_cart_items
    ADD CONSTRAINT fk_cart_size FOREIGN KEY (size_id) REFERENCES public.tbl_sizes (id);


--
-- Name: tbl_cart_items fk_cart_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_cart_items
    ADD CONSTRAINT fk_cart_user FOREIGN KEY (user_id) REFERENCES public.tbl_users (id);


--
-- Name: tbl_categories fk_category_parent; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_categories
    ADD CONSTRAINT fk_category_parent FOREIGN KEY (parent_id) REFERENCES public.tbl_categories (id) ON DELETE SET NULL;


--
-- Name: tbl_comments fk_comment_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_comments
    ADD CONSTRAINT fk_comment_product FOREIGN KEY (product_id) REFERENCES public.tbl_products (id);


--
-- Name: tbl_items fk_item_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_items
    ADD CONSTRAINT fk_item_product FOREIGN KEY (product_id) REFERENCES public.tbl_products (id) ON DELETE CASCADE;


--
-- Name: tbl_items fk_item_size; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_items
    ADD CONSTRAINT fk_item_size FOREIGN KEY (size_id) REFERENCES public.tbl_sizes (id) ON DELETE CASCADE;


--
-- Name: tbl_order_items fk_oi_order; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_order_items
    ADD CONSTRAINT fk_oi_order FOREIGN KEY (order_id) REFERENCES public.tbl_orders (id);


--
-- Name: tbl_promotion_category fk_pc_promotion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_promotion_category
    ADD CONSTRAINT fk_pc_promotion FOREIGN KEY (promotion_id) REFERENCES public.tbl_promotions (id) ON DELETE CASCADE;


--
-- Name: tbl_promotion_product fk_pp_promotion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_promotion_product
    ADD CONSTRAINT fk_pp_promotion FOREIGN KEY (promotion_id) REFERENCES public.tbl_promotions (id);


--
-- Name: tbl_products fk_product_category; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_products
    ADD CONSTRAINT fk_product_category FOREIGN KEY (category_id) REFERENCES public.tbl_categories (id);


--
-- Name: tbl_products fk_product_provider; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_products
    ADD CONSTRAINT fk_product_provider FOREIGN KEY (provider_id) REFERENCES public.tbl_providers (id);


--
-- Name: tbl_recivers fk_receiver_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_recivers
    ADD CONSTRAINT fk_receiver_user FOREIGN KEY (user_id) REFERENCES public.tbl_users (id);


--
-- Name: tbl_user_vouchers fk_uv_voucher; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_user_vouchers
    ADD CONSTRAINT fk_uv_voucher FOREIGN KEY (voucher_id) REFERENCES public.tbl_vouchers (id);


--
-- PostgreSQL database dump complete
--

\unrestrict 8k2FNQYmPxs8IRgxQUwMpyKrW6Vbc22VcESW7u85NNtXqsIrsgpr2WfNQTzVCib

