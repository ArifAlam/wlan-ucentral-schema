
# LLDP service configuration

set lldpd.config.description={{ s(lldp.describe) }}
set lldpd.config.lldp_location={{ s(lldp.location) }}
{% let interfaces = services.lookup_interfaces("lldp") %}
{% for (let interface in interfaces): %}
{%  for (let port in ethernet.lookup_by_interface_spec(interface)): %}
add_list lldpd.config.interface={{ s(port) }}
{%  endfor %}
{% endfor %}
