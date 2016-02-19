{{ cookiecutter.formula_name}} formula
{% for x in cookiecutter.formula_name %}={% endfor %}========

{{ cookiecutter.version }} ({{ cookiecutter.release_date }})
{# underline -#}
{% for x in cookiecutter.version %}-{% endfor -%}
{%- for x in cookiecutter.release_date %}-{% endfor -%}---

- First release
