Cost Benefit Analysis
=====================

=====================================

Overview
--------

* * * * *

Welcome to the **Cost Benefit Analysis App**! This application allows you to be able to analyze the costs and benefits of decisions/strategies/plans, etc. The app is built using modern web technologies including React, TypeScript, Vite, @tanstack/react-query, @tanstack/react-form, @tanstack/react-router, and Chakra UI, along with a backend powered by Elixir and Phoenix, and data persistence using PostgreSQL.

Table of Contents
-----------------

1.  [Usage](#usage)
2.  [Features](#features)
3.  [Components](#components)
4.  [Installation](#installation)

Usage
-----

### Adding a New Analysis

Currently don't have analyses set up yet

### Adding a New Benefit

1.  Click on the "Add" button in the **Benefit** column.
2.  Fill in the description and weight fields in the modal.
3.  Click **Save** to submit the form.

The new benefit will be saved to the database and immediately displayed in the analysis.

### Adding a New Cost

Currently don't have costs set up yet

Features
--------

-   **Cost and Benefit Management**: Add, view, and manage costs and benefits.
-   **Form Validation**: Built-in validation to ensure accurate data entry.
-   **Responsive Design**: User-friendly interface powered by Chakra UI.
-   **Data Persistence**: PostgreSQL for reliable data storage.
-   **Server-Side Management**: Elixir/Phoenix backend for handling business logic.
-   **Efficient Data Handling**: @tanstack/react-query for fetching and caching.

Components
----------

### Forms and Validation

-   **@tanstack/react-form**: Manages form state and validation.
-   **Validation Rules**: Ensures all fields meet required criteria.

### Routing

-   **@tanstack/router**: Manages client-side routing with React and TypeScript.

Getting Started
---------------

* * * * *

### Prerequisites

-   Node.js (for frontend development)
-   Elixir (for backend development)
-   PostgreSQL (for database)

### Installation

#### Step 1: Clone the repository

Insert in Terminal

`git clone https://github.com/rcartwright/cost_benefit_analysis.git`

#### Step 2: Install dependencies

-   Frontend: `npm install` (in `client/` directory)
-   Backend: `mix deps.get` (in `server/` directory)

#### Step 3: Create db and tables

- Backend: `mix ecto.migrate` (in `server/` directory)

#### Step 4: Seed data

- Currently seeding is not set up so you'll need to create one analysis in the database with the id of 2 for now

#### Step 5: Start the application

-   Frontend: `npm run dev` (in `client/` directory)
-   Backend: `mix phx.server` (in `server/` directory)


