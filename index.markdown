---
layout: default
lang: en
---

# Sehwan Hong

Simple Blog to talk about what I have learned on Artificial Intelligence

## Artificial Intelligence

{% assign ai_home = site.documents | where_exp: "item", "item.collection == 'artificial-intelligence' and item.slug == 'index'" | first %}
All information about Aritificial Intelligence is on [this page]({{ ai_home.url | relative_url }})
