---
layout: archive
title: "Projects"
permalink: /projects/
author_profile: true
---

Here are some of the projects and workflows I’m exploring as an undergraduate bioscience and biotechnology student.

{% include base_path %}

<ul class="archive-projects">
  {% assign projects_collection = site.collections | where: "label", "projects" | first %}
  {% if projects_collection %}
    {% assign all_projects = projects_collection.docs | sort: "date" | reverse %}
    {% for project in all_projects %}
      <li>
        <h2><a href="{{ project.url | relative_url }}">{{ project.title }}</a></h2>
        {% if project.excerpt %}
          <p>{{ project.excerpt }}</p>
        {% endif %}
        {% if project.date %}
          <p><small>{{ project.date | date: "%B %d, %Y" }}</small></p>
        {% endif %}
      </li>
    {% endfor %}
  {% else %}
    <li>No projects found yet.</li>
  {% endif %}
</ul>
