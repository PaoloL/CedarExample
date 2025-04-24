# Cedar Policy Evaluation Example

This project demonstrates how to use **Cedar** to enforce **authorization policies** for an application that manages **bikes** and **users**. The policies define who can **view** or **update** bike information based on their role (e.g., vendor or customer).

## Files Structure

The project contains several files:

| File                | Purpose                                             |
|---------------------|-----------------------------------------------------|
| `policy.cedar`      | Contains the Cedar policies for authorization.      |
| `app.schema`        | Defines the schema for entities (User, Bike, Action).|
| `entities.json`     | Lists all entities (users, bikes, actions) and attributes. |
| `request-allow.json`| Authorization request expected to result in **ALLOW**.|
| `request-deny.json` | Authorization request expected to result in **DENY**.|

---

## CLI available Commands

The following commands are available using the Cedar CLI:

| Command | Purpose | What it Evaluates | When to Use |
|---------|---------|-------------------|-------------|
| cedar validate | Validates policies against the schema | Checks syntax and schema compliance of policies | When writing or updating policies
| cedar evaluate | Evaluates a single expression | Expressions only (e.g., principal.vendor == true) | When testing conditions or attributes logic without a policy file
| cedar authorize | Runs a full authorization request against policies | Policies + request + entities + schema | When performing authorization decisions (ALLOW/DENY)

---

## Entities

### Entity Types:

- **User**: Attributes include `vendor` (bool), `customer` (bool).
- **Bike**: Attributes include `brand` (string), `model` (string), `pricing` (long).
- **Action**: `getBike`, `updateBike`.

---

## Policies

1. **Allow all users** to **getBike** on any bike.
2. **Allow only vendors** to **updateBike**.
3. (Optional) Add more policies as needed for complex rules.

---

## Commands

### 1. **Validate Policies Against Schema**

```bash
cedar validate --schema app.schema --policies policy.cedar
```

### 2. **Authorize Request Against Policies**

Expected Result: ALLOW
```bash
cedar authorize --policies policy.cedar --entities entities.json --request-json request-allow.json -v
```

Expected Result: DENY

```bash
cedar authorize --policies policy.cedar --entities entities.json --request-json request-deny.json -v
```

### 3. **Evaluate Expression**
Evaluate expressions directly from the command line:

```bash
cedar evaluate "principal.vendor == true" --entities entities.json --request-json request-allow.json
```

More Complex Expression:

```bash
cedar evaluate "principal.vendor == true && resource.pricing > 8000" --entities entities.json --request-json request-allow.json
```

## Reference
[Sample Data](https://github.com/cedar-policy/cedar/tree/main/cedar-policy-cli/sample-data)

