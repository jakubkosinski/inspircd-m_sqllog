--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: events; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE events (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    nick character varying(255),
    ip character varying(255),
    host character varying(255),
    user_name character varying(255),
    ident character varying(255),
    server character varying(255),
    channel character varying(255),
    message text,
    created_at timestamp without time zone DEFAULT now(),
    event character varying(255)
);


--
-- Name: events_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: index_on_events_channel; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_on_events_channel ON events USING btree (channel);


--
-- Name: index_on_events_created_at; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_on_events_created_at ON events USING btree (created_at);


--
-- Name: index_on_events_event; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_on_events_event ON events USING btree (event);


--
-- Name: index_on_events_message; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_on_events_message ON events USING gin (to_tsvector('simple'::regconfig, message));


--
-- Name: index_on_events_nick; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_on_events_nick ON events USING btree (nick);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user",public;
