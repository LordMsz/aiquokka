# AI Quokka

Yet Another OpenAI API client

_...for Quokkas are known for their cheerful demeanor_  - ChatGPT 3.5

[![Deploy web app to Azure Static Web Apps](https://github.com/LordMsz/aiquokka/actions/workflows/azure-staticwebapp.yml/badge.svg)](https://github.com/LordMsz/aiquokka/actions/workflows/azure-staticwebapp.yml)

Production: [Production link](https://gentle-river-0082c9d03.3.azurestaticapps.net/)

![image](https://github.com/LordMsz/aiquokka/assets/33070601/76afa89f-37f6-4eb2-b639-a5f4b5a88c08)

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

Disclaimer 2: this app is not designed to be replacement for official client, nor to work around any of its intended limitations. It also doesn't provide "free" access to any features or models.

### Developing it

Edit index.html, refresh, enjoy.

## Features

- Chat with latest models (GPT)
  - Ability to lead conversation with context, similar to official client
  - Access to API parameters such as Temperature, Frequency penalty or Seed
  - Exposed Token consumption details for each message
  - Easily select any text or conversation and share it in any form, on desktop or mobile (it's simple HTML after all!)
- Generating images with latest models (Dall-e)
  - Access to API parameters such as Size, HD quality or Style
  - (experimental) Ability to avoid auto-revised prompt with Dalle-3
  - Exposed Revised prompt (the re-written form of your prompt) for Dalle-3
  - Images easy to share with simple right click on desktop or tap-and-hold on mobile (it's simple HTML after all!)
  - Generate images right inside your standard text chat (note: the chat context is not used for image creation)
- All communication exposed
  - Use browser's Developer tools to see all network traffic with OpenAI API, explore how it works, make your own!
  - Debug the code directly to dive into how context is kept or how images are received
  - Create and send System and Assistant messages with single button press
- Tools support for integration, RAG and more
  - Using tools (aka functions) called by AI to allow interaction with your API and more!
  - Contains few built-in tools that AI can call on demand, such as "generate image" that uses your current image generator setup
  - (experimental) Has built-in function to auto-integrate any API using only chat with assistant (see notes below)
  - Tools can be de/activated to save token counts; all saved in IndexedDB locally
  - All tools are shared across all chats at the moment (an improvement for later?)
- Use OpenAI API key
  - Pay as you go, only for what you really use, only the tokens you truly utilized
  - You have an option to add credits to your account balance up front, and hard-stop when depleting it all (this is OpenAI API feature)
  - Access to all models and services (all Chat models and Generations/Image models for now; possiblty more in future)
  - You can use multiple different users/tokens if you want
  - Estimated cost shown on each response and also as total
- All chats stored in browser storage with ability to import, export and delete them
  - All chat and image data stored in Indexed DB locally on your device (there is no server behind this application, only pure OpenAI API)
  - Export all your chats and images (as base64) with single click to not lose it (yes, it's really stored only in browser; not the safest place!)
  - Import just as easily with picking the file; older versions of file structure will be auto-migrated up
  - All conversations auto-save imediatelly; you have option to delete any conversation to save space (backup before you do so!)
  - You can switch between conversations anytime
  - Estimated storage consumption is displayed in sidebar (this is browser estimate)
  - Tip: If you keep the file in some cloud-like storage, you can sync it this way between your devices (maybe a future feature?)
- General, UX and other
  - Option to install this application as Progressive Web App on your desktop/mobile for easier (read: fancy?) access (requires https hosting)
  - Responsive design for any resolution (nothing very pretty for now :))
  - Ctrl + Enter to send a chat on desktop (thx for contribution D!)
  - Swipe left and right to toggle the menu
  - Edit a chat name by clicking it

### Tools support
- Tools provide AI assistant with option to ask you (your client application) to do something, e.g. call API endpoint with certain parameters
- Experimentally added tool "integrate tool" can be used to integrate any API (GET only) using only prompts
- Example:
  - you need to enable "built_in_integrate_tool" tool and save it
  - then in a chat, you ask AI to "Integrate a tool for you"
  - AI will instruct you on what parameters it needs, you can still explain that in natural language
  - e.g. "I'd like to integrate a tool to this conversation. It's a tool to get resources from our system. URL looks following: https://reqres.in/api/flower?page=1 where "flower" is type of resource and "page=1" allows going through pages of list"
  - AI will understand the prompt and request a "tool call" with parameters (hopefully) matching the API call you expect
  - the tool call will add the tool to supported list and answer to AI with result of the operation
  - then, directly in same chat, you can ask AI to use that tool (has to be activated)
- General tool can be made by
  - passing in URL, e.g. https://reqres.in/api/{resource_type}?page={page}
  - specifying name and description
  - specifying parameters JSON Schema, fields inside it should match expected variables in the URL
  - e.g. for above, schema can be:

``` JSON Schema
{
    "type": "object",
    "properties": {
        "resource_type": {
            "type": "string",
            "description": "The type of resource to retrieve from the database."
        },
        "page": {
            "type": "integer",
            "description": "The page number to retrieve, allowing for pagination through the list of resources."
        }
    },
    "required": [
        "resource_type",
        "page"
    ]
}
```

## Contributing

If you'd like to contribute, please start with making an issue first and we can talk.