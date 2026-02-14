---
layout: archive
title: "Projects"
permalink: /projects/
author_profile: true
---

Here are some of the projects and workflows I’m exploring as an undergraduate bioscience and biotechnology student.

{% include base_path %}

{% assign projects_collection = site.collections | where: "label", "projects" | first %}
{% if projects_collection %}
  {% assign all_projects = projects_collection.docs | sort: "date" | reverse %}
  {% for project in all_projects %}
    {% include archive-single.html %}
  {% endfor %}
{% else %}
  <p>No projects found yet.</p>
{% endif %}
