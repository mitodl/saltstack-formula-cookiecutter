{{ '{%' }} from "{{ cookiecutter.formula_name }}/map.jinja" import {{ cookiecutter.formula_name|replace('-', '_') }} with context {{ '%}' }}

include:
  - .install
  - .service

{{ cookiecutter.formula_name }}-config:
  file.managed:
    - name: {{ '{{' }} {{ cookiecutter.formula_name|replace('-', '_') }}.conf_file {{ '}}' }}
    - source: salt://{{ cookiecutter.formula_name }}/templates/conf.jinja
    - template: jinja
    - watch_in:
      - service: {{ cookiecutter.formula_name }}_service_running
    - require:
      - pkg: {{ cookiecutter.formula_name }}
