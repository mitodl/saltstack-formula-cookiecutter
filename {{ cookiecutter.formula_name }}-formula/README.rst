{% for x in cookiecutter.formula_name %}={% endfor %}
{{ cookiecutter.formula_name }}
{% for x in cookiecutter.formula_name %}={% endfor %}

{{ cookiecutter.formula_short_description }}

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.


Available states
================

.. contents::
    :local:

``{{ cookiecutter.formula_name }}``
{% for x in cookiecutter.formula_name %}-{% endfor %}----

TODO - add description of this state

``{{ cookiecutter.formula_name }}.install``
{% for x in cookiecutter.formula_name %}-{% endfor %}---------

Handles installation of {{ cookiecutter.formula_name }}

``{{ cookiecutter.formula_name }}.config``
{% for x in cookiecutter.formula_name %}-{% endfor %}---------

Handles configuration of {{ cookiecutter.formula_name }}


Template
========

This formula was created from a cookiecutter template.

See https://github.com/mitodl/saltstack-formula-cookiecutter.
