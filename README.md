Sure! Here is the README file in Markdown format:

---

# Mortgage Applications API

## Overview

This project is a Rails application that provides a RESTful API for managing mortgage applications. The API supports full CRUD (Create, Read, Update, Delete) operations for mortgage applications. Each mortgage application includes essential fields such as applicant name, loan amount, interest rate, loan term, monthly_payment and status.

## Features

- **CRUD Operations**: Manage mortgage applications with full create, read, update, and delete functionality.
- **Automatic monthly calculation**: Calculate the monthly payments based on interest rate and loan term.
- **Authentication**: Basic HTTP authentication to secure API endpoints.
- **Testing**: Comprehensive unit tests and integration tests for all API endpoints.

## Requirements

- Ruby 3.2.2
- Rails 7.1.3
- PostgreSQL (or another supported database)
## Getting Started

### Setup

1. **Clone the repository:**

    ```sh
    git clone https://github.com/giordanofalves/mortgage-api.git
    cd mortgage-api
    ```

2. **Install dependencies:**

    ```sh
    bundle install
    ```

3. **Set up the database:**

    ```sh
    rails db:setup
    ```

4. **Run the tests to ensure everything is set up correctly:**

    ```sh
    rspec spec
    ```

### Running the Server

To start the Rails server, run:

```sh
rails server
```

The API will be available at `http://localhost:3000`.

## API Endpoints

### Authentication

The API uses basic HTTP authentication. For testing purposes, the username and password are hardcoded in the code.

- **Username**: `admin`
- **Password**: `password`

### API Documentation
For a detailed overview of all API endpoints, including request parameters and response objects, please refer to our [Swagger documentation](https://bump.sh/giordano/doc/mortgage).

### CRUD Operations

#### List All Applications

- **Endpoint**: `GET /api/v1/mortgages`
- **Description**: Retrieve a list of all mortgage applications.

#### Create a New Application

- **Endpoint**: `POST /api/v1/mortgages`
- **Description**: Create a new mortgage application.
- **Parameters**:
  - `applicant_name`: string
  - `loan_amount`: float
  - `interest_rate`: float
  - `loan_term`: integer (in years)

#### Show a Specific Application

- **Endpoint**: `GET /api/v1/mortgages/:id`
- **Description**: Retrieve details of a specific mortgage application by ID.

#### Update an Application

- **Endpoint**: `PUT /api/v1/mortgages/:id`
- **Description**: Update an existing mortgage application.
- **Parameters**: Same as for creating an application.

#### Delete an Application

- **Endpoint**: `DELETE /api/v1/mortgages/:id`
- **Description**: Delete a specific mortgage application by ID.

## Testing

The project includes both unit tests and integration tests to ensure the reliability of the API.

- **Run all tests:**

    ```sh
    rspec spec
    ```

- **Run a specific test file:**

    ```sh
    rspec ./spec/controllers/api/v1/mortgages_controller_spec.rb
    ```

## Future Improvements

- Replace basic authentication with a more secure method, such as OAuth or JWT.
- Add more detailed validations and error handling.
- Implement pagination and filters for the list of applications.
- Enhance the API documentation.

---
