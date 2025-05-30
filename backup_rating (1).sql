PGDMP                       }            ratings_platform    17.4    17.4     =           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            >           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            @           1262    16623    ratings_platform    DATABASE     v   CREATE DATABASE ratings_platform WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en-US';
     DROP DATABASE ratings_platform;
                     postgres    false            �            1259    16653    ratings    TABLE     �   CREATE TABLE public.ratings (
    id integer NOT NULL,
    user_id integer,
    store_id integer,
    rating integer,
    CONSTRAINT ratings_rating_check CHECK (((rating >= 1) AND (rating <= 5)))
);
    DROP TABLE public.ratings;
       public         heap r       postgres    false            �            1259    16652    ratings_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ratings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.ratings_id_seq;
       public               postgres    false    222            A           0    0    ratings_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.ratings_id_seq OWNED BY public.ratings.id;
          public               postgres    false    221            �            1259    16637    stores    TABLE     �   CREATE TABLE public.stores (
    id integer NOT NULL,
    name character varying(60) NOT NULL,
    email character varying(100) NOT NULL,
    address character varying(400),
    owner_id integer
);
    DROP TABLE public.stores;
       public         heap r       postgres    false            �            1259    16636    stores_id_seq    SEQUENCE     �   CREATE SEQUENCE public.stores_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.stores_id_seq;
       public               postgres    false    220            B           0    0    stores_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.stores_id_seq OWNED BY public.stores.id;
          public               postgres    false    219            �            1259    16625    users    TABLE     �  CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(60) NOT NULL,
    email character varying(100) NOT NULL,
    address character varying(400),
    password text NOT NULL,
    role character varying(20) NOT NULL,
    CONSTRAINT users_role_check CHECK (((role)::text = ANY ((ARRAY['admin'::character varying, 'user'::character varying, 'owner'::character varying])::text[])))
);
    DROP TABLE public.users;
       public         heap r       postgres    false            �            1259    16624    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public               postgres    false    218            C           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public               postgres    false    217            �           2604    16656 
   ratings id    DEFAULT     h   ALTER TABLE ONLY public.ratings ALTER COLUMN id SET DEFAULT nextval('public.ratings_id_seq'::regclass);
 9   ALTER TABLE public.ratings ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    222    221    222            �           2604    16640 	   stores id    DEFAULT     f   ALTER TABLE ONLY public.stores ALTER COLUMN id SET DEFAULT nextval('public.stores_id_seq'::regclass);
 8   ALTER TABLE public.stores ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    219    220    220            �           2604    16628    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    217    218    218            :          0    16653    ratings 
   TABLE DATA           @   COPY public.ratings (id, user_id, store_id, rating) FROM stdin;
    public               postgres    false    222   3#       8          0    16637    stores 
   TABLE DATA           D   COPY public.stores (id, name, email, address, owner_id) FROM stdin;
    public               postgres    false    220   y#       6          0    16625    users 
   TABLE DATA           I   COPY public.users (id, name, email, address, password, role) FROM stdin;
    public               postgres    false    218   %$       D           0    0    ratings_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.ratings_id_seq', 1, false);
          public               postgres    false    221            E           0    0    stores_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.stores_id_seq', 1, false);
          public               postgres    false    219            F           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 12, true);
          public               postgres    false    217            �           2606    16659    ratings ratings_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.ratings DROP CONSTRAINT ratings_pkey;
       public                 postgres    false    222            �           2606    16661 $   ratings ratings_user_id_store_id_key 
   CONSTRAINT     l   ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_user_id_store_id_key UNIQUE (user_id, store_id);
 N   ALTER TABLE ONLY public.ratings DROP CONSTRAINT ratings_user_id_store_id_key;
       public                 postgres    false    222    222            �           2606    16646    stores stores_email_key 
   CONSTRAINT     S   ALTER TABLE ONLY public.stores
    ADD CONSTRAINT stores_email_key UNIQUE (email);
 A   ALTER TABLE ONLY public.stores DROP CONSTRAINT stores_email_key;
       public                 postgres    false    220            �           2606    16644    stores stores_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.stores
    ADD CONSTRAINT stores_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.stores DROP CONSTRAINT stores_pkey;
       public                 postgres    false    220            �           2606    16635    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public                 postgres    false    218            �           2606    16633    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public                 postgres    false    218            �           2606    16667    ratings ratings_store_id_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_store_id_fkey FOREIGN KEY (store_id) REFERENCES public.stores(id);
 G   ALTER TABLE ONLY public.ratings DROP CONSTRAINT ratings_store_id_fkey;
       public               postgres    false    220    222    4764            �           2606    16662    ratings ratings_user_id_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 F   ALTER TABLE ONLY public.ratings DROP CONSTRAINT ratings_user_id_fkey;
       public               postgres    false    218    4760    222            �           2606    16647    stores stores_owner_id_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public.stores
    ADD CONSTRAINT stores_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES public.users(id);
 E   ALTER TABLE ONLY public.stores DROP CONSTRAINT stores_owner_id_fkey;
       public               postgres    false    218    4760    220            :   6   x���  �j{�|�a���:Ɇ����d�� �
.Q#\�3�V	��H~ ��      8   �   x�U���@�뽧� D0FJ��h���fs�@�c�rD}{�Ćn�囙N�C[�,U,��l�C��8��!�1ZOx�<�k;X��lۛ���������H���^�#���Q�
��==�*��Ƙ�gժ�?�oȍ:B�0���A>AT      6   �   x�u�MsC@ ����98�nJp+���:�E3�,�z'� |�f��1�g��\~2`]^�~7��[Qz�.j!��-�&��k��}�S���$;�1M���ޢ̳ �͂��t���%�#W��^�p%�Ct�
3�S��Q��]��zd���$�ڀ���IKW��C�|t	;���n{���tS�0����3BViAs��<�h�����"eb���h���5ːNchE�B5��F����F_/�?�-p��e�     