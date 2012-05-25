---
layout: post
category : projects
tags : [art, criticism]
tagline: building community
---
{% include JB/setup %}

{% for i in (6..22) %}

  <img alt="Art Crit Night {{ i }}" src="/images/art-crit-night/PA0902{% if i < 10 %}{{i | prepend:'0'  }}{%else%}{{ i }}{% endif %}.JPG" />
{% endfor %}