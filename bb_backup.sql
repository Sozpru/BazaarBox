PGDMP                         {            bb    15.3    15.3                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16398    bb    DATABASE     d   CREATE DATABASE bb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';
    DROP DATABASE bb;
                postgres    false                        2615    16759    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                postgres    false                       0    0    SCHEMA public    COMMENT         COMMENT ON SCHEMA public IS '';
                   postgres    false    5                        0    0    SCHEMA public    ACL     +   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
                   postgres    false    5            �            1259    16770    Item    TABLE       CREATE TABLE public."Item" (
    id integer NOT NULL,
    item_name text NOT NULL,
    description text,
    category text,
    image_url text DEFAULT 'https://nayemdevs.com/wp-content/uploads/2020/03/default-product-image.png'::text,
    price double precision DEFAULT 0
);
    DROP TABLE public."Item";
       public         heap    postgres    false    5            �            1259    16769    Item_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Item_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public."Item_id_seq";
       public          postgres    false    216    5            !           0    0    Item_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public."Item_id_seq" OWNED BY public."Item".id;
          public          postgres    false    215            �            1259    16779    User    TABLE     �   CREATE TABLE public."User" (
    id integer NOT NULL,
    username text NOT NULL,
    password text NOT NULL,
    email text NOT NULL,
    "isAdmin" boolean NOT NULL
);
    DROP TABLE public."User";
       public         heap    postgres    false    5            �            1259    16778    User_id_seq    SEQUENCE     �   CREATE SEQUENCE public."User_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public."User_id_seq";
       public          postgres    false    5    218            "           0    0    User_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public."User_id_seq" OWNED BY public."User".id;
          public          postgres    false    217            �            1259    16760    _prisma_migrations    TABLE     �  CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);
 &   DROP TABLE public._prisma_migrations;
       public         heap    postgres    false    5            z           2604    16773    Item id    DEFAULT     f   ALTER TABLE ONLY public."Item" ALTER COLUMN id SET DEFAULT nextval('public."Item_id_seq"'::regclass);
 8   ALTER TABLE public."Item" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216            }           2604    16782    User id    DEFAULT     f   ALTER TABLE ONLY public."User" ALTER COLUMN id SET DEFAULT nextval('public."User_id_seq"'::regclass);
 8   ALTER TABLE public."User" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    218    218                      0    16770    Item 
   TABLE DATA           X   COPY public."Item" (id, item_name, description, category, image_url, price) FROM stdin;
    public          postgres    false    216   <                 0    16779    User 
   TABLE DATA           J   COPY public."User" (id, username, password, email, "isAdmin") FROM stdin;
    public          postgres    false    218   �                 0    16760    _prisma_migrations 
   TABLE DATA           �   COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
    public          postgres    false    214   �       #           0    0    Item_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."Item_id_seq"', 17, true);
          public          postgres    false    215            $           0    0    User_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."User_id_seq"', 1, false);
          public          postgres    false    217            �           2606    16777    Item Item_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."Item"
    ADD CONSTRAINT "Item_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."Item" DROP CONSTRAINT "Item_pkey";
       public            postgres    false    216            �           2606    16786    User User_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."User" DROP CONSTRAINT "User_pkey";
       public            postgres    false    218                       2606    16768 *   _prisma_migrations _prisma_migrations_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public._prisma_migrations DROP CONSTRAINT _prisma_migrations_pkey;
       public            postgres    false    214            �           1259    16788    User_email_key    INDEX     K   CREATE UNIQUE INDEX "User_email_key" ON public."User" USING btree (email);
 $   DROP INDEX public."User_email_key";
       public            postgres    false    218            �           1259    16787    User_username_key    INDEX     Q   CREATE UNIQUE INDEX "User_username_key" ON public."User" USING btree (username);
 '   DROP INDEX public."User_username_key";
       public            postgres    false    218               j  x�u��n� ���S�v���Y����R��"c��
����K�6���#�f`>~�OU���Yz(d���:���O�y���~$��-�1�옳(�NO*���z�IZ-�Ƨkܺ>��#��A^��Й����F:��5(���j���܃;UL5��]4)ON.�t��h���z��vhr�������br��gH�û��0�!�%M�@�.�[�'W��L~����eYQޫ,���{l�P���Roe��=o��U�{�7|WCg�@��V-,��.�g���p~'��B��l��;��>��V$�-���V��c�������DPy
ل����;�pf������'I��ʲ�� �9            x������ � �         r  x���K�\1EǯV�yp��%�"��� �3d���R�AӁc�E�Ȃ�(B�B��X-Fy˰Z�XB|mF�>�������"�9���0C�+�w��it��������N��+��*t4dr�3֏_�����<���ͣ��gk�9�wꍻ�B7#����:��s�V)��q�>��He�)��$�7��Ԃ>?����A��5�����,m��&g�-��9�v���µ�� �����3�w ^�EH�6� �m�����r��%�h��'w��*�}�����-=��T����VAE�<�j��iYg�rLV�d�)6T�MB��O(�N!���� x���G�T���~��n �8��     