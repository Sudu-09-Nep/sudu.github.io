---
layout: archive
title: "Projects"
permalink: /projects/
author_profile: true
---

Here are some of the projects and workflows I’m exploring as an undergraduate bioscience and biotechnology student.

<ul>
  {% for project in site.projects %}
    <li>
      <a href="{{ project.url | relative_url }}">{{ project.title }}</a> – {{ project.excerpt }}
    </li>
  {% endfor %}
</ul>
