{% set k3s_master = salt['pillar.get']('k3s:server') %}
{% set k3s_token = salt['pillar.get']('k3s:token') %}

k3s_setup_agent1:
  cmd.run:
    - name: "curl -sfL https://get.k3s.io | sh -s - agent --server https://{{ k3s_master }}:6443 --token {{ k3s_token }}"