{{ '{%' }} from "{{ cookiecutter.formula_name }}/map.jinja" import {{ cookiecutter.formula_name }}, {{ cookiecutter.formula_name }}_config with context {{ '%}' }}

include:
  - {{ cookiecutter.formula_name }}

{{ cookiecutter.formula_name }}-config:
  file.managed:
    - name: {{ '{{' }} {{ cookiecutter.formula_name }}.conf_file {{ '}}' }}
    - source: salt://{{ cookiecutter.formula_name }}/templates/conf.jinja
    - template: jinja
    - context:
      config: {{ '{{' }} {{ cookiecutter.formula_name }}_config {{ '}}' }}
    - watch_in:
      - service: {{ cookiecutter.formula_name }}
    - require:
      - pkg: {{ cookiecutter.formula_name }}
