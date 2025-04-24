# Cedar Policy Evaluation Example

This project demonstrates how to use **Cedar** to enforce **authorization policies** for an application that manages **bikes** and **users**. The policies define who can **view** or **update** bike information based on their role (e.g., vendor or customer).

## 📂 Files Structure

| File                | Purpose                                             |
|---------------------|-----------------------------------------------------|
| `policy.cedar`      | Contains the Cedar policies for authorization.      |
| `app.schema`        | Defines the schema for entities (User, Bike, Action).|
| `entities.json`     | Lists all entities (users, bikes, actions) and attributes. |
| `request-allow.json`| Authorization request expected to result in **ALLOW**.|
| `request-deny.json` | Authorization request expected to result in **DENY**.|

---

## 🧩 Entities

### Entity Types:

- **User**: Attributes include `vendor` (bool), `customer` (bool).
- **Bike**: Attributes include `brand` (string), `model` (string), `pricing` (long).
- **Action**: `getBike`, `updateBike`.

---

## 📝 Policies

1. **Allow all users** to **getBike** on any bike.
2. **Allow only vendors** to **updateBike**.
3. (Optional) Add more policies as needed for complex rules.

---

## ⚙️ Commands

### 1. **Validate Policies Against Schema**

```bash
cedar validate --schema app.schema --policies policy.cedar
```

### 2. **Authorize Request Against Policies**
```bash

cedar authorize --schema app.schema --policies policy.cedar --entities entities.json --request-json request-allow.json
```

or

```bash
cedar authorize --schema app.schema --policies policy.cedar --entities entities.json --request-json request-deny.json
```
