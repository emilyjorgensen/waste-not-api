# Waste-Not: Kitchen (Backend)

## Overview

This is the backend for waste-not-api, a Rails API that manages ingredients and pantry items for household organization to reduce food waste. The API is designed to handle users, ingredients, and pantry items with associated categories for filters and other functionalities.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [API Endpoints](#api-endpoints)
- [Authentication](#authentication)
- [Models](#models)

## Installation

1. **Clone the repository**

```bash
git clone https://github.com/emilyjorgensen/waste-not-api.git
cd waste-not-api
```

2. **Install Dependencies**

```bash
bundle install
```

3. **Database Setup**

```bash
rails db:create
rails db:migrate
```

4. **Seed the Database:**

```bash
rails db:seed
```

## Usage

**Start the Rails server:**

```bash
rails server
```

The API will be accessible at http://localhost:3000/

## Authentication

This API uses JSON Web Tokens (JWT) for authentication. To access protected routes, include the JWT token in the Authroization header of your requests.

Example
curl -H "Authorization: Bearer YOUR_JWT_TOKEN" http://localhost:3000/pantry_items
