{{ '{%' }} from "{{ cookiecutter.formula_name }}/map.jinja" import {{ cookiecutter.formula_name }} with context {{ '%}' }}

{{ cookiecutter.formula_name }}:
  pkg.installed:
    - pkgs: {{ '{{' }} {{ cookiecutter.formula_name }}.pkgs {{ '}}' }}
  service:
    - running
    - name: {{ '{{' }} {{ cookiecutter.formula_name }}.service {{ '}}' }}
    - enable: True
    - require:
      - pkg: {{ cookiecutter.formula_name }}
