{{ '{%' }} from "{{ cookiecutter.formula_name }}/map.jinja" import {{ cookiecutter.formula_name|replace('-', '_') }} with context {{ '%}' }}

include:
  - .service

{{ cookiecutter.formula_name }}:
  pkg.installed:
    - pkgs: {{ '{{' }} {{ cookiecutter.formula_name|replace('-', '_') }}.pkgs {{ '}}' }}
    - require_in:
        - service: {{ cookiecutter.formula_name }}_service_running
