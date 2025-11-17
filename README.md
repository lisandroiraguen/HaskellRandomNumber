# 🎲 Haskell Random Number Generator API

## Overview

This is a simple, stateless API designed to provide a single, cryptographically generated random number upon request. The service is built using the functional programming language **Haskell** and is deployed as a serverless function or web application on **Microsoft Azure**.

The API is intended for developers who require a straightforward source for unpredictable numerical data.

## Technology Stack

* **Language:** Haskell
* **Deployment:** Azure (likely an Azure Function or App Service)

---

## API Endpoint

The random number generator is exposed via a single HTTP `GET` endpoint.

| Method | URL | Description |
| :--- | :--- | :--- |
| `GET` | `https://haskellrandom-eagsd3b9b5haazdp.westus2-01.azurewebsites.net/api/HaskellTrigger` | Fetches a new, randomly generated integer. |

## Usage

### Requesting a Number

The API is accessed using a standard `GET` request. No headers or body parameters are typically required.

#### Example using `curl`

```bash
curl -X GET "[https://haskellrandom-eagsd3b9b5haazdp.westus2-01.azurewebsites.net/api/HaskellTrigger](https://haskellrandom-eagsd3b9b5haazdp.westus2-01.azurewebsites.net/api/HaskellTrigger)"
