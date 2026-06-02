create sequence tbl_recivers_id_seq
    as integer;

alter sequence tbl_recivers_id_seq owner to postgres;

create table tbl_accounts
(
    id         serial
        primary key,
    username   varchar(50)                                                    not null
        unique,
    password   varchar(255)                                                   not null,
    role       varchar(10)              default 'CUSTOMER'::character varying not null
        constraint chk_accounts_role
            check ((role)::text = ANY
                   (ARRAY [('CUSTOMER'::character varying)::text, ('ADMIN'::character varying)::text, ('EMPLOYEE'::character varying)::text])),
    email      varchar(100)                                                   not null
        unique
        constraint ukoshwg9cg1y475p5ppsip091ed
            unique,
    verify     boolean                  default false                         not null,
    status     varchar(10)              default 'ACTIVE'::character varying   not null
        constraint chk_accounts_status
            check ((status)::text = ANY
                   (ARRAY [('ACTIVE'::character varying)::text, ('INACTIVE'::character varying)::text, ('BANNED'::character varying)::text])),
    created_at timestamp with time zone default CURRENT_TIMESTAMP,
    updated_at timestamp with time zone default CURRENT_TIMESTAMP
);

alter table tbl_accounts
    owner to postgres;

create table tbl_categories
(
    id          serial
        primary key,
    name        varchar(50)                           not null,
    code        varchar(10)                           not null,
    img_url     varchar(255),
    description varchar(50),
    status      varchar(20)              default 'ACTIVE'::character varying
        constraint chk_category_status
            check ((status)::text = ANY
                   (ARRAY [('ACTIVE'::character varying)::text, ('HIDDEN'::character varying)::text])),
    parent_id   integer
        constraint fk_category_parent
            references tbl_categories
            on delete set null,
    is_leaf     boolean                  default true not null,
    level       integer                  default 0    not null,
    path        varchar(255),
    version     bigint                   default 0    not null,
    created_at  timestamp with time zone default CURRENT_TIMESTAMP,
    updated_at  timestamp with time zone default CURRENT_TIMESTAMP
);

alter table tbl_categories
    owner to postgres;

create table tbl_notifications
(
    id          serial
        primary key,
    code        varchar(30)
        unique,
    sender_id   uuid,
    receiver_id uuid,
    type        varchar(20)           not null,
    title       varchar(100),
    message     text,
    created_at  timestamp(6) with time zone,
    updated_at  timestamp(6) with time zone,
    for_admin   boolean default true  not null,
    is_delete   boolean default false not null,
    readed      boolean default false not null
);

alter table tbl_notifications
    owner to postgres;

create table tbl_orders
(
    id               serial
        primary key,
    code             varchar(20)                                                   not null
        unique,
    status           varchar(20)              default 'PENDING'::character varying not null
        constraint chk_order_status
            check ((status)::text = ANY
                   (ARRAY [('UNPAID'::character varying)::text, ('PENDING'::character varying)::text, ('CONFIRMED'::character varying)::text, ('SHIPPING'::character varying)::text, ('DELIVERED'::character varying)::text, ('COMPLETED'::character varying)::text, ('CANCELLED'::character varying)::text, ('RETURNED'::character varying)::text])),
    voucher_code     varchar(30),
    total_price      numeric(38, 2)                                                not null,
    voucher_discount numeric(38, 2),
    final_price      numeric(38, 2)                                                not null,
    note             varchar(500),
    version          bigint                   default 0                            not null,
    user_id          uuid                                                          not null,
    receiver_id      integer                                                       not null,
    created_at       timestamp with time zone default CURRENT_TIMESTAMP,
    updated_at       timestamp with time zone default CURRENT_TIMESTAMP,
    payment_type     varchar(255)
        constraint tbl_orders_payment_type_check
            check ((payment_type)::text = ANY
                   (ARRAY [('PAYMENT_UPON_DELIVER'::character varying)::text, ('ONLINE'::character varying)::text]))
);

alter table tbl_orders
    owner to postgres;

create table tbl_order_items
(
    order_id       integer        not null
        constraint fk_oi_order
            references tbl_orders
            on delete cascade,
    product_id     integer        not null,
    size_id        integer        not null,
    quantity       integer        not null,
    total_price    numeric(38, 2) not null,
    final_price    numeric(38, 2) not null,
    original_price numeric(38, 2) not null,
    primary key (order_id, product_id, size_id)
);

alter table tbl_order_items
    owner to postgres;

create table tbl_promotions
(
    id       serial
        primary key,
    value    integer                                                      not null,
    start_at timestamp with time zone default CURRENT_TIMESTAMP,
    end_at   timestamp with time zone,
    priority integer                  default 1,
    status   varchar(20)              default 'SCHEDULED'::character varying
        constraint chk_promo_status
            check ((status)::text = ANY
                   (ARRAY [('SCHEDULED'::character varying)::text, ('ACTIVE'::character varying)::text, ('ENDED'::character varying)::text, ('DELETED'::character varying)::text])),
    scope    varchar(20)              default 'GLOBAL'::character varying not null
        constraint chk_promo_scope
            check ((scope)::text = ANY
                   (ARRAY [('GLOBAL'::character varying)::text, ('PRODUCT'::character varying)::text, ('CATEGORY'::character varying)::text, ('PROVIDER'::character varying)::text])),
    version  bigint                   default 0                           not null
);

alter table tbl_promotions
    owner to postgres;

create table tbl_promotion_category
(
    category_id  integer not null,
    promotion_id integer not null
        constraint fk_pc_promotion
            references tbl_promotions
            on delete cascade,
    primary key (category_id, promotion_id)
);

alter table tbl_promotion_category
    owner to postgres;

create table tbl_promotion_product
(
    product_id   integer not null,
    promotion_id integer not null
        constraint fk_pp_promotion
            references tbl_promotions,
    primary key (product_id, promotion_id)
);

alter table tbl_promotion_product
    owner to postgres;

create table tbl_providers
(
    id          serial
        primary key,
    name        varchar(50)                        not null,
    code        varchar(10)                        not null,
    description varchar(255),
    email       varchar(100),
    phone       varchar(15),
    status      varchar(20)              default 'ACTIVE'::character varying
        constraint chk_provider_status
            check ((status)::text = ANY
                   (ARRAY [('ACTIVE'::character varying)::text, ('INACTIVE'::character varying)::text, ('FAMOUS'::character varying)::text])),
    logo        varchar(255),
    version     bigint                   default 0 not null,
    created_at  timestamp with time zone default CURRENT_TIMESTAMP,
    updated_at  timestamp with time zone default CURRENT_TIMESTAMP
);

alter table tbl_providers
    owner to postgres;

create table tbl_products
(
    id            serial
        primary key,
    name          varchar(50)                                                  not null,
    code          varchar(30)                                                  not null,
    description   varchar(255),
    quantity_sold integer                  default 0,
    price         numeric(38, 2)           default 0,
    status        varchar(20)              default 'ACTIVE'::character varying not null
        constraint chk_product_status
            check ((status)::text = ANY
                   (ARRAY [('ACTIVE'::character varying)::text, ('ON_SALE'::character varying)::text, ('OUT_OF_STOCK'::character varying)::text, ('BESTSELLER'::character varying)::text, ('DELETED'::character varying)::text])),
    rated         real,
    category_id   integer
        constraint fk_product_category
            references tbl_categories,
    provider_id   integer
        constraint fk_product_provider
            references tbl_providers,
    version       bigint                   default 0                           not null,
    img           varchar(255),
    video         varchar(255),
    created_at    timestamp with time zone default CURRENT_TIMESTAMP,
    updated_at    timestamp with time zone default CURRENT_TIMESTAMP
);

alter table tbl_products
    owner to postgres;

create table tbl_comments
(
    product_id integer not null
        constraint fk_comment_product
            references tbl_products,
    user_id    uuid    not null,
    content    text    not null,
    rating     real,
    created_at timestamp with time zone default CURRENT_TIMESTAMP,
    updated_at timestamp with time zone default CURRENT_TIMESTAMP,
    primary key (product_id, user_id)
);

alter table tbl_comments
    owner to postgres;

create table tbl_sizes
(
    id         serial
        primary key,
    size       varchar(255),
    weight     double precision,
    height     double precision,
    created_at timestamp with time zone default CURRENT_TIMESTAMP,
    updated_at timestamp with time zone default CURRENT_TIMESTAMP
);

alter table tbl_sizes
    owner to postgres;

create table tbl_items
(
    product_id integer           not null
        constraint fk_item_product
            references tbl_products
            on delete cascade,
    size_id    integer           not null
        constraint fk_item_size
            references tbl_sizes
            on delete cascade,
    quantity   integer default 0 not null,
    status     varchar(255)
        constraint chk_item_status
            check ((status)::text = ANY
                   (ARRAY [('AVAILABLE'::character varying)::text, ('OUT_OF_STOCK'::character varying)::text, ('DISCONTINUED'::character varying)::text])),
    primary key (product_id, size_id)
);

alter table tbl_items
    owner to postgres;

create table tbl_ranks
(
    id           serial
        primary key,
    type         varchar(255)
        constraint chk_tbl_ranks_type
            check ((type)::text = ANY
                   ((ARRAY ['Bronze'::character varying, 'Silver'::character varying, 'Gold'::character varying, 'Platinum'::character varying, 'Diamond'::character varying, 'Ultimate'::character varying])::text[])),
    level        integer                  not null
        constraint chk_tbl_ranks_level
            check (level > 0),
    min_purchase numeric(38, 2) default 0 not null,
    expire_time  bigint
);

alter table tbl_ranks
    owner to postgres;

create table tbl_users
(
    id                 uuid                     default gen_random_uuid() not null
        primary key,
    f_name             varchar(255),
    l_name             varchar(255),
    avatar             varchar(255),
    acc_id             integer
        constraint tbl_users_tbl_accounts__fk
            references tbl_accounts
            on delete cascade,
    created_at         timestamp with time zone default CURRENT_TIMESTAMP,
    updated_at         timestamp with time zone default CURRENT_TIMESTAMP,
    last_purchase_time timestamp with time zone,
    toltal_purchase    numeric(38, 2)           default 0,
    rank_id            integer
        constraint tbl_users_tbl_ranks__fk
            references tbl_ranks
            on delete cascade
);

alter table tbl_users
    owner to postgres;

create table tbl_cart_items
(
    user_id    uuid    not null
        constraint fk_cart_user
            references tbl_users,
    product_id integer not null
        constraint fk_cart_product
            references tbl_products,
    size_id    integer not null
        constraint fk_cart_size
            references tbl_sizes,
    quantity   integer not null,
    created_at timestamp with time zone default CURRENT_TIMESTAMP,
    updated_at timestamp with time zone default CURRENT_TIMESTAMP,
    primary key (user_id, product_id, size_id)
);

alter table tbl_cart_items
    owner to postgres;

create table tbl_receivers
(
    id       integer default nextval('tbl_recivers_id_seq'::regclass) not null
        constraint tbl_recivers_pkey
            primary key,
    f_name   varchar(100),
    l_name   varchar(100),
    phone    varchar(10)                                              not null,
    country  varchar(20)                                              not null,
    province varchar(20)                                              not null,
    district varchar(20)                                              not null,
    street   varchar(100)                                             not null,
    detail   varchar(255),
    user_id  uuid                                                     not null
        constraint fk_receiver_user
            references tbl_users
            on delete cascade
);

alter table tbl_receivers
    owner to postgres;

alter sequence tbl_recivers_id_seq owned by tbl_receivers.id;

create table tbl_vouchers
(
    id               serial
        primary key,
    code             varchar(30)                                                  not null
        unique,
    status           varchar(20)              default 'ACTIVE'::character varying not null
        constraint chk_voucher_status
            check ((status)::text = ANY
                   ((ARRAY ['ACTIVE'::character varying, 'INACTIVE'::character varying, 'COMMING_SOON'::character varying])::text[])),
    value            numeric(38, 2)                                               not null,
    min_order_amount numeric(38, 2)           default 0                           not null,
    start_at         timestamp with time zone,
    end_at           timestamp with time zone,
    version          bigint                   default 0                           not null,
    created_at       timestamp with time zone default CURRENT_TIMESTAMP,
    updated_at       timestamp with time zone default CURRENT_TIMESTAMP,
    discount_type    varchar(20)                                                  not null
        constraint chk_voucher_discount_type
            check ((discount_type)::text = ANY
                   ((ARRAY ['PERCENT'::character varying, 'FIXED'::character varying])::text[])),
    voucher_type     varchar(20)                                                  not null
        constraint chk_voucher_type
            check ((voucher_type)::text = ANY
                   ((ARRAY ['NEWBIE'::character varying, 'GLOBAL'::character varying, 'USER_RANK'::character varying])::text[])),
    rank_id          integer
        constraint fk_vouchers_rank
            references tbl_ranks,
    constraint chk_voucher_value_valid
        check ((value > (0)::numeric) AND (((discount_type)::text <> 'PERCENT'::text) OR (value <= (100)::numeric))),
    constraint chk_voucher_rank_required
        check (((voucher_type)::text <> 'USER_RANK'::text) OR (rank_id IS NOT NULL))
);

alter table tbl_vouchers
    owner to postgres;

create table tbl_user_vouchers
(
    voucher_id      integer                                            not null
        constraint fk_uv_voucher
            references tbl_vouchers,
    user_id         uuid                                               not null,
    status          varchar(20) default 'AVAILABLE'::character varying not null
        constraint chk_uv_status
            check ((status)::text = ANY
                   (ARRAY [('AVAILABLE'::character varying)::text, ('USED'::character varying)::text, ('EXPIRED'::character varying)::text])),
    end_at          timestamp with time zone,
    min_price_apply numeric(38, 2),
    version         bigint      default 0                              not null,
    primary key (voucher_id, user_id),
    constraint uk_user_voucher
        unique (user_id, voucher_id)
);

alter table tbl_user_vouchers
    owner to postgres;

create unique index uk_tbl_ranks_type
    on tbl_ranks (type);

create unique index uk_tbl_ranks_level
    on tbl_ranks (level);

