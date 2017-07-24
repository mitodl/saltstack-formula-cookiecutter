{{ cookiecutter.formula_name }}_service_running:
  service:
    - running
    - name: {{ '{{' }} {{ cookiecutter.formula_name|replace('-', '_') }}.service {{ '}}' }}
    - enable: True
