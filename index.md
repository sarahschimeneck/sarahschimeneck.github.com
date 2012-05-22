---
layout: default
title: Sarah Schimeneck | Philadelphia, PA
---
{% include JB/setup %}

<div class="container">

		<h1 id="hello">
		Sarah Schimeneck is a goal-driven, idealist
		focused on social responsibility and
		building artistic communities
		</h1>

	{% for category in site.categories %}
	<ul class="unstyled">
		<li>
			<strong>{{category[0] | join: "/"}}</strong>
			<ul class="unstyled">
			  {% assign posts = category[1] %}
			  {% for post in posts %}
			    <a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a>
			  {% endfor %}
			</ul>
		</li>
	</ul>
	{% endfor %}
</div>