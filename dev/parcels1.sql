--
-- Name: parcel_states; Type: TABLE; Schema: public; Owner: auction
--

CREATE TABLE parcel_states (
    id text NOT NULL,
    x integer NOT NULL,
    y integer NOT NULL,
    address character varying(42),
    amount text,
    "endsAt" timestamp without time zone,
    "bidIndex" integer,
    "bidGroupId" integer,
    "projectId" text,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone
);


ALTER TABLE parcel_states OWNER TO auction;
--

COPY parcel_states (id, x, y, address, amount, "endsAt", "bidIndex", "bidGroupId", "projectId", "createdAt", "updatedAt") FROM stdin;
