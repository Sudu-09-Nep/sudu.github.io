---
layout: archive
title: "Projects"
permalink: /projects/
author_profile: true
---

Here are some of the projects and workflows I’m exploring as an undergraduate bioscience and biotechnology student.

{% include base_path %}

{% assign all_projects = site.projects | sort: 'date' | reverse %}

{% for project in all_projects %}
  {% include archive-single.html type='projects' %}
{% endfor %}
