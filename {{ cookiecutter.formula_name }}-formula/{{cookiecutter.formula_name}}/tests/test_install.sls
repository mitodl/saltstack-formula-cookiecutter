{{ '{%' }} from "{{cookiecutter.formula_name}}/map.jinja" import {{ cookiecutter.formula_name|replace('-', '_') }} with context {{ '%}' }}

{{ '{%' }} for pkg in {{ cookiecutter.formula_name|replace('-', '_') }}.pkgs {{ '%}' }}
{% raw %}test_{{pkg}}_is_installed:
  testinfra.package:
    - name: {{ pkg }}
    - is_installed: True
{% endfor %}{% endraw %}
