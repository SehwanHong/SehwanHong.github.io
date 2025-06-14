---
layout: default
lang: en
---

# Sehwan Hong

Simple Blog to talk about what I have learned on Artificial Intelligence

## Artificial Intelligence

{% assign ai_home = site.collections['artificial-intelligence'].docs | where: "slug", "index" | first %}
All information about Aritificial Intelligence is on [this page]({{ ai_home.url | relative_url }})
