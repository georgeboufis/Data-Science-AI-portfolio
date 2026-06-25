// Reproducible Neo4j graph for the shared-housing GraphRAG QA project.
// Run in Neo4j Browser, cypher-shell, or Aura Query:
// :source create_graph.cypher

// ---------- Constraints ----------
CREATE CONSTRAINT apartment_id_unique IF NOT EXISTS
FOR (a:Apartment) REQUIRE a.apartmentId IS UNIQUE;

CREATE CONSTRAINT owner_id_unique IF NOT EXISTS
FOR (o:Owner) REQUIRE o.ownerId IS UNIQUE;

CREATE CONSTRAINT roommate_id_unique IF NOT EXISTS
FOR (r:Roommate) REQUIRE r.roommateId IS UNIQUE;

CREATE CONSTRAINT amenity_id_unique IF NOT EXISTS
FOR (am:Amenity) REQUIRE am.amenityId IS UNIQUE;

CREATE CONSTRAINT rule_id_unique IF NOT EXISTS
FOR (ru:Rule) REQUIRE ru.ruleId IS UNIQUE;

// ---------- Indexes ----------
CREATE INDEX apartment_location_index IF NOT EXISTS
FOR (a:Apartment) ON (a.location);

CREATE INDEX apartment_rent_index IF NOT EXISTS
FOR (a:Apartment) ON (a.rent);

CREATE INDEX amenity_name_index IF NOT EXISTS
FOR (am:Amenity) ON (am.name);

CREATE INDEX roommate_name_index IF NOT EXISTS
FOR (r:Roommate) ON (r.name);

CREATE INDEX owner_name_index IF NOT EXISTS
FOR (o:Owner) ON (o.name);

// ---------- Clean existing project data ----------
MATCH (n)
WHERE n:Apartment OR n:Owner OR n:Roommate OR n:Amenity OR n:Rule
DETACH DELETE n;

// ---------- Apartments ----------
MERGE (a1:Apartment {apartmentId: "apt-001"})
SET a1.location = "Ilioupoli",
    a1.rent = 350,
    a1.numberOfBathrooms = 1,
    a1.hasView = false,
    a1.petsAllowed = false;

MERGE (a2:Apartment {apartmentId: "apt-002"})
SET a2.location = "Glyfada",
    a2.rent = 450,
    a2.numberOfBathrooms = 2,
    a2.hasView = true,
    a2.petsAllowed = false;

MERGE (a3:Apartment {apartmentId: "apt-003"})
SET a3.location = "City Center",
    a3.rent = 400,
    a3.numberOfBathrooms = 1,
    a3.hasView = false,
    a3.petsAllowed = true;

// ---------- Owners ----------
MERGE (o1:Owner {ownerId: "owner-001"})
SET o1.name = "Owner One";

MERGE (o2:Owner {ownerId: "owner-002"})
SET o2.name = "Owner Two";

// ---------- Roommates ----------
MERGE (r1:Roommate {roommateId: "rm-001"})
SET r1.name = "Giorgos",
    r1.age = 24,
    r1.budget = 400,
    r1.lifestyle = "Quiet",
    r1.hasSharedBefore = true;

MERGE (r2:Roommate {roommateId: "rm-002"})
SET r2.name = "Kwstas",
    r2.age = 28,
    r2.budget = 300,
    r2.lifestyle = "Active",
    r2.hasSharedBefore = false;

MERGE (r3:Roommate {roommateId: "rm-003"})
SET r3.name = "Maria",
    r3.age = 25,
    r3.budget = 450,
    r3.lifestyle = "Quiet",
    r3.hasSharedBefore = true;

// ---------- Amenities ----------
MERGE (wifi:Amenity {amenityId: "am-001"})
SET wifi.name = "Wi-Fi",
    wifi.category = "Internet";

MERGE (parking:Amenity {amenityId: "am-002"})
SET parking.name = "Parking",
    parking.category = "Transport";

MERGE (heating:Amenity {amenityId: "am-003"})
SET heating.name = "Heating",
    heating.category = "Utility";

// ---------- Rules ----------
MERGE (rule1:Rule {ruleId: "ru-001"})
SET rule1.description = "Smoking is forbidden",
    rule1.type = "Smoking",
    rule1.isStrict = true;

MERGE (rule2:Rule {ruleId: "ru-002"})
SET rule2.description = "No pets allowed",
    rule2.type = "Pets",
    rule2.isStrict = true;

MERGE (rule3:Rule {ruleId: "ru-003"})
SET rule3.description = "Quiet hours after 23:00pm",
    rule3.type = "Noise",
    rule3.isStrict = false;

// ---------- Relationships ----------
MATCH
  (a1:Apartment {apartmentId: "apt-001"}),
  (a2:Apartment {apartmentId: "apt-002"}),
  (a3:Apartment {apartmentId: "apt-003"}),
  (o1:Owner {ownerId: "owner-001"}),
  (o2:Owner {ownerId: "owner-002"}),
  (r1:Roommate {roommateId: "rm-001"}),
  (r2:Roommate {roommateId: "rm-002"}),
  (r3:Roommate {roommateId: "rm-003"}),
  (wifi:Amenity {amenityId: "am-001"}),
  (parking:Amenity {amenityId: "am-002"}),
  (heating:Amenity {amenityId: "am-003"}),
  (rule1:Rule {ruleId: "ru-001"}),
  (rule2:Rule {ruleId: "ru-002"}),
  (rule3:Rule {ruleId: "ru-003"})
MERGE (o1)-[:OWNS]->(a1)
MERGE (o2)-[:OWNS]->(a2)
MERGE (o2)-[:OWNS]->(a3)
MERGE (r1)-[:LIVES_IN]->(a1)
MERGE (r2)-[:LIVES_IN]->(a2)
MERGE (r3)-[:LIVES_IN]->(a3)
MERGE (r1)-[:SHARED_BEFORE]->(r3)
MERGE (a1)-[:HAS_AMENITY]->(wifi)
MERGE (a1)-[:HAS_AMENITY]->(parking)
MERGE (a2)-[:HAS_AMENITY]->(heating)
MERGE (a3)-[:HAS_AMENITY]->(wifi)
MERGE (a3)-[:HAS_AMENITY]->(parking)
MERGE (a1)-[:HAS_RULE]->(rule1)
MERGE (a2)-[:HAS_RULE]->(rule2)
MERGE (a3)-[:HAS_RULE]->(rule3);

// ---------- Sanity check ----------
MATCH (a:Apartment)
OPTIONAL MATCH (a)-[:HAS_AMENITY]->(am:Amenity)
OPTIONAL MATCH (a)-[:HAS_RULE]->(ru:Rule)
RETURN
  a.apartmentId AS apartmentId,
  a.location AS location,
  a.rent AS rent,
  a.numberOfBathrooms AS numberOfBathrooms,
  a.petsAllowed AS petsAllowed,
  collect(DISTINCT am.name) AS amenities,
  collect(DISTINCT ru.description) AS rules
ORDER BY apartmentId;
