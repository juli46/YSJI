from django import template

register = template.Library()

@register.filter
def split(value, delimiter=','):
    if not isinstance(value, str):
        return value
    return value.split(delimiter)

@register.filter
def trim(value):
    if isinstance(value, str):
        return value.strip()
    return value
