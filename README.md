This repository includes an Antigravity agent pipeline.
Simply describe your Liquid Galaxy app idea, and the system will guide you through design, implementation, and testing automatically.



# LG Flutter Starter Kit

A reusable Flutter starter kit for building Liquid Galaxy applications, designed for the Gemini Summer of Code contest.

## 🎯 Purpose
This project provides:
- A clean Flutter skeleton for Liquid Galaxy apps
- Prebuilt SSH and command services
- Environment-aware LG interaction
- Agentic workflow to generate future apps using Gemini + Antigravity

## 🏗️ Architecture

lib/
core/ → constants & utilities
services/
lg/ → connection, commands, environment detection
api/ → external APIs (Wikipedia example)
presentation/
screens/ → UI pages
widgets/ → reusable widgets


## 🤖 Agent System

Located in `.agent/`

Pipeline:

Init → Brainstorm → Plan → Execute → Review → Quiz


These skills guide Gemini to generate Flutter LG apps using this starter kit.

## 🚀 Running

1. Run Flutter app
2. Enter LG Master IP, username, password
3. Connect
4. Test commands or generate demo app

## 🧪 Demo Features

- SSH connection to LG
- Example LG commands
- External API integration example (Wikipedia → KML marker)

## 📹 Contest Deliverables

This repo includes:

✔ Flutter starter kit  
✔ Agentic system (.agent folder)  
✔ Documentation  

A separate repo demonstrates an app generated using this system.

---

Built for **Gemini Summer of Code 2026**.
