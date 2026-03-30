# 🗃️ Staff Database Management

> A Node.js CLI application to manage staff records — view, add, update and remove employees directly from your terminal.

[![Node.js](https://img.shields.io/badge/Node.js-339933?style=for-the-badge&logo=nodedotjs&logoColor=white)](https://nodejs.org)
[![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)](https://mysql.com)
[![Inquirer](https://img.shields.io/badge/Inquirer.js-000000?style=for-the-badge&logo=npm&logoColor=white)](https://www.npmjs.com/package/inquirer)

---

## ✨ Features

- 👥 View all employees with their role, department, salary and manager
- 🏢 Filter employees by department, manager or role
- ➕ Add a new employee — assign role and manager interactively
- ❌ Remove an employee by ID
- 🔄 Update an employee's role

---

## 🗄️ Database Schema

```
department          role                    employee
──────────────      ──────────────────      ──────────────────────
id  PK              id  PK                  id  PK
name                title                   first_name
                    salary                  last_name
                    department_id  FK  ───▶ role_id       FK
                                            manager_id    FK (self)
```

**Departments:** Admin · Teaching · Non-Teaching

**Roles (sample):** Science · Maths · English · Hindi · SST + Lab variants

---

## 🚀 Getting Started

### 1. Clone & install

```bash
git clone https://github.com/your-username/staff-database-management.git
cd staff-database-management
npm install
```

### 2. Set up the database

Open MySQL and run the schema + seed files in order:

```bash
mysql -u root -p < assets/sql/employees.sql
mysql -u root -p employees < assets/sql/seed.sql
```

### 3. Update your credentials

In `index.js`, update the connection block:

```js
const connection = mysql.createConnection({
    host: 'localhost',
    port: 3306,
    user: 'your_username',    // ← update this
    password: 'your_password', // ← update this
    database: 'employees'
});
```

### 4. Run

```bash
node index.js
```

---

## 🖥️ CLI Menu

```
? What would you like to do?
❯ View All Employees
  View All Employees By Department
  View All Employees By Manager
  View All Roles
  Add An Employee
  Remove An Employee
  Update Employee Role
  Exit
```

---

## 📁 Project Structure

```
staff-database-management/
│
├── assets/sql/
│   ├── employees.sql   # Schema: creates DB, tables & seeds data
│   └── seed.sql        # Utility SELECT queries for reference
│
├── index.js            # Main CLI app — all prompts & MySQL logic
├── package.json
└── README.md
```

---

## 🛠️ Dependencies

| Package | Purpose |
|---|---|
| `mysql` | MySQL connection & queries |
| `inquirer` | Interactive CLI prompts |
| `console.table` | Pretty-print query results as tables |