---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: default
lang: ko
---

## 연동된 AI 리포지토리의 문서 목록

{% if site.data.ai_repo_files and site.data.ai_repo_files.files.size > 0 %}
  <ul>
    {% for file in site.data.ai_repo_files.files %}
      <li><a href="{{ file.url }}" target="_blank">{{ file.name }}</a></li>
    {% endfor %}
  </ul>
{% else %}
  <p>아직 불러온 문서 목록이 없거나, 데이터를 가져오는 중입니다. GitHub Actions가 실행된 후 목록이 표시됩니다.</p>
{% endif %}


# Sehwan Hong

Simple website to talk about what I have learned on Artificial Intelligence

## Artificial Intelligence

All information about Aritificial Intelligence is on [this page](../Artificial-Intelligence)
