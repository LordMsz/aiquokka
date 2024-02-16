# AI Quokka

Yet Another OpenAI API client

_...for Quokkas are known for their cheerful demeanor_  - ChatGPT 3.5

[![Deploy web app to Azure Static Web Apps](https://github.com/LordMsz/aiquokka/actions/workflows/azure-staticwebapp.yml/badge.svg)](https://github.com/LordMsz/aiquokka/actions/workflows/azure-staticwebapp.yml) [Production link](https://gentle-river-0082c9d03.3.azurestaticapps.net/)

## Table of Contents

- [Idea](#idea)
- [Getting started](#getting started)
- [Contributing](#contributing)

## Idea

_Let's create OpenAI client in single html page..._

No backend, no container (necessary), no dependencies, no 3rd party API.

Only pure vanilla Javascript calling pure OpenAI APIs using your API key.

Self-hosted by simply serving index.html on your infrastructure, or even just by copying file locally.

Goals:

- Main goal is to study abilities of OpenAI models and API and to create simple client for developers to be able to look under the hood.
- Main philosophy is to keep the integration as simple as possible and have all code in one or just few files for simple verification.
- Main strategy is to limit number of dependencies to 0.
- Main tactic is to store all history and configuration in browser storage (IndexedDB) and allow export.

Beneficial side-effect is access to latest models for fraction of price if used wisely.

## Getting started

### Using it

Simply navigate to [Production](https://gentle-river-0082c9d03.3.azurestaticapps.net/), optionally install it as Progressive Web App.

Open menu (there's swipe too!), add user, enter your API key and you're all set.


Alternatively copy the index.html page wherever you prefer and host it or open it directly.


Your API key **is only stored in your browser storage**.

Disclaimer: use at your own risk, read the code first.

### Developing it

Edit index.html, refresh, enjoy.

## Contributing

If you'd like to contribute, please start with making an issue first and we can talk.