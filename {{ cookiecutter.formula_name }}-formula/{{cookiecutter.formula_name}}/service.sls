{{ '{%' }} from "{{ cookiecutter.formula_name }}/map.jinja" import {{ cookiecutter.formula_name|replace('-', '_') }} with context {{ '%}' }}

{{ cookiecutter.formula_name }}_service_running:
  service.running:
    - name: {{ '{{' }} {{ cookiecutter.formula_name|replace('-', '_') }}.service {{ '}}' }}
    - enable: True
