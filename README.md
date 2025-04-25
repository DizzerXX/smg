
# Project Name

## Description

This project is a **chatbot application** integrated with OpenAI's API. The application allows users to interact with a chatbot, and it includes a backend API built with **Node.js** that communicates with the **OpenAI API**. The chatbot is designed to provide user-friendly interactions while also utilizing **Omni-moderation-2024-09-26** model to ensure safe conversations.

The project includes a **SQL database** for storing messages and interactions, and it's ready for deployment with Node.js 20.

## Table of Contents

- [Project Setup](#project-setup)
- [Requirements](#requirements)
- [Installation](#installation)
- [Database Setup](#database-setup)
- [Usage](#usage)
- [API Endpoints](#api-endpoints)
- [License](#license)

## Requirements

- **Node.js**: 20.x or higher
- **npm**: 8.x or higher (comes with Node.js)
- **MySQL**: Database server (for storing user chat interactions)
- **OpenAI API Key**: You need to set up your OpenAI API key.

## Installation

1. **Clone the repository**:

   ```bash
   git clone https://github.com/your-username/your-project-name.git
   cd your-project-name
   ```

2. **Install dependencies**:

   Make sure you have **Node.js 20** installed, then run:

   ```bash
   npm install
   ```

3. **Set up environment variables**:

   Create a `.env` file in the root directory and add your OpenAI API Key:

   ```
   OPENAI_API_KEY=your-openai-api-key-here
   DB_HOST=localhost
   DB_USER=root
   DB_PASSWORD=your-database-password
   DB_NAME=your-database-name
   ```

4. **Install and configure MySQL**:

   Ensure MySQL is installed on your system and the database is set up using the provided SQL file.

   Run the following command to set up the database schema:

   ```bash
   mysql -u root -p < path/to/your/database.sql
   ```

## Database Setup

The project includes a **SQL schema** file (`database.sql`) to set up the required database structure. After importing the SQL file into your MySQL database, you should have a database with the necessary tables to store chat messages and interactions.

- **Database File**: `database.sql`

## Usage

1. **Run the Node.js server**:

   To start the server, run:

   ```bash
   npm start
   ```

   This will start the Node.js server and the API will be available at `http://localhost:5000`.

2. **Interact with the chatbot**:

   The chatbot will be available via the web interface (or other front-end implementation). Users can input their messages, which will be processed by the backend and the response from OpenAI will be displayed.

## API Endpoints

- **POST /api/chatbot**  
  This endpoint sends user input to the backend, which in turn communicates with OpenAI's API and returns the chatbot's response.

  **Request body**:
  ```json
  {
    "message": "User's message here"
  }
  ```

  **Response**:
  ```json
  {
    "response": "Bot's response here"
  }
  ```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
